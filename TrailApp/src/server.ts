import app from "./app.js";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

app.listen(3002, async () => {
  try {
    const DateTime: { DATE: string }[] =
      await prisma.$queryRaw`SELECT GETDATE() AS DATE`;
    console.log("Current Date and Time:", DateTime[0].DATE);
    console.log("Server is running on http://localhost:3002");
  } catch (error) {
    if (error instanceof Error) {
      console.error("Error fetching date:", error.message);
    } else {
      console.log("Unkown Error");
    }
  }
});
