CREATE TABLE "datasources" (
	"id" INTEGER  PRIMARY KEY,
	"table_id" INTEGER  NOT NULL  DEFAULT (1) CHECK(table_id == 1),
	"bezeichnung" VARCHAR(254),
	"bezeichnung_kurz" VARCHAR(30),
	"beschreibung" VARCHAR,
	"thematik" VARCHAR,
	"zielpublikum" VARCHAR,
	"typ_lnk" INTEGER,
	"erstellungsdatum" DATE,
	"version" VARCHAR(20),
	"nachfuehrung" BOOLEAN,
	"stand" DATE,
	"genauigkeit" VARCHAR(50),
	"prioritaet" INTEGER,
	"aktiv" BOOLEAN,
	"zugriff_via_web" BOOLEAN,
	"anzahl_nutzer" INTEGER,
	"db_typ_cd" INTEGER,
	"postgis_version" INTEGER,
	"db_server" VARCHAR(50),
	"id_db_server" INTEGER,
	"db_name" VARCHAR(50),
	"db_schema" VARCHAR(50),
	"id_db_schema" INTEGER,
	"ftp_server" VARCHAR(100),
	"path_to_database" VARCHAR(254),
	"url_to_data" VARCHAR,
	"path_to_doc" VARCHAR(254),
	"geo_daten" BOOLEAN,
	"alphanummerische_daten" BOOLEAN,
	"bild_daten" BOOLEAN,
	"gis2012" BOOLEAN,
	"epsg_cd" INTEGER,
	"id_persons_datenherr" INTEGER
	"id_persons_verantwortung" INTEGER,
	"id_persons_support" INTEGER,
	"id_persons_hersteller" INTEGER,
	"id_persons_wartung" INTEGER,
	"updated_at" DATE,
	"created_at" DATE
);


CREATE INDEX idx_datasources_id ON datasources (id);
CREATE INDEX idx_datasources_table_id ON datasources (table_id);
CREATE INDEX idx_datasources_id_db_schema ON datasources (id_db_schema);
CREATE INDEX idx_datasources_id_persons_datenherr ON datasources (id_persons_datenherr);
CREATE INDEX idx_datasources_id_persons_verantwortung ON datasources (id_persons_verantwortung);
CREATE INDEX idx_datasources_id_persons_support ON datasources (id_persons_support);
CREATE INDEX idx_datasources_id_persons_hersteller ON datasources (id_persons_hersteller);
CREATE INDEX idx_datasources_id_persons_wartung ON datasources (id_persons_wartung);


CREATE TRIGGER tr_inc_id_datasources BEFORE INSERT ON datasources
BEGIN
    UPDATE datasources SET
        id = (SELECT MAX(id) + 1 FROM datasources)
    WHERE rowid=NEW.rowid;
END;
