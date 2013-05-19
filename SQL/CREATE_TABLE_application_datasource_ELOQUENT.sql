CREATE TABLE "application_datasource" (
	"id" INTEGER  NOT NULL  PRIMARY KEY,
	"application_id" INTEGER,
	"datasource_id" INTEGER,
	"updated_at" DATE,
	"created_at" DATE,	
	UNIQUE (application_id, datasource_id)
);


CREATE INDEX idx_application_datasource_application_id ON application_datasource (application_id);
CREATE INDEX idx_application_datasource_datasource_id ON application_datasource (datasource_id);


CREATE TRIGGER tr_inc_id_appl_data BEFORE INSERT ON application_datasource
BEGIN
    UPDATE application_datasource SET
        id = (SELECT MAX(id) + 1 FROM application_datasource)
    WHERE rowid=NEW.rowid;
END;
