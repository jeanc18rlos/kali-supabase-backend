import { MethodNotAllowedError } from "./errors.ts";

export function allowMethod(
  allowMethod: "POST" | "GET" | "OPTIONS" | "PATCH" | "DELETE",
  method: string,
  headers: Headers
): Response | null {
  if (method === "OPTIONS") {
    return new Response(null, {
      status: 204,
      headers: headers,
    });
  } else if (method !== allowMethod) {
    return MethodNotAllowedError(headers);
  } else {
    return null;
  }
}
