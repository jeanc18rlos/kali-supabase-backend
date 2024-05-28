CREATE SCHEMA SHOP;
grant usage on schema "shop" to anon;
grant usage on schema "shop" to authenticated;

create table if not exists "shop"."founders_profiles" (
    "user_id" uuid not null,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone default now(),
    "name" VARCHAR(50) not null,
    "surename" VARCHAR(50),
    "email" VARCHAR(255) NOT NULL,
    "role" VARCHAR(15) not null,
    "shopify_url" VARCHAr(255),
    "stripe_account" VARCHAR(255),
    "phone_number" VARCHAR(25),

    PRIMARY KEY("user_id"),
    CONSTRAINT fk_auth_users_id
      FOREIGN KEY(user_id) 
      REFERENCES "auth".users(id)
      ON DELETE CASCADE
);

