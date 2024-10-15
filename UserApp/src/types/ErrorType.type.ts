import { ClientErrorHttpCodes, ServerErrorHttpCodes } from "../enums/emums.js";

interface ErrorType extends Error {
  status: ClientErrorHttpCodes | ServerErrorHttpCodes;
  message: string;
  name: string;
}

export default ErrorType;
