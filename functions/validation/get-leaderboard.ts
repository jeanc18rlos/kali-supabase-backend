import { BadRequestError } from "../utils/errors.ts";

type ReturnType =
  | { error: boolean; data: Response }
  | {
    error: boolean;
    data: {
      period: "daily" | "weekly" | "monthly";
      limit?: number;
    };
  };

async function getLeaderboard(
  req: Request,
  headers: Headers,
): Promise<ReturnType> {
    // get form request parameters
  const { period, limit } = await req.json()

  if (!period) {
    return {
      error: true,
      data: BadRequestError("period is required", headers),
    };
  }

  if (typeof period !== "string") {
    return {
      error: true,
      data: BadRequestError("period must be a string", headers),
    };
  }

  if (period !== "daily" && period !== "weekly" && period !== "monthly") {
    return {
      error: true,
      data: BadRequestError(
        "period must be daily, weekly, or monthly",
        headers,
      ),
    };
  }

  if (limit && typeof limit !== "number") {
    return {
      error: true,
      data: BadRequestError("limit must be a number", headers),
    };
  }

  if (limit && limit <= 0) {
    return {
      error: true,
      data: BadRequestError("limit must be greater than 0", headers),
    };
  }

  if (limit && limit > 10) {
    return {
      error: true,
      data: BadRequestError("limit must be smaller than 10", headers),
    };
  }

  return {
    error: false,
    data: {
      period,
      limit,
    },
  };
}
export default getLeaderboard;
