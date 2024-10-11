import express, { Express } from "express";
import cors from "cors";

import { amstUserRoute } from "./routes/index.js";
import { errorHandler } from "./errors/index.js";

const app: Express = express();

app.use(cors());
app.use(express.json());
app.use("/api", amstUserRoute);

// Centralized error handling middleware (must come after routes)
app.use(errorHandler);

// Handle undefined routes (404 error)
app.use((req, res) => {
  res.status(404).json({ success: false, message: "Route not found" });
});
export default app;
