import { ErrorHttpStatusCode } from "../enums/enums.js";

interface ErrorType extends Error {
  status: ErrorHttpStatusCode;
  message: string;
  name: string;
}

export default ErrorType;
