function okResponse(data: Record<string, unknown>, headers: Headers) {
  return new Response(JSON.stringify(data), {
    status: 200,
    headers: headers,
  });
}


export default okResponse;
