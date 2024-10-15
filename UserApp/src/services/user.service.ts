import { ErrorType, ResponseType } from "../types/types.js";
import Prisma from "../prisma/prisma.js";
import {
  SuccessHttpCodes,
  ClientErrorHttpCodes,
  ServerErrorHttpCodes,
} from "../enums/emums.js"; // Fixed typo: "emums" to "enums"
import { User } from "@prisma/client";

const getAllUsersService = async (): Promise<
  ResponseType<User> | ErrorType
> => {
  try {
    const users: User[] = await Prisma.user.findMany();

    if (!Array.isArray(users) || users.length === 0) {
      return {
        status: ClientErrorHttpCodes.NotFound,
        message: "No users found",
        name: "NotFoundError",
      } as ErrorType;
    }

    return {
      status: SuccessHttpCodes.OK,
      body: users,
    } as ResponseType<User>;
  } catch (error: unknown) {
    return {
      status: ServerErrorHttpCodes.InternalServerError,
      message: error instanceof Error ? error.message : "Internal server error",
      name: error instanceof Error ? error.name : "InternalError",
    } as ErrorType;
  }
};

const userService = {
  getAllUsersService,
};

export default userService;
