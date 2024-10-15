import { SuccessHttpCodes } from "../enums/emums.js";

interface ResponseType<T> {
  status: SuccessHttpCodes;
  body: T | T[] | Partial<T> | Partial<T>[];
}

export default ResponseType;
