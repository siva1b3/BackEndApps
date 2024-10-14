import { SuccessHttpStatusCode, ErrorHttpStatusCode } from "../enums/enums.js";
import { ErrorType, ResponseType } from "../types/types.js";
import prisma from "../prisma/prisma.js";

import { User } from "@prisma/client";

const getAllUsers = async () => {
  const userData: User[] = await prisma.user.findMany({
    include: {
      UserDetail_UserDetail_user_idToUser: true,
    },
  });
  const data: ResponseType<User> = {
    status: SuccessHttpStatusCode.OK,
    body: userData,
  };
  return data;
};

const userService = {
  getAllUsers,
};

export default userService;
