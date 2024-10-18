import app from "./app.js";
import { PORT } from "./constants/constants.js";
import Prisma from "./prisma/prisma.js";

app.listen(PORT, async () => {
  try {
    const data: { DATE: string }[] =
      await Prisma.$queryRaw`SELECT GETDATE() AS DATE`;

    if (!Array.isArray(data) || data.length === 0 || !data[0].DATE) {
      console.error(
        "Failed to connect to SQL Server: No date returned from the query."
      );
      return; // Exit the listener if the connection fails
    }

    console.log(
      "Successfully connected to SQL Server. Current date and time:",
      data[0].DATE
    );
    console.log(`Server is running on port ${PORT}.`);
  } catch (error) {
    console.error("Failed to start the server due to an error:", error);
  }
});
