// loginController.ts

import { Request, Response } from "express";

import { loginService } from "../services/loginService";
import { requestLoginType, responseLoginType } from "../types/loginTypes";

async function loginUser(req: Request, res: Response) {
  const loginData: requestLoginType = req.body;
  const token: responseLoginType = await loginService(loginData);
  res.status(200).json(token);
}

export { loginUser };
