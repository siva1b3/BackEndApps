// userAuthRoutes.ts;
import express from "express";

import { loginUser } from "../controllers/loginController";

const router = express.Router();

router.post("/login", loginUser);
router.post("/register", (req, res) =>
  res.send("Register route not implemented")
);
router.post("/logout", (req, res) =>
  res.send("Register route not implemented")
);

export default router;
