CREATE TABLE "lt_postgis_version" (
	"id" INTEGER  PRIMARY KEY,
	"postgis_typ" varchar(50),
	"order" INTEGER,
	"updated_at" DATE,
	"created_at" DATE	
);


CREATE INDEX idx_lt_postgis_version_id ON lt_postgis_version (id);


CREATE TRIGGER tr_inc_id_lt_postgis_version BEFORE INSERT ON lt_postgis_version
BEGIN
    UPDATE lt_postgis_version SET
        id = (SELECT MAX(id) + 1 FROM lt_postgis_version)
    WHERE rowid=NEW.rowid;
END;
