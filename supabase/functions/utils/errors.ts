export const BadRequestError = (
  message: string,
  headers: Headers
): Response => {
  return new Response(JSON.stringify({ error: message }), {
    status: 400,
    headers: headers,
  });
};

export const MethodNotAllowedError = (headers: Headers): Response => {
  return new Response("Method Not Allowed", {
    status: 405,
    headers: headers,
  });
};

export const UnauthorizedError = (headers: Headers): Response => {
  return new Response(JSON.stringify({ error: "Unauthorized" }), {
    status: 401,
    headers: headers,
  });
};

export const NotFoundError = (message: string, headers: Headers): Response => {
  return new Response(JSON.stringify({ error: message }), {
    status: 404,
    headers: headers,
  });
};

export const InternalServerError = (
  message: string,
  headers: Headers
): Response => {
  return new Response(JSON.stringify({ error: message }), {
    status: 500,
    headers: headers,
  });
};

export const ConflictError = (
  message: string,
  headers: Headers
): Response => {
  return new Response(JSON.stringify({ error: message }), {
    status: 409,
    headers: headers,
  });
}