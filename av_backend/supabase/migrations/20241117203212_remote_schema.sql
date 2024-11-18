alter table "public"."ProductImages" add column "attribute" text;

alter table "public"."ProductImages" alter column "product_id" drop not null;

alter table "public"."Products" add column "product_image" integer;

alter table "public"."Products" add constraint "Products_product_image_fkey" FOREIGN KEY (product_image) REFERENCES "ProductImages"(image_id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."Products" validate constraint "Products_product_image_fkey";


