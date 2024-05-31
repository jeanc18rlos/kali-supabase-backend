/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { Database } from "../database.types.ts";
import getHeaders from "../utils/getHeaders.ts";
import { allowMethod } from "../utils/allowMethod.ts";
import { InternalServerError, NotFoundError } from "../utils/errors.ts";
import okResponse from "../utils/okResponse.ts";
import updateUserProfile from "../validation/update-user-profile.ts";

const supabaseUrl = Deno.env.get("SUPABASE_URL") || "";
const supabaseAnonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";

Deno.serve(async (req) => {
  const headers = getHeaders("PATCH");
  const earlyResponse = allowMethod("PATCH", req.method, headers);

  if (earlyResponse) {
    return earlyResponse;
  }

  try {
    const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
      global: {
        headers: { Authorization: req.headers.get("Authorization")! },
      },
    });

    const { data } = await supabase.auth.getUser();
    const user = data.user;

    if (!user) {
      return NotFoundError("User not found", headers);
    }
    const { id: user_id } = user;

    const { error: validationError, data: validationResult } =
      await updateUserProfile(req, headers);

    if (validationError) {
      return validationResult as Response;
    }

    const { name, profile_image, bio, birth_date } = validationResult as {
      name?: string;
      profile_image?: string;
      bio?: string;
      birth_date?: string;
    };

    const { error: user_profile_error } = await supabase
      .from("user_profiles")
      .update({
        name,
        profile_image,
        bio,
        birth_date,
      })
      .eq("user_id", user_id);

    if (user_profile_error) {
      return InternalServerError(user_profile_error.message, headers);
    }

    return okResponse(
      {
        name,
        profile_image,
        bio,
        birth_date,
      },
      headers,
    );
  } catch (error) {
    return InternalServerError(error.message, headers);
  }
});
