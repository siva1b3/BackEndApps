// AdventureWorksService.ts
import { Request, Response } from "express";
import { AdventureWorks2019ProductResponseTypes } from "../models/AdventureWorksModels";
import { poolPromise } from "../config/AdventureDb.databaseConfig";

async function getAllProductsService(
  req: Request,
  res: Response
): Promise<any> {
  const pool = await poolPromise;
  const query: string = getAllProductsQuery();
  const result = await pool.request().query(query);
  return (result.recordsets as any)[0];
}

function getAllProductsQuery(): string {
  const query: string = `
SELECT Top 10 ProductID,Name,ProductNumber,MakeFlag,FinishedGoodsFlag
FROM [AdventureWorks2019].[Production].[Product] GO

SELECT Top 5 ProductID,Name,ProductNumber,MakeFlag,FinishedGoodsFlag
FROM [AdventureWorks2019].[Production].[Product] GO
    `;
  return query;
}

async function getProductByIdService(id: number) {
  const pool = await poolPromise;
  const query = getProductByIdQuery(id);
  const result = await pool.request().query(query);
  return result.recordset[0] as any;
}

function getProductByIdQuery(id: number) {
  const query = `
SELECT ProductID,Name,ProductNumber,MakeFlag,FinishedGoodsFlag
FROM [AdventureWorks2019].[Production].[Product] 
WHERE ProductID = ${id} ;
    `;
  return query;
}

async function createProductService(data: any) {
  const pool = await poolPromise;
  const query = createProductQuery(data);
  console.log(query);
  const result = pool.request().query(query);
  console.log(result);
  return result;
}

function createProductQuery(data: any) {
  const { unitName, ProductNumber, MakeFlag, FinishedGoodsFlag } = data;
  const query = `
INSERT INTO [AdventureWorks2019].[dbo].[ProductSiva] ([unitName],[ProductNumber],[MakeFlag],[FinishedGoodsFlag]) OUTPUT inserted.* VALUES ('${unitName}',${ProductNumber},${
    MakeFlag !== undefined ? MakeFlag : "NULL"
  },${FinishedGoodsFlag !== undefined ? FinishedGoodsFlag : "NULL"})
  `;
  return query;
}

export { getAllProductsService, getProductByIdService, createProductService };
