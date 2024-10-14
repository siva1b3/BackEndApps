// Import the main application instance
import app from "./app.js";
import prisma from "./prisma/prisma.js";

// Import the defined port constant
import { PORT } from "./constants/constants.js";

// Start the server and listen on the specified PORT
app.listen(PORT, async () => {
  try {
    // Fetch the current date and time from the database using a raw SQL query
    const DateTime: { DATE: string }[] =
      await prisma.$queryRaw`SELECT GETDATE() AS DATE`;
    // Log the current date and time to the console
    console.log("Current Date and Time:", DateTime[0].DATE);
    // Log a message indicating that the server is running
    console.log("Server is running on http://localhost:3002");
  } catch (error) {
    // Handle any errors that occur during the database query
    if (error instanceof Error) {
      console.error("Error fetching date:", error.message);
      // Log the error message if it's an instance of Error
    } else {
      console.log("Unknown Error");
      // Log a generic error message for unexpected errors
    }
  }
});
