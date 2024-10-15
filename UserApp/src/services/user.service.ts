import {
  SuccessHttpCodes,
  ClientErrorHttpCodes,
  ServerErrorHttpCodes,
} from "../enums/emums.js";
import { ResponseType, ErrorType } from "../types/types.js";
import Prisma from "../prisma/prisma.js";
import { User } from "@prisma/client";

const fetchAllUsersService = async (): Promise<
  ResponseType<User> | ErrorType
> => {
  try {
    const users: User[] = await Prisma.user.findMany();

    if (!Array.isArray(users) || users.length === 0) {
      return {
        status: ClientErrorHttpCodes.NotFound,
        message: "Users not found",
        name: "NotFoundError",
      } as ErrorType;
    }

    return {
      status: SuccessHttpCodes.OK,
      body: users,
    } as ResponseType<User>;
  } catch (error: unknown) {
    const errorMessage =
      error instanceof Error ? error.message : "Unknown error";
    const errorName =
      error instanceof Error ? error.name : "InternalServerError";

    return {
      status: ServerErrorHttpCodes.InternalServerError,
      message: errorMessage,
      name: errorName,
    } as ErrorType;
  }
};

const userService = {
  fetchAllUsersService,
};

export default userService;
