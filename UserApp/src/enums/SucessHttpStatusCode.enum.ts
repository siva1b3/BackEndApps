enum SuccessHttpStatusCode {
  OK = 200, // Successful request
  CREATED = 201, // Resource created
  ACCEPTED = 202, // Request accepted but not completed
  NO_CONTENT = 204, // Successful request with no content
  PARTIAL_CONTENT = 206, // Partial content response
  MULTI_STATUS = 207, // WebDAV: Multiple status codes
}

export default SuccessHttpStatusCode;
