CREATE TABLE "datasource_application" (
	"datasources_id" INTEGER,
	"applications_id" INTEGER,
	"updated_at" DATE,
	"created_at" DATE,	
	PRIMARY KEY (datasources_id, applications_id)
);


CREATE INDEX idx_datasource_application_datasources_id ON datasource_application (datasources_id);
CREATE INDEX idx_datasource_application_applications_id ON datasource_application (applications_id);
