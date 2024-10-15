import express from "express";
import { userController } from "../controller/controllers.js";

const UserRouter = express.Router();

UserRouter.get("/users", userController.fetchAllUsersController);

export default UserRouter;
