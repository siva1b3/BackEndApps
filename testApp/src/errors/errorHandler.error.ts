import { Request, Response, NextFunction } from "express";

// Custom error interface extending Error object
interface CustomError extends Error {
  statusCode?: number;
  message: string;
}

// Centralized Error Handler Middleware
const errorHandler = (
  err: CustomError,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  // Set default values for error
  const statusCode = err.statusCode || 500; // Internal Server Error if not specified
  const message = err.message || "Something went wrong";

  // Respond with JSON format error message
  res.status(statusCode).json({
    success: false,
    error: {
      message,
      statusCode,
    },
  });
};

export default errorHandler;
