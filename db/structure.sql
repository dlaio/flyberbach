CREATE TABLE "airports" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "airport_code" varchar(255), "airport_name" varchar(255), "location_city" varchar(255), "country" varchar(255), "latitude" varchar(255), "longitude" varchar(255), "altitude" varchar(255), "timezone" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "flight_legs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "leg_no" integer, "flight_no" varchar(255), "route_id" integer, "price" decimal, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "flights" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "airline" varchar(255) NOT NULL, "flight_no" varchar(255) NOT NULL, "plane_type" varchar(255) NOT NULL, "leave_time" datetime NOT NULL, "leave_city" varchar(255) NOT NULL, "arrive_time" datetime NOT NULL, "arrive_city" varchar(255) NOT NULL, "remark" text, "created_at" datetime, "updated_at" datetime, "price" float, "cabin_class" varchar(255));
CREATE TABLE "routes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "route_id" integer, "airport_origin" varchar(255), "airport_destination" varchar(255), "distance" float, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20131126202129');

INSERT INTO schema_migrations (version) VALUES ('20131126210333');

INSERT INTO schema_migrations (version) VALUES ('20131126210800');

INSERT INTO schema_migrations (version) VALUES ('20131127135423');
