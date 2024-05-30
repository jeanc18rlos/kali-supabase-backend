const draftbitDomain = "https://snack-web-player.s3.us-west-1.amazonaws.com";

function getHeaders(method: "GET" | "POST" | "PATCH" | "PUT"): Headers {
  return new Headers({
    "Access-Control-Allow-Origin": "https://snack-web-player.s3.us-west-1.amazonaws.com",
    "Access-Control-Allow-Headers":
      "authorization, x-client-info, apikey, content-type",
    "Content-Type": "application/json",
    "Access-Control-Allow-Methods": "OPTIONS, " + method,
  });
}

export default getHeaders;
