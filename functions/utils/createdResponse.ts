function createdResponse(data: Record<string, unknown>, headers: Headers) {
  return new Response(JSON.stringify(data), {
    status: 201,
    headers: headers,
  });
}

export default createdResponse;