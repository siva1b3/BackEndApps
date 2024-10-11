// locationCreateService.ts
import { insertLocation } from "../models/locationCreateModel";
import { Location } from "../types/locationTypes";

async function addLocation(location: Location): Promise<void> {
  try {
    await insertLocation(location);
  } catch (err) {
    console.error("Error adding location:", err);
    throw err;
  }
}

export { addLocation };
