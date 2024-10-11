// locationRoutes.ts
import express from "express";

import { getAllLocationData } from "../controllers/locationRetrieveController";
import { createLocation } from "../controllers/locationCreateController";

const router = express.Router();

router.get("/getAllLocations", getAllLocationData);
router.post("/createLocation", createLocation);

export default router;
