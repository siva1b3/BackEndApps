import { Request, Response, NextFunction } from "express";
import { ErrorType } from "../types/types.js";
import { ServerErrorHttpCodes } from "../enums/emums.js";

const errorHandler = async (
  err: ErrorType,
  req: Request,
  res: Response<ErrorType>,
  next: NextFunction
) => {
  // Log the error (consider using a logging library)
  console.error(err);

  const response: ErrorType = {
    status: err.status || ServerErrorHttpCodes.InternalServerError,
    message: err.message || "An unexpected error occurred.",
    name: err.name || "UnknownError",
  };

  // In development mode, include additional error details
  if (process.env.NODE_ENV === "development") {
    response.stack = err.stack; // Assuming ErrorType can have a stack property
  }

  res.status(response.status).json(response);
};

export default errorHandler;
