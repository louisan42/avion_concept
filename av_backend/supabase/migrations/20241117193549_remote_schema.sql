

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";





SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."Addresses" (
    "address_id" integer NOT NULL,
    "street_address" character varying(255),
    "city" character varying(100),
    "province" character varying(100),
    "postal_code" character varying(20),
    "country" character varying(100)
);


ALTER TABLE "public"."Addresses" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Addresses_address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Addresses_address_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Addresses_address_id_seq" OWNED BY "public"."Addresses"."address_id";



CREATE TABLE IF NOT EXISTS "public"."Cart" (
    "cart_id" integer NOT NULL,
    "customer_id" integer NOT NULL,
    "sku_id" integer NOT NULL,
    "quantity" integer NOT NULL
);


ALTER TABLE "public"."Cart" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Cart_cart_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Cart_cart_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Cart_cart_id_seq" OWNED BY "public"."Cart"."cart_id";



CREATE TABLE IF NOT EXISTS "public"."Categories" (
    "category_id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" "text"
);


ALTER TABLE "public"."Categories" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Categories_category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Categories_category_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Categories_category_id_seq" OWNED BY "public"."Categories"."category_id";



CREATE TABLE IF NOT EXISTS "public"."Customers" (
    "customer_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "full_name" character varying(255) NOT NULL,
    "phone_number" character varying(50),
    "address_id" integer
);


ALTER TABLE "public"."Customers" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Customers_customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Customers_customer_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Customers_customer_id_seq" OWNED BY "public"."Customers"."customer_id";



CREATE TABLE IF NOT EXISTS "public"."Inventory" (
    "inventory_id" integer NOT NULL,
    "sku_id" integer NOT NULL,
    "supplier_id" integer NOT NULL,
    "stock_level" integer DEFAULT 0,
    "reorder_threshold" integer,
    "storage_location" character varying(255)
);


ALTER TABLE "public"."Inventory" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Inventory_inventory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Inventory_inventory_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Inventory_inventory_id_seq" OWNED BY "public"."Inventory"."inventory_id";



CREATE TABLE IF NOT EXISTS "public"."OrderItems" (
    "order_item_id" integer NOT NULL,
    "order_id" integer NOT NULL,
    "sku_id" integer NOT NULL,
    "quantity" integer NOT NULL,
    "price" numeric(10,2) NOT NULL
);


ALTER TABLE "public"."OrderItems" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."OrderItems_order_item_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."OrderItems_order_item_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."OrderItems_order_item_id_seq" OWNED BY "public"."OrderItems"."order_item_id";



CREATE TABLE IF NOT EXISTS "public"."Orders" (
    "order_id" integer NOT NULL,
    "customer_id" integer NOT NULL,
    "order_date" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "delivery_date" timestamp without time zone,
    "status" character varying(50),
    "total_price" numeric(10,2) NOT NULL
);


ALTER TABLE "public"."Orders" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Orders_order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Orders_order_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Orders_order_id_seq" OWNED BY "public"."Orders"."order_id";



CREATE TABLE IF NOT EXISTS "public"."ProductImages" (
    "image_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "image_url" character varying(255) NOT NULL,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "public"."ProductImages" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."ProductImages_image_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."ProductImages_image_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."ProductImages_image_id_seq" OWNED BY "public"."ProductImages"."image_id";



CREATE TABLE IF NOT EXISTS "public"."Product_SKUs" (
    "sku_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "sku" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "price" numeric(10,2) NOT NULL,
    "stock_level" integer DEFAULT 0,
    "material" character varying(255),
    "dimensions" character varying(255),
    "weight" numeric(10,2),
    "color" character varying(50),
    "finish" character varying(50)
);


ALTER TABLE "public"."Product_SKUs" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Product_SKUs_sku_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Product_SKUs_sku_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Product_SKUs_sku_id_seq" OWNED BY "public"."Product_SKUs"."sku_id";



CREATE TABLE IF NOT EXISTS "public"."Products" (
    "product_id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" "text",
    "subcategory_id" integer,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "public"."Products" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Products_product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Products_product_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Products_product_id_seq" OWNED BY "public"."Products"."product_id";



CREATE TABLE IF NOT EXISTS "public"."Reviews" (
    "review_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "customer_id" integer NOT NULL,
    "rating" integer NOT NULL,
    "review_text" "text",
    "review_date" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "public"."Reviews" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Reviews_review_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Reviews_review_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Reviews_review_id_seq" OWNED BY "public"."Reviews"."review_id";



CREATE TABLE IF NOT EXISTS "public"."SubCategories" (
    "subcategory_id" integer NOT NULL,
    "category_id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" "text"
);


ALTER TABLE "public"."SubCategories" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."SubCategories_subcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."SubCategories_subcategory_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."SubCategories_subcategory_id_seq" OWNED BY "public"."SubCategories"."subcategory_id";



CREATE TABLE IF NOT EXISTS "public"."Suppliers" (
    "supplier_id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "contact_info" character varying(255),
    "address_id" integer
);


ALTER TABLE "public"."Suppliers" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Suppliers_supplier_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Suppliers_supplier_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Suppliers_supplier_id_seq" OWNED BY "public"."Suppliers"."supplier_id";



CREATE TABLE IF NOT EXISTS "public"."Users" (
    "user_id" integer NOT NULL,
    "username" character varying(255) NOT NULL,
    "password" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "role" character varying(50) NOT NULL,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "public"."Users" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Users_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Users_user_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Users_user_id_seq" OWNED BY "public"."Users"."user_id";



CREATE TABLE IF NOT EXISTS "public"."Wishlist" (
    "wishlist_id" integer NOT NULL,
    "customer_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "added_date" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "public"."Wishlist" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."Wishlist_wishlist_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."Wishlist_wishlist_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."Wishlist_wishlist_id_seq" OWNED BY "public"."Wishlist"."wishlist_id";



ALTER TABLE ONLY "public"."Addresses" ALTER COLUMN "address_id" SET DEFAULT "nextval"('"public"."Addresses_address_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Cart" ALTER COLUMN "cart_id" SET DEFAULT "nextval"('"public"."Cart_cart_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Categories" ALTER COLUMN "category_id" SET DEFAULT "nextval"('"public"."Categories_category_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Customers" ALTER COLUMN "customer_id" SET DEFAULT "nextval"('"public"."Customers_customer_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Inventory" ALTER COLUMN "inventory_id" SET DEFAULT "nextval"('"public"."Inventory_inventory_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."OrderItems" ALTER COLUMN "order_item_id" SET DEFAULT "nextval"('"public"."OrderItems_order_item_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Orders" ALTER COLUMN "order_id" SET DEFAULT "nextval"('"public"."Orders_order_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."ProductImages" ALTER COLUMN "image_id" SET DEFAULT "nextval"('"public"."ProductImages_image_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Product_SKUs" ALTER COLUMN "sku_id" SET DEFAULT "nextval"('"public"."Product_SKUs_sku_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Products" ALTER COLUMN "product_id" SET DEFAULT "nextval"('"public"."Products_product_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Reviews" ALTER COLUMN "review_id" SET DEFAULT "nextval"('"public"."Reviews_review_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."SubCategories" ALTER COLUMN "subcategory_id" SET DEFAULT "nextval"('"public"."SubCategories_subcategory_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Suppliers" ALTER COLUMN "supplier_id" SET DEFAULT "nextval"('"public"."Suppliers_supplier_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Users" ALTER COLUMN "user_id" SET DEFAULT "nextval"('"public"."Users_user_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Wishlist" ALTER COLUMN "wishlist_id" SET DEFAULT "nextval"('"public"."Wishlist_wishlist_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."Addresses"
    ADD CONSTRAINT "Addresses_pkey" PRIMARY KEY ("address_id");



ALTER TABLE ONLY "public"."Cart"
    ADD CONSTRAINT "Cart_pkey" PRIMARY KEY ("cart_id");



ALTER TABLE ONLY "public"."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY ("category_id");



ALTER TABLE ONLY "public"."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("customer_id");



ALTER TABLE ONLY "public"."Inventory"
    ADD CONSTRAINT "Inventory_pkey" PRIMARY KEY ("inventory_id");



ALTER TABLE ONLY "public"."OrderItems"
    ADD CONSTRAINT "OrderItems_pkey" PRIMARY KEY ("order_item_id");



ALTER TABLE ONLY "public"."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("order_id");



ALTER TABLE ONLY "public"."ProductImages"
    ADD CONSTRAINT "ProductImages_pkey" PRIMARY KEY ("image_id");



ALTER TABLE ONLY "public"."Product_SKUs"
    ADD CONSTRAINT "Product_SKUs_pkey" PRIMARY KEY ("sku_id");



ALTER TABLE ONLY "public"."Product_SKUs"
    ADD CONSTRAINT "Product_SKUs_sku_key" UNIQUE ("sku");



ALTER TABLE ONLY "public"."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("product_id");



ALTER TABLE ONLY "public"."Reviews"
    ADD CONSTRAINT "Reviews_pkey" PRIMARY KEY ("review_id");



ALTER TABLE ONLY "public"."SubCategories"
    ADD CONSTRAINT "SubCategories_pkey" PRIMARY KEY ("subcategory_id");



ALTER TABLE ONLY "public"."Suppliers"
    ADD CONSTRAINT "Suppliers_pkey" PRIMARY KEY ("supplier_id");



ALTER TABLE ONLY "public"."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE ("email");



ALTER TABLE ONLY "public"."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("user_id");



ALTER TABLE ONLY "public"."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE ("username");



ALTER TABLE ONLY "public"."Wishlist"
    ADD CONSTRAINT "Wishlist_pkey" PRIMARY KEY ("wishlist_id");



ALTER TABLE ONLY "public"."Cart"
    ADD CONSTRAINT "Cart_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."Customers"("customer_id");



ALTER TABLE ONLY "public"."Cart"
    ADD CONSTRAINT "Cart_sku_id_fkey" FOREIGN KEY ("sku_id") REFERENCES "public"."Product_SKUs"("sku_id");



ALTER TABLE ONLY "public"."Customers"
    ADD CONSTRAINT "Customers_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "public"."Addresses"("address_id");



ALTER TABLE ONLY "public"."Customers"
    ADD CONSTRAINT "Customers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."Users"("user_id");



ALTER TABLE ONLY "public"."Inventory"
    ADD CONSTRAINT "Inventory_sku_id_fkey" FOREIGN KEY ("sku_id") REFERENCES "public"."Product_SKUs"("sku_id");



ALTER TABLE ONLY "public"."Inventory"
    ADD CONSTRAINT "Inventory_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "public"."Suppliers"("supplier_id");



ALTER TABLE ONLY "public"."OrderItems"
    ADD CONSTRAINT "OrderItems_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."Orders"("order_id");



ALTER TABLE ONLY "public"."OrderItems"
    ADD CONSTRAINT "OrderItems_sku_id_fkey" FOREIGN KEY ("sku_id") REFERENCES "public"."Product_SKUs"("sku_id");



ALTER TABLE ONLY "public"."Orders"
    ADD CONSTRAINT "Orders_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."Customers"("customer_id");



ALTER TABLE ONLY "public"."ProductImages"
    ADD CONSTRAINT "ProductImages_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."Products"("product_id");



ALTER TABLE ONLY "public"."Product_SKUs"
    ADD CONSTRAINT "Product_SKUs_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."Products"("product_id");



ALTER TABLE ONLY "public"."Products"
    ADD CONSTRAINT "Products_subcategory_id_fkey" FOREIGN KEY ("subcategory_id") REFERENCES "public"."SubCategories"("subcategory_id");



ALTER TABLE ONLY "public"."Reviews"
    ADD CONSTRAINT "Reviews_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."Customers"("customer_id");



ALTER TABLE ONLY "public"."Reviews"
    ADD CONSTRAINT "Reviews_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."Products"("product_id");



ALTER TABLE ONLY "public"."SubCategories"
    ADD CONSTRAINT "SubCategories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."Categories"("category_id");



ALTER TABLE ONLY "public"."Suppliers"
    ADD CONSTRAINT "Suppliers_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "public"."Addresses"("address_id");



ALTER TABLE ONLY "public"."Wishlist"
    ADD CONSTRAINT "Wishlist_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."Customers"("customer_id");



ALTER TABLE ONLY "public"."Wishlist"
    ADD CONSTRAINT "Wishlist_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."Products"("product_id");



ALTER TABLE "public"."Addresses" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Cart" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Categories" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Customers" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "Enable all access for all users" ON "public"."Cart" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Categories" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Customers" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Inventory" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."OrderItems" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Orders" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."ProductImages" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Product_SKUs" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Products" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Reviews" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."SubCategories" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Suppliers" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Users" USING (true);



CREATE POLICY "Enable all access for all users" ON "public"."Wishlist" USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."Addresses" USING (true);



ALTER TABLE "public"."Inventory" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."OrderItems" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Orders" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."ProductImages" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Product_SKUs" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Products" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Reviews" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."SubCategories" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Suppliers" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Users" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."Wishlist" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



































































































































































































GRANT ALL ON TABLE "public"."Addresses" TO "anon";
GRANT ALL ON TABLE "public"."Addresses" TO "authenticated";
GRANT ALL ON TABLE "public"."Addresses" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Addresses_address_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Addresses_address_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Addresses_address_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Cart" TO "anon";
GRANT ALL ON TABLE "public"."Cart" TO "authenticated";
GRANT ALL ON TABLE "public"."Cart" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Cart_cart_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Cart_cart_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Cart_cart_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Categories" TO "anon";
GRANT ALL ON TABLE "public"."Categories" TO "authenticated";
GRANT ALL ON TABLE "public"."Categories" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Categories_category_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Categories_category_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Categories_category_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Customers" TO "anon";
GRANT ALL ON TABLE "public"."Customers" TO "authenticated";
GRANT ALL ON TABLE "public"."Customers" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Customers_customer_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Customers_customer_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Customers_customer_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Inventory" TO "anon";
GRANT ALL ON TABLE "public"."Inventory" TO "authenticated";
GRANT ALL ON TABLE "public"."Inventory" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Inventory_inventory_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Inventory_inventory_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Inventory_inventory_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."OrderItems" TO "anon";
GRANT ALL ON TABLE "public"."OrderItems" TO "authenticated";
GRANT ALL ON TABLE "public"."OrderItems" TO "service_role";



GRANT ALL ON SEQUENCE "public"."OrderItems_order_item_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."OrderItems_order_item_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."OrderItems_order_item_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Orders" TO "anon";
GRANT ALL ON TABLE "public"."Orders" TO "authenticated";
GRANT ALL ON TABLE "public"."Orders" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Orders_order_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Orders_order_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Orders_order_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."ProductImages" TO "anon";
GRANT ALL ON TABLE "public"."ProductImages" TO "authenticated";
GRANT ALL ON TABLE "public"."ProductImages" TO "service_role";



GRANT ALL ON SEQUENCE "public"."ProductImages_image_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ProductImages_image_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ProductImages_image_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Product_SKUs" TO "anon";
GRANT ALL ON TABLE "public"."Product_SKUs" TO "authenticated";
GRANT ALL ON TABLE "public"."Product_SKUs" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Product_SKUs_sku_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Product_SKUs_sku_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Product_SKUs_sku_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Products" TO "anon";
GRANT ALL ON TABLE "public"."Products" TO "authenticated";
GRANT ALL ON TABLE "public"."Products" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Products_product_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Products_product_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Products_product_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Reviews" TO "anon";
GRANT ALL ON TABLE "public"."Reviews" TO "authenticated";
GRANT ALL ON TABLE "public"."Reviews" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Reviews_review_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Reviews_review_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Reviews_review_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."SubCategories" TO "anon";
GRANT ALL ON TABLE "public"."SubCategories" TO "authenticated";
GRANT ALL ON TABLE "public"."SubCategories" TO "service_role";



GRANT ALL ON SEQUENCE "public"."SubCategories_subcategory_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."SubCategories_subcategory_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."SubCategories_subcategory_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Suppliers" TO "anon";
GRANT ALL ON TABLE "public"."Suppliers" TO "authenticated";
GRANT ALL ON TABLE "public"."Suppliers" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Suppliers_supplier_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Suppliers_supplier_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Suppliers_supplier_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Users" TO "anon";
GRANT ALL ON TABLE "public"."Users" TO "authenticated";
GRANT ALL ON TABLE "public"."Users" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Users_user_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Users_user_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Users_user_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."Wishlist" TO "anon";
GRANT ALL ON TABLE "public"."Wishlist" TO "authenticated";
GRANT ALL ON TABLE "public"."Wishlist" TO "service_role";



GRANT ALL ON SEQUENCE "public"."Wishlist_wishlist_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Wishlist_wishlist_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Wishlist_wishlist_id_seq" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";






























RESET ALL;
