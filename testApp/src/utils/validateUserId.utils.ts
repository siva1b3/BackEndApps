import { CustomError } from "../types/index.js";

// Helper function to validate userId
const validateUserId = (userId: string | number): number => {
  const id = Number(userId);
  if (isNaN(id)) {
    const error: CustomError = new Error("Invalid user ID. Must be a number.");
    error.statusCode = 400; // Bad Request
    throw error;
  }
  return id;
};

export default validateUserId;
