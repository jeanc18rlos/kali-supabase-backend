// <reference types="https://esm.sh/@supabase/supabase-js" />
import { createClient } from "https://esm.sh/@supabase/supabase-js";

import getHeaders from "../utils/getHeaders.ts";
import { allowMethod } from "../utils/allowMethod.ts";

import type { Database } from "../database.types.ts"; // Adjust the path to your type definitions

const supabaseUrl = Deno.env.get("SUPABASE_URL") || "";
const supabaseAnonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";

Deno.serve(async (req) => {
  console.log("Create Founder");
  const headers = getHeaders("POST");
  const earlyResponse = allowMethod("POST", req.method, headers);
  console.log("Early Response", earlyResponse, req.data);
  if (earlyResponse) return earlyResponse;

  try {
    const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
      global: {
        headers: { Authorization: req.headers.get("Authorization")! },
      },
    });
    const data = req.json();
    console.log("Data", data);
    const { response, error } = await supabase.auth.signUp(data);
    console.log("Founder", response);
    console.error("Error: ", error);
    return new Response("ok", headers);
  } catch (error) {
    console.error("Error: ", error.message);
    return new Response("error", headers);
  }
});
