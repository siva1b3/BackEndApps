import { Request, Response } from "express";
import { AdventureWorks2019ProductResponseTypes } from "../models/AdventureWorksModels";
import {
  getAllProductsService,
  getProductByIdService,
  createProductService,
} from "../services/AdventureWorksService";

async function getAllProducts(req: Request, res: Response) {
  const productsData: AdventureWorks2019ProductResponseTypes[] =
    await getAllProductsService(req, res);
  res.status(200).json(productsData);
}

async function getProductById(req: Request, res: Response) {
  const id: number = parseInt(req.params.id);
  const productById: any = await getProductByIdService(id);
  res.status(200).json(productById);
}

async function createProduct(req: Request, res: Response) {
  const jsonData = req.body;
  const inserteddata: any = await createProductService(jsonData);
  res.status(200).json(inserteddata);
}

export { getAllProducts, getProductById, createProduct };
