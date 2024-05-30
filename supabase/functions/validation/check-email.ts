import { BadRequestError } from "../utils/errors.ts";

type ReturnType =
  | { error: boolean; data: Response }
  | { error: boolean; data: string };

async function checkEmail(req: Request, headers: Headers): Promise<ReturnType> {
  const { email } = await req.json();

  if (!email) {
    return {
      error: true,
      data: BadRequestError("Email is required", headers),
    };
  }

  if (typeof email !== "string") {
    return {
      error: true,
      data: BadRequestError("Email must be a string", headers),
    };
  }
  
  return {
    error: false,
    data: email,
  };
}
export default checkEmail;
