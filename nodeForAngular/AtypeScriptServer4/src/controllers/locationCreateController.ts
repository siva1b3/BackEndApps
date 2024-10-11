// locationCreateController.ts

import { Request, Response } from "express";
import { addLocation } from "../services/locationCreateService";
import { Location } from "../types/locationTypes";
import { validateLocation } from "../validators/locationValidator";

async function createLocation(req: Request, res: Response) {
  const location: Location = req.body;

  const validationErrors = validateLocation(location);
  if (validationErrors.length > 0) {
    return res.status(400).json({ success: false, errors: validationErrors });
  }

  try {
    await addLocation(location);
    res
      .status(201)
      .json({ success: true, message: "Location added successfully" });
  } catch (err) {
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
}

export { createLocation };
