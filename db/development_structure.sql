CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name1" varchar(255), "name2" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "relationships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "pairee_id" integer, "pairer_id" integer, "pairings" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "t_workers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "flag" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "thot_workers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name1" varchar(255), "name2" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_relationships_on_pairee_id" ON "relationships" ("pairee_id");
CREATE UNIQUE INDEX "index_relationships_on_pairee_id_and_pairer_id" ON "relationships" ("pairee_id", "pairer_id");
CREATE INDEX "index_relationships_on_pairer_id" ON "relationships" ("pairer_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110911071440');

INSERT INTO schema_migrations (version) VALUES ('20110911053721');

INSERT INTO schema_migrations (version) VALUES ('20110911170858');

INSERT INTO schema_migrations (version) VALUES ('20110911045945');

INSERT INTO schema_migrations (version) VALUES ('20110911174052');