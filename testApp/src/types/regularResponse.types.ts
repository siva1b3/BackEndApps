// Define a generic interface for regular API responses
interface RegularResponse<T> {
  // HTTP status code (e.g., 200 for success, 404 for not found)
  status: number;

  // The body of the response, which can be:
  // - A single object of type T
  // - An array of objects of type T
  // - An object containing an error message
  body: T | T[] | Partial<T> | Partial<T>[] | { message: string };
}

// Export the RegularResponse interface for use in other files
export default RegularResponse;
