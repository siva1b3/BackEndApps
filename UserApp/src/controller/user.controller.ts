import { Request, Response, NextFunction } from "express";
import { ErrorType, ResponseType } from "../types/types.js";
import {
  SuccessHttpCodes,
  ClientErrorHttpCodes,
  ServerErrorHttpCodes,
} from "../enums/emums.js";
import { User } from "@prisma/client";
import { userService } from "../services/services.js";

const getAllUsersController = async (
  req: Request<{}, {}, {}, {}>,
  res: Response<ResponseType<User>["body"]>,
  next: NextFunction
) => {
  try {
    const user: ResponseType<User> | ErrorType =
      await userService.getAllUsersService();

    if ("body" in user) {
      const data = user as ResponseType<User>;
      res.status(data.status).json(data.body);
    } else {
      next(user as ErrorType);
    }
  } catch (error: unknown) {
    const data = {
      status: ServerErrorHttpCodes.InternalServerError,
      message: error instanceof Error ? error.message : "Internal server error",
      name: error instanceof Error ? error.name : "InternalError",
    } as ErrorType;
    next(data);
  }
};

const UserController = { getAllUsersController };

export default UserController;
