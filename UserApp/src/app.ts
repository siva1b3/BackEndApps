import express from "express";
import cors from "cors";
import { errorHandler, catchAllRoute } from "./middleware/middleware.js";
import { userRouter } from "./routes/routes.js";

const app = express();

app.use(cors());
app.use(express.json());

// Define your routes here
app.use("/api/vv1", userRouter);

// This will catch any routes not defined above
app.use(catchAllRoute);

// This will handle any errors from the above middlewares
app.use(errorHandler);

export default app;
