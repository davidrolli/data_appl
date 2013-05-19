CREATE TABLE "lt_epsg" (
	"id" INTEGER  PRIMARY KEY,
	"epsg_nr" INTEGER,
	"epsg_txt" VARCHAR(50),
	"order" INTEGER,
	"updated_at" DATE,
	"created_at" DATE	
);

CREATE INDEX idx_lt_epsg_id ON lt_epsg (id);
CREATE INDEX idx_lt_epsg_epsg_nr ON lt_epsg (epsg_nr);


CREATE TRIGGER tr_inc_id_lt_epsg BEFORE INSERT ON lt_epsg
BEGIN
    UPDATE lt_epsg SET
        id = (SELECT MAX(id) + 1 FROM lt_epsg)
    WHERE rowid=NEW.rowid;
END;
