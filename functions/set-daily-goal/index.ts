/// <reference types="https://esm.sh/@supabase/supabase-js" />
import { createClient } from "https://esm.sh/@supabase/supabase-js";
import type { Database } from "../database.types.ts"; // Adjust the path to your type definitions

import getHeaders from "../utils/getHeaders.ts";
import { allowMethod } from "../utils/allowMethod.ts";

import getUser from "../utils/getUser.ts";
import setDailyGoal from "../validation/set-daily-goal.ts";
import { InternalServerError } from "../utils/errors.ts";
import createdResponse from "../utils/createdResponse.ts";

const supabaseUrl = Deno.env.get("SUPABASE_URL") || "";
const supabaseAnonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";

Deno.serve(async (req) => {
  const headers = getHeaders("POST");
  const earlyResponse = allowMethod("POST", req.method, headers);

  if (earlyResponse) return earlyResponse;

  const { error: validationError, data: validationResult } = await setDailyGoal(
    req,
    headers
  );

  if (validationError) {
    return validationResult as Response;
  }

  const { goal } = validationResult as {
    goal: number;
  };
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

    const { error: updateGoalError } = await supabase.rpc("set_daily_goal", {
      _user_id: user_id,
      _user_timezone: timezone,
      _goal: goal,
    });

    if (updateGoalError) {
      return InternalServerError(updateGoalError.message, headers);
    }

    return createdResponse({}, headers);
  } catch (error) {
    return InternalServerError(error.message, headers);
  }
});
