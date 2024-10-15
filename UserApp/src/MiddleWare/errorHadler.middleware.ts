import { Request, Response, NextFunction } from "express";
import { ErrorType } from "../types/types.js";
import { ServerErrorHttpCodes } from "../enums/emums.js";

const errorHandler = (
  err: ErrorType,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  // Log the error for debugging purposes
  console.error(err);

  const status = err.status || ServerErrorHttpCodes.InternalServerError;
  const message = err.message || "An unknown error occurred";
  const name = err.name || "Unknown Error";

  const response: ErrorType = {
    status,
    message,
    name,
  };

  res.status(status).json(response);
};

export default errorHandler;
