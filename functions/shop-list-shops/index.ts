// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />
import getHeaders from "../utils/getHeaders.ts";
import { allowMethod } from "../utils/allowMethod.ts";
import { InternalServerError, NotFoundError } from "../utils/errors.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { Database } from "../database.types.ts";
const supabaseUrl = Deno.env.get("SUPABASE_URL") || "";
const supabaseAnonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";
import okResponse from "../utils/okResponse.ts";

console.log("Hello from Functions!");

Deno.serve(async (req) => {
  console.log("shop-list");
  const headers = getHeaders("GET");
  const earlyResponse = allowMethod("GET", req.method, headers);

  if (earlyResponse) {
    return earlyResponse;
  }
  let data;
  try {
    const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
      global: {
        headers: { Authorization: req.headers.get("Authorization")! },
      },
    });

    const {
      data: { user },
    } = await supabase.auth.getUser();

    console.log("User", user.id);

    if (!user) {
      return NotFoundError("User not found", headers);
    }
    const query1 = `
            *,
              founders_shops (role)`;

    const { error, ...response } = await supabase
      .schema("shop")
      .from("shops_profile")
      .select(query1)
      .eq("user_id", String(user.id));
    console.log("List", response);
    return okResponse({ response }, headers);
  } catch (error) {
    console.error(error.message);
    return new Response(JSON.stringify(error.message), {
      headers,
      status: 402,
    });
  }
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/shop-list-shops' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
