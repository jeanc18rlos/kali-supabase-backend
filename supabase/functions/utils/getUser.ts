/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />
import { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2";
import { Database } from "../database.types.ts";
import { NotFoundError } from "./errors.ts";

async function getUser(
  supabase: SupabaseClient<Database>,
  headers: Headers,
): Promise<
  | { error: boolean; data: { user_id: string; timezone: string } }
  | { error: boolean; data: Response }
> {
  const { data } = await supabase.auth.getUser();

  const user = data.user;

  if (!user) {
    return {
      error: true,
      data: NotFoundError("User not found", headers),
    };
  }

  const {
    id,
    user_metadata: {
      timezone,
    },
  } = user;

  if (!timezone) {
    return {
      error: true,
      data: NotFoundError("User timezone not found", headers),
    };
  }
  return {
    error: false,
    data: { user_id: id, timezone },
  };
}

export default getUser;
