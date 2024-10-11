import express from "express";
import {
  getAllProducts,
  getProductById,
  createProduct,
} from "../controllers/AdventureWorksController";

const router = express.Router();

router.route("/products").get(getAllProducts).post(createProduct);
router.route("/products/:id").get(getProductById).put().delete();

export default router;
