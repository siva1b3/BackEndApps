import { Request, Response, NextFunction } from "express";
import { amstUserService } from "../services/index.js";
import { validateUserId } from "../utils/index.js";
import { AmstUser } from "@prisma/client";
import { RegularResponse } from "../types/index.js";

// Fetch all users
const getAllUsers = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    console.log("Fetching all users");
    const response: RegularResponse<AmstUser> =
      await amstUserService.getAllUsers();
    console.log("All users fetched successfully");
    res.status(response.status).json(response.body);
  } catch (error) {
    console.error("Error fetching users", error);
    next(error);
  }
};

// Create a new user
const createUser = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    console.log("Creating a new user with data:", req.body);
    const response: RegularResponse<AmstUser> =
      await amstUserService.createUser(req.body);
    console.log("User created successfully", response.body);
    res.status(response.status).json(response.body);
  } catch (error) {
    console.error("Error creating user", error);
    next(error);
  }
};

// Get a single user by ID
const getUser = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const userId = validateUserId(req.params.id); // Validate and convert ID
    console.log(`Fetching user with ID: ${userId}`);
    const response: RegularResponse<AmstUser> = await amstUserService.getUser(
      userId
    );
    console.log(`User fetched successfully: ${userId}`);
    res.status(response.status).json(response.body);
  } catch (error) {
    console.error(`Error fetching user with ID: ${req.params.id}`, error);
    next(error);
  }
};

// Update an existing user
const updateUser = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const userId = validateUserId(req.params.id); // Validate and convert ID
    console.log(`Updating user with ID: ${userId}`);
    const response: RegularResponse<AmstUser> =
      await amstUserService.updateUser(userId, req.body);
    console.log(`User with ID: ${userId} updated successfully`);
    res.status(response.status).json({
      message: "User updated successfully",
      userId,
      data: response.body,
    });
  } catch (error) {
    console.error(`Error updating user with ID: ${req.params.id}`, error);
    next(error);
  }
};

// Delete a user by ID
const deleteUser = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const userId = validateUserId(req.params.id); // Validate and convert ID
    console.log(`Deleting user with ID: ${userId}`);
    const response: RegularResponse<AmstUser> =
      await amstUserService.deleteUser(userId);
    console.log(`User with ID: ${userId} deleted successfully`);
    res.status(response.status).json({
      message: "User deleted successfully",
      data: response.body,
    });
  } catch (error) {
    console.error(`Error deleting user with ID: ${req.params.id}`, error);
    next(error);
  }
};

const gridData = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const gridData: RegularResponse<AmstUser> =
      await amstUserService.getGridData();
    res.status(gridData.status).json(gridData.body);
  } catch (error) {
    console.error(`Error getting user data:`, error);
    next(error);
  }
};

const amstUserController = {
  getAllUsers,
  createUser,
  getUser,
  updateUser,
  deleteUser,
  gridData,
};

export default amstUserController;
