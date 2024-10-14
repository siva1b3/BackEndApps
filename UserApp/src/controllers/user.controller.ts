import { Request, Response } from "express";

import { userService } from "../services/services.js";
import { SuccessHttpStatusCode, ErrorHttpStatusCode } from "../enums/enums.js";
import { ErrorType, ResponseType } from "../types/types.js";
import { User } from "@prisma/client";

const getAllUsers = async (req: Request, res: Response) => {
  const userData: ResponseType<User> = await userService.getAllUsers();
  res.status(userData.status).json(userData.body);
};

const userController = {
  getAllUsers,
};

export default userController;
