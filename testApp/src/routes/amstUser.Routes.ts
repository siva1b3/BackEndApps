import express from "express";
import { amstUserController } from "../controllers/index.js";

const router = express.Router();

// Get all users
router.get("/getAllUsers", amstUserController.getAllUsers);

// Create a new user
router.post("/createUser", amstUserController.createUser);

// Get a user by ID
router.get("/getUser/:id", amstUserController.getUser);

// Update a user by ID
router.put("/updateUser/:id", amstUserController.updateUser);

// Delete a user by ID
router.delete("/deleteUser/:id", amstUserController.deleteUser);

router.get("/gridData", amstUserController.gridData);

export default router;
