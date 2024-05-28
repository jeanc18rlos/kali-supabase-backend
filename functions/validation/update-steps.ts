import { BadRequestError } from "../utils/errors.ts";

type ReturnType =
  | { error: boolean; data: Response }
  | {
      error: boolean;
      data: {
        steps: number;
      };
    };

async function updateUserSteps(
  req: Request,
  headers: Headers
): Promise<ReturnType> {
  const { steps } = await req.json();

  if (!steps) {
    return {
      error: true,
      data: BadRequestError("steps is required", headers),
    };
  }

  if (steps && typeof steps !== "number") {
    return {
      error: true,
      data: BadRequestError("steps must be a number", headers),
    };
  }

  if (steps < 0) {
    return {
      error: true,
      data: BadRequestError("steps must be a positive number", headers),
    };
  }

  return {
    error: false,
    data: {
      steps,
    },
  };
}
export default updateUserSteps;
