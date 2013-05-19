CREATE TABLE "db_schemata" (
	"id" INTEGER  PRIMARY KEY,
	"schema_name" VARCHAR(80),
	"db_name" VARCHAR(50),
	"fk_db_server" INTEGER,
	"fk_verantwortung" INTEGER,
	"order" INTEGER,
	"updated_at" DATE,
	"created_at" DATE,
	UNIQUE (schema_name, db_name, fk_db_server)	
);


CREATE INDEX idx_db_schemata_id ON db_schemata (id);
CREATE INDEX idx_db_schemata_schema_name ON db_schemata (schema_name);
CREATE INDEX idx_db_schemata_db_name ON db_schemata (db_name);
CREATE INDEX idx_db_schemata_fk_db_server ON db_schemata (fk_db_server);


CREATE TRIGGER tr_inc_id_db_schemata BEFORE INSERT ON db_schemata
BEGIN
    UPDATE db_schemata SET
        id = (SELECT MAX(id) + 1 FROM db_schemata)
    WHERE rowid=NEW.rowid;
END;
