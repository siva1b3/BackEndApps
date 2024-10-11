// app.ts
import express, { Application } from "express";
import cors from "cors";

import locationRoutes from "./routes/locationRoutes";
import userAuthRoutes from "./routes/userAuthRoutes";

import AdventureWorks2019Routes from "./routes/AdventureWorkRoutes";

const app: Application = express();

app.use(cors());
// debugger;
app.use(express.json());

app.use("/api/locations", locationRoutes);
app.use("/api/auth", userAuthRoutes);
app.use("/api/v1/", AdventureWorks2019Routes);

export default app;
