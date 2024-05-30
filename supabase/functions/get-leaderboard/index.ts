/// <reference types="https://esm.sh/@supabase/supabase-js" />
import { createClient } from "https://esm.sh/@supabase/supabase-js";
import type { Database } from "../database.types.ts"; // Adjust the path to your type definitions

import getHeaders from "../utils/getHeaders.ts";
import { allowMethod } from "../utils/allowMethod.ts";

import getUser from "../utils/getUser.ts";
import { InternalServerError } from "../utils/errors.ts";
import okResponse from "../utils/okResponse.ts";
import getLeaderboard from "../validation/get-leaderboard.ts";

const supabaseUrl = Deno.env.get("SUPABASE_URL") || "";
const supabaseAnonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";

Deno.serve(async (req) => {
  const headers = getHeaders("POST");
  const earlyResponse = allowMethod("POST", req.method, headers);

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

    const { error: validationError, data: validationResult } =
      await getLeaderboard(
        req,
        headers,
      );

    if (validationError) {
      return validationResult as Response;
    }

    const { period, limit } = validationResult as {
      period: "daily" | "weekly" | "monthly";
      limit?: number;
    };

    const { data: leaderboardData, error: dasboardError } = await supabase.rpc(
      "get_leaderboard",
      {
        _user_id: user_id,
        _timezone: timezone,
        _period: period,
        _limit: limit,
      },
    );

    if (dasboardError) {
      return InternalServerError(dasboardError.message, headers);
    }

    if (!leaderboardData) {
      return InternalServerError("Failed to fetch leaderboard data", headers);
    }

    return okResponse(
      leaderboardData,
      headers,
    );
  } catch (error) {
    return InternalServerError(error.message, headers);
  }
});
