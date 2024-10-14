enum ErrorHttpStatusCode {
  BAD_REQUEST = 400, // Invalid request format
  UNAUTHORIZED = 401, // Authentication required
  FORBIDDEN = 403, // Access denied
  NOT_FOUND = 404, // Resource not found
  METHOD_NOT_ALLOWED = 405, // Request method not supported
  NOT_ACCEPTABLE = 406, // Resource not acceptable
  CONFLICT = 409, // Conflict in request (e.g., duplicate entry)
  INTERNAL_SERVER_ERROR = 500, // Generic server error
  NOT_IMPLEMENTED = 501, // Server does not support the functionality
  BAD_GATEWAY = 502, // Invalid response from upstream server
  SERVICE_UNAVAILABLE = 503, // Server temporarily unavailable
  GATEWAY_TIMEOUT = 504, // Upstream server did not respond in time
}

export default ErrorHttpStatusCode;
