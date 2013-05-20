CREATE TABLE "rel_datasources_applications" (
	"id" INTEGER  NOT NULL  PRIMARY KEY,
	"id_datasources" INTEGER,
	"id_applications" INTEGER,
	"updated_at" DATE,
	"created_at" DATE,	
	UNIQUE (id_datasources, id_applications)
);


CREATE INDEX idx_rel_datasources_applications_id_datasources ON rel_datasources_applications (id_datasources);
CREATE INDEX idx_rel_datasources_applications_id_applications ON rel_datasources_applications (id_applications);


CREATE TRIGGER tr_inc_id_rel_datasources_applications BEFORE INSERT ON rel_datasources_applications
BEGIN
    UPDATE rel_datasources_applications SET
        id = (SELECT MAX(id) + 1 FROM rel_datasources_applications)
    WHERE rowid=NEW.rowid;
END;
