// locationValidator.ts;
import { Location } from "../types/locationTypes";

function validateLocation(location: Location): string[] {
  const errors: string[] = [];

  if (!location.country) errors.push("Country is required.");
  if (!location.state) errors.push("State is required.");
  if (!location.city) errors.push("City is required.");
  if (!location.locality) errors.push("Locality is required.");
  if (!location.postalCode) errors.push("PostalCode is required.");
  if (location.latitude == null || isNaN(location.latitude))
    errors.push("Valid Latitude is required.");
  if (location.longitude == null || isNaN(location.longitude))
    errors.push("Valid Longitude is required.");
  if (location.population == null || isNaN(location.population))
    errors.push("Valid Population is required.");
  if (location.areaSqKm == null || isNaN(location.areaSqKm))
    errors.push("Valid Area in SqKm is required.");

  return errors;
}

export { validateLocation };
