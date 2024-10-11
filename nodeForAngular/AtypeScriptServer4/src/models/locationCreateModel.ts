// locationCreateModel.ts
import { sql, poolPromise } from "../config/databaseConfig";
import { Location } from "../types/locationTypes";

async function insertLocation(location: Location): Promise<void> {
  try {
    const pool = await poolPromise;
    await pool
      .request()
      .input("LocationID", sql.Int, location.locationId)
      .input("Country", sql.NVarChar, location.country)
      .input("State", sql.NVarChar, location.state)
      .input("City", sql.NVarChar, location.city)
      .input("Locality", sql.NVarChar, location.locality)
      .input("PostalCode", sql.NVarChar, location.postalCode)
      .input("Latitude", sql.Float, location.latitude)
      .input("Longitude", sql.Float, location.longitude)
      .input("Population", sql.Int, location.population)
      .input("AreaSqKm", sql.Float, location.areaSqKm)
      .query(`INSERT INTO dbo.Location (LocationID, Country, State, City, Locality, PostalCode, Latitude, Longitude, Population, AreaSqKm)
              VALUES (@LocationID, @Country, @State, @City, @Locality, @PostalCode, @Latitude, @Longitude, @Population, @AreaSqKm)`);
  } catch (err) {
    console.error("Error inserting location data:", err);
    throw err;
  }
}

export { insertLocation };
