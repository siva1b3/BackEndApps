// loginTypes.ts

interface requestLoginType {
  userName?: string;
  password?: string;
}

interface responseLoginType {
  isAuth: boolean;
  EmployeeID?: number;
  FullName?: string;
  Email?: string;
  Age?: number;
  Gender?: string;
}

export { responseLoginType, requestLoginType };
