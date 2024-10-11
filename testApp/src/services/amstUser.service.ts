import prisma from "../prisma/client.prisma.js";
import { AmstUser } from "@prisma/client";
import { RegularResponse } from "../types/index.js";

const getAllUsers = async () => {
  try {
    const allUsers: AmstUser[] = await prisma.amstUser.findMany();
    if (allUsers.length > 0) {
      const data: RegularResponse<AmstUser> = {
        status: 200,
        body: allUsers,
      };
      return data;
    } else {
      const data: RegularResponse<AmstUser> = {
        status: 204,
        body: { message: "no data is there" },
      };
      return data;
    }
  } catch (error) {
    if (error instanceof Error) {
      throw new Error("Error fetching users: " + error.message);
    } else {
      throw new Error("Error fetching users: Unknown error");
    }
  }
};

const createUser = async (data: AmstUser) => {
  try {
    const user = await prisma.amstUser.create({
      data: {
        ...data,
      },
    });
    const userData: RegularResponse<AmstUser> = {
      status: 201,
      body: user,
    };
    return userData;
  } catch (error) {
    if (error instanceof Error) {
      throw new Error("Error fetching users: " + error.message);
    } else {
      throw new Error("Error fetching users: Unknown error");
    }
  }
};

const getUser = async (id: number) => {
  try {
    const user: AmstUser | null = await prisma.amstUser.findUnique({
      where: {
        UserID: id,
      },
    });

    // Define the response based on whether the user was found or not
    if (user === null) {
      const data: RegularResponse<AmstUser> = {
        status: 404,
        body: { message: "No user found" },
      };
      return data;
    }

    const data: RegularResponse<AmstUser> = {
      status: 200,
      body: user,
    };

    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw new Error("Error fetching users: " + error.message);
    } else {
      throw new Error("Error fetching users: Unknown error");
    }
  }
};

const updateUser = async (id: number, data: AmstUser) => {
  try {
    const updateUser: AmstUser = await prisma.amstUser.update({
      where: {
        UserID: id,
      },
      data: {
        ...data,
      },
    });

    const userData: RegularResponse<AmstUser> = {
      status: 200,
      body: updateUser,
    };

    return userData;
  } catch (error) {
    if (error instanceof Error) {
      throw new Error("Error fetching users: " + error.message);
    } else {
      throw new Error("Error fetching users: Unknown error");
    }
  }
};

const deleteUser = async (id: number) => {
  try {
    const deleteUser = await prisma.amstUser.delete({
      where: {
        UserID: id,
      },
    });

    const data: RegularResponse<AmstUser> = {
      status: 200,
      body: deleteUser,
    };

    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw new Error("Error fetching users: " + error.message);
    } else {
      throw new Error("Error fetching users: Unknown error");
    }
  }
};

const getGridData = async () => {
  try {
    const gridData: Partial<AmstUser>[] = await prisma.amstUser.findMany({
      select: {
        UserID: true,
        UserName: true,
        TwoFactorEnabled: true,
        LastLoginDate: true,
      },
    });

    const data: RegularResponse<AmstUser> = {
      status: 200,
      body: gridData,
    };

    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw new Error("we got an error" + error.message);
    } else {
      throw new Error("unkoown error");
    }
  }
};

const amstUserService = {
  getAllUsers,
  createUser,
  getUser,
  updateUser,
  deleteUser,
  getGridData,
};

export default amstUserService;
