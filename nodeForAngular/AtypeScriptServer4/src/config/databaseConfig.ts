// databaseConfig.ts
import sql, { ConnectionPool, config } from "mssql";
export const dbConfig: config = {
  user: "siva",
  password: "Setup@123",
  server: "QRA-sivanagababu",
  database: "Test",
  connectionTimeout: 500000,
  requestTimeout: 500000,
  options: {
    encrypt: true,
    trustServerCertificate: true,
  },
};
const poolPromise: Promise<ConnectionPool> = new Promise((resolve, reject) => {
  const pool = new sql.ConnectionPool(dbConfig);
  pool
    .connect()
    .then(() => {
      console.log("Connected to SQL Server");
      resolve(pool);
    })
    .catch((err) => {
      console.error("Database Connection Failed! Bad Config: ", err);
      reject(err);
    });
});
export { sql, poolPromise };
