import { BadRequestError } from "../utils/errors.ts";

type ReturnType =
  | { error: boolean; data: Response }
  | {
      error: boolean;
      data: {
        email?: string;
        name?: string;
        profile_image?: string;
        bio?: string;
        birth_date?: string;
      };
    };

async function updateUserProfile(
  req: Request,
  headers: Headers
): Promise<ReturnType> {
  const { email, name, profile_image, bio, birth_date } = await req.json();

  if (!email && !name && !profile_image && !bio && !birth_date) {
    return {
      error: true,
      data: BadRequestError("At least one field is required", headers),
    };
  }

  if (email && typeof email !== "string") {
    return {
      error: true,
      data: BadRequestError("email must be a string", headers),
    };
  }

  if (name && typeof name !== "string") {
    return {
      error: true,
      data: BadRequestError("first_name must be a string", headers),
    };
  }

  if (profile_image && typeof profile_image !== "string") {
    return {
      error: true,
      data: BadRequestError("profile_image must be a string", headers),
    };
  }

  if (bio && typeof bio !== "string") {
    return {
      error: true,
      data: BadRequestError("bio must be a string", headers),
    };
  }

  if (birth_date && typeof birth_date !== "string") {
    return {
      error: true,
      data: BadRequestError("birth_date must be a string", headers),
    };
  }

  return {
    error: false,
    data: {
      email,
      name,
      profile_image,
      bio,
      birth_date,
    },
  };
}
export default updateUserProfile;
