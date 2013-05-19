CREATE TABLE "persons" (
	"id" INTEGER  NOT NULL  PRIMARY KEY,
	"name" VARCHAR(50),
	"vorname" VARCHAR(30),
	"passwort" VARCHAR(100),
	"geburtsdatum" DATE,
	"benutzertyp" INTEGER,
	"zeitkapazitaet" INTEGER,
	"firma" VARCHAR(254),
	"firma_kurz" VARCHAR(30),
	"dir" VARCHAR(50),
	"dir_abk" VARCHAR(10),
	"dst" VARCHAR(50),
	"dst_abk" VARCHAR(10),
	"abt" VARCHAR(50),
	"abt_abk" VARCHAR(10),
	"g_telefon" VARCHAR(30),
	"g_mobil" VARCHAR(30),
	"g_email" VARCHAR(80),
	"g_fax" VARCHAR(30),
	"g_strasse" VARCHAR(120),
	"g_strassen_nr" VARCHAR(6),
	"g_standort" VARCHAR(30),
	"g_plz" VARCHAR(20),
	"g_ort" VARCHAR(80),
	"g_land" VARCHAR(40),
	"g_homepage" VARCHAR(120),
	"p_telefon" VARCHAR(30),
	"p_mobil" VARCHAR(30),
	"p_email" VARCHAR(80),
	"p_fax" VARCHAR(30),
	"p_strasse" VARCHAR(120),
	"p_strassen_nr" VARCHAR(6),
	"p_plz" VARCHAR(20),
	"p_ort" VARCHAR(20),
	"p_land" VARCHAR(40),
	"updated_at" DATE,
	"created_at" DATE	
);


CREATE INDEX idx_persons_id ON persons (id);


CREATE TRIGGER tr_inc_id_persons BEFORE INSERT ON persons
BEGIN
    UPDATE persons SET
        id = (SELECT MAX(id) + 1 FROM persons)
    WHERE rowid=NEW.rowid;
END;
