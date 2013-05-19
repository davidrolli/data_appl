CREATE TABLE "applications" (
	"id" INTEGER  PRIMARY KEY,
	"table_id" INTEGER  NOT NULL  DEFAULT (2) CHECK(table_id == 2),
	"bezeichnung" VARCHAR(254),
	"bezeichnung_kurz" VARCHAR(30),
	"beschreibung" VARCHAR,
	"zweck" VARCHAR,
	"zielpublikum" VARCHAR,
	"software" VARCHAR,
	"typ_lnk" INTEGER DEFAULT (null),
	"web_app" BOOLEAN,
	"gis_app" BOOLEAN,
	"virtuell" BOOLEAN,
	"erstellungsdatum" DATE,
	"version" VARCHAR(20),
	"versionsdatum" DATE,
	"prioritaet" INTEGER,
	"aktiv" BOOLEAN,
	"fachapplikation" BOOLEAN,
	"anzahl_nutzer" INTEGER,
	"application_server" VARCHAR(50),
	"path_to_application" VARCHAR(254),
	"url_to_application" VARCHAR,
	"path_to_doc" VARCHAR(254),
	"id_persons_verantwortung" INTEGER,
	"id_persons_hersteller" INTEGER,
	"id_persons_support" INTEGER,
	"id_persons_wartung" INTEGER,
	"updated_at" DATE,
	"created_at" DATE
);


CREATE INDEX idx_applications_id ON applications (id);
CREATE INDEX idx_applications_table_id ON applications (table_id);
CREATE INDEX idx_applications_id_persons_verantwortung ON applications (id_persons_verantwortung);
CREATE INDEX idx_applications_id_persons_support ON applications (id_persons_support);
CREATE INDEX idx_applications_id_persons_hersteller ON applications (id_persons_hersteller);
CREATE INDEX idx_applications_id_persons_wartung ON applications (id_persons_wartung);


CREATE TRIGGER tr_inc_id_applications BEFORE INSERT ON applications
BEGIN
    UPDATE applications SET
        id = (SELECT MAX(id) + 1 FROM applications)
    WHERE rowid=NEW.rowid;
END;
