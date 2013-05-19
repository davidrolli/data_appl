CREATE TABLE "rel_datasources_applications" (
	"id_datasources" INTEGER,
	"id_applications" INTEGER,
	"updated_at" DATE,
	"created_at" DATE,	
	PRIMARY KEY (id_datasources, id_applications)
);


CREATE INDEX idx_rel_datasources_applications_id_datasources ON rel_datasources_applications (id_datasources);
CREATE INDEX idx_rel_datasources_applications_id_applications ON rel_datasources_applications (id_applications);
