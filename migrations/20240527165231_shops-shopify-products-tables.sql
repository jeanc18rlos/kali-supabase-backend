create table if not exists "shop"."shopify_products" (
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp without time zone default now(),
    "name" character varying not null,
    "base_price" real,
    "shop_id" uuid not null,
    "description" text,
    "reference_url" text not null,
    "extra_data" jsonb,
    "id" uuid PRIMARY KEY not null default gen_random_uuid()
);

ALTER TABLE "shop"."shopify_products"
ADD CONSTRAINT FK_shopify_products_shop_id
FOREIGN KEY ("shop_id")
REFERENCES "shop"."shops_profile"("id")
ON DELETE CASCADE;
