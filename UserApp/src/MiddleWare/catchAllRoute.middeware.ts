import { Request, Response } from "express";
import { ErrorType } from "../types/types.js";
import { ClientErrorHttpCodes } from "../enums/emums.js";

const catchAllRoute = (req: Request, res: Response) => {
  const response: ErrorType = {
    status: ClientErrorHttpCodes.NotFound,
    message: "Resource not found",
    name: "NotFoundError",
  };
  res.status(response.status).json(response);
};

export default catchAllRoute;
