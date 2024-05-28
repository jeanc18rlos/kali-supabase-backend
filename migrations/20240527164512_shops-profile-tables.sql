create table  "shop"."shops_profile" (
    "created_at" timestamp with time zone not null default now(),
    "id" uuid not null default gen_random_uuid(),
    "name" varchar(50) not null,
    "shop_url" varchar(255),
    "stripe_account" varchar(255),
    "stripe_account_status" character varying default 'pending'::character varying,
    "user_id" uuid not null,
    PRIMARY KEY("id"),
    UNIQUE ("user_id","name")
);

ALTER TABLE "shop"."shops_profile"
ADD CONSTRAINT FK_shop_profile_user_id
FOREIGN KEY ("user_id")
REFERENCES "auth"."users"("id")
ON DELETE CASCADE;

--------
create table if not exists "shop"."founders_shops" (
    "created_at" timestamp with time zone not null default now(),
    "shop_id" uuid not null default gen_random_uuid() ,
    "user_id" uuid not null default gen_random_uuid(),
    PRIMARY KEY("shop_id","user_id"),
    "role" varchar(20) not null default 'owner'
);

ALTER TABLE "shop"."founders_shops"
ADD CONSTRAINT FK_founders_shops_user_id
FOREIGN KEY ("user_id")
REFERENCES "auth"."users"("id")
ON DELETE CASCADE;

ALTER TABLE "shop"."founders_shops"
ADD CONSTRAINT FK_founders_shops_shop_id
FOREIGN KEY ("shop_id")
REFERENCES "shop"."shops_profile"("id")
ON DELETE SET NULL;
