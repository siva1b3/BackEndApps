import { Request, Response, NextFunction } from "express";
import { ServerErrorHttpCodes } from "../enums/emums.js";
import { ResponseType, ErrorType } from "../types/types.js";
import { User } from "@prisma/client";
import { userService } from "../services/services.js";

const fetchAllUsersController = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const usersResponse = await userService.fetchAllUsersService();

    if ("status" in usersResponse && usersResponse.status >= 400) {
      return next(usersResponse);
    } else {
      const response = usersResponse as ResponseType<User>;
      res.status(response.status).json(response.body);
    }
  } catch (err: unknown) {
    const errorResponse: ErrorType = {
      status: ServerErrorHttpCodes.InternalServerError,
      message: err instanceof Error ? err.message : "An unknown error occurred",
      name: err instanceof Error ? err.name : "UnknownError",
    };
    next(errorResponse); // Pass the error to the next middleware
  }
};

const userController = {
  fetchAllUsersController,
};

export default userController;
