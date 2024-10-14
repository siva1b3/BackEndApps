import { SuccessHttpStatusCode } from "../enums/enums.js";

interface ResponseType<T> {
  status: SuccessHttpStatusCode;
  body: T | T[] | Partial<T> | Partial<T>[];
}

export default ResponseType;
