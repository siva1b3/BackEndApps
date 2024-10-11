// locationController.ts
import { Request, Response } from "express";

import { getAllLocations } from "../services/locationRetrieveService";
import { Location } from "../types/locationTypes";

async function getAllLocationData(req: Request, res: Response) {
  try {
    const locations: Location[] = await getAllLocations();
    res.json({ success: true, data: locations });
  } catch (err) {
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
}

export { getAllLocationData };
