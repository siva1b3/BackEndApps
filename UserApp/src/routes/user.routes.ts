import express from "express";

import { userController } from "../controllers/controllers.js";

const userRouter = express.Router();

userRouter.route("/users").get(userController.getAllUsers);

export default userRouter;
