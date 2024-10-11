// locationService.ts

import { fetchAllLocations } from "../models/locationRetrieveModel";
import { Location } from "../types/locationTypes";

async function getAllLocations(): Promise<Location[]> {
  try {
    const locations = await fetchAllLocations();
    return locations;
  } catch (err) {
    console.error("Error fetching locations:", err);
    throw err;
  }
}
export { getAllLocations };
