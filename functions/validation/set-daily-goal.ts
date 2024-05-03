import { BadRequestError } from "../utils/errors.ts";

type ReturnType =
  | { error: boolean; data: Response }
  | {
    error: boolean;
    data: {
      goal: number;
    };
  };

async function setDailyGoal(
  req: Request,
  headers: Headers,
): Promise<ReturnType> {
  const { goal } = await req.json();

  if (!goal) {
    return {
      error: true,
      data: BadRequestError("Goal is required", headers),
    };
  }

  if (typeof goal !== "number") {
    return {
      error: true,
      data: BadRequestError("Goal must be a string", headers),
    };
  }

  if (goal <= 0) {
    return {
      error: true,
      data: BadRequestError("Goal must be greater than 0", headers),
    };
  }

  return {
    error: false,
    data: { goal },
  };
}
export default setDailyGoal;
