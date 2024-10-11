// locationTypes.ts
export interface Location {
  locationId: number;
  country: string;
  state: string;
  city: string;
  locality: string;
  postalCode: string;
  latitude: number;
  longitude: number;
  population: number;
  areaSqKm: number;
}
