import { BadRequestError } from "../utils/errors.ts";

type ReturnType =
  | { error: boolean; data: Response }
  | {
      error: boolean;
      data: {
        enable_notifications?: boolean;
        step_tracking?: boolean;
        timezone?: string;
      };
    };

async function updateUserSettings(
  req: Request,
  headers: Headers
): Promise<ReturnType> {
  const { enable_notifications, step_tracking, timezone } = await req.json();

  if (!enable_notifications && !step_tracking && !timezone) {
    return {
      error: true,
      data: BadRequestError("At least one setting is required", headers),
    };
  }

  if (enable_notifications && typeof enable_notifications !== "boolean") {
    return {
      error: true,
      data: BadRequestError("enable_notifications must be a boolean", headers),
    };
  }

  if (step_tracking && typeof step_tracking !== "boolean") {
    return {
      error: true,
      data: BadRequestError("step_tracking must be a boolean", headers),
    };
  }

  if (timezone && typeof timezone !== "string") {
    return {
      error: true,
      data: BadRequestError("timezone must be a string", headers),
    };
  }

  return {
    error: false,
    data: {
      enable_notifications,
      step_tracking,
      timezone,
    },
  };
}
export default updateUserSettings;
