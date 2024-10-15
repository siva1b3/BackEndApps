import express from "express";
import cors from "cors";
import { UserRouter } from "./routes/routes.js";
import { catchAllRoute, errorHandler } from "./MiddleWare/middleWare.js";

const app = express();

// Enable CORS
app.use(cors());

// Parse incoming JSON requests
app.use(express.json());

app.use("/api/V1", UserRouter);

// Catch-all route for undefined routes
app.use(catchAllRoute);

// Error handler middleware
app.use(errorHandler);

export default app;
