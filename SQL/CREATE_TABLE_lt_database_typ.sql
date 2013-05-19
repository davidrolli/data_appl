CREATE TABLE "lt_database_typ" (
	"id" INTEGER  PRIMARY KEY,
	"database_typ" VARCHAR(50),
	"order" INTEGER,
	"updated_at" DATE,
	"created_at" DATE	
);


CREATE INDEX idx_lt_database_typ_id ON lt_database_typ (id);


CREATE TRIGGER tr_inc_id_lt_database_typ BEFORE INSERT ON lt_database_typ
BEGIN
    UPDATE lt_database_typ SET
        id = (SELECT MAX(id) + 1 FROM lt_database_typ)
    WHERE rowid=NEW.rowid;
END;
