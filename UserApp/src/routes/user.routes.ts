import express from "express";
import { UserController } from "../controller/controllers.js";

const userRouter = express.Router();

userRouter.get("/users", UserController.getAllUsersController);

export default userRouter;
