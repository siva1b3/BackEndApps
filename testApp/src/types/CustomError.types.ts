// Custom error interface for extending the default Error object
interface CustomError extends Error {
  statusCode?: number;
}

export default CustomError;
