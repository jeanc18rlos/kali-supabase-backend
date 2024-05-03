/// <reference types="https://esm.sh/@supabase/supabase-js" />
import { createClient } from "https://esm.sh/@supabase/supabase-js";
import type { Database } from "../database.types.ts"; // Adjust the path to your type definitions

import getHeaders from "../utils/getHeaders.ts";
import { allowMethod } from "../utils/allowMethod.ts";

import getUser from "../utils/getUser.ts";
import { InternalServerError } from "../utils/errors.ts";
import okResponse from "../utils/okResponse.ts";

const supabaseUrl = Deno.env.get("SUPABASE_URL") || "";
const supabaseAnonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";

Deno.serve(async (req) => {
  const headers = getHeaders("GET");
  const earlyResponse = allowMethod("GET", req.method, headers);

  if (earlyResponse) return earlyResponse;

  try {
    const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
      global: {
        headers: { Authorization: req.headers.get("Authorization")! },
      },
    });

    const { data: getUserResult, error } = await getUser(supabase, headers);

    if (error) {
      return getUserResult as Response;
    }

    const { user_id, timezone } = getUserResult as {
      user_id: string;
      timezone: string;
    };

    const { data: userLevelsData, error: userLevelsError } = await supabase.rpc(
      "get_user_future_levels",
      {
        _user_id: user_id,
        _timezone: timezone,
      },
    );

    if (userLevelsError) {
      return InternalServerError(userLevelsError.message, headers);
    }

    if (userLevelsData.length <= 0) {
      return InternalServerError("Failed to fetch levels data", headers);
    }

    return okResponse(
      userLevelsData,
      headers,
    );
  } catch (error) {
    return InternalServerError(error.message, headers);
  }
});
