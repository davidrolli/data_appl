CREATE TABLE "db_servers" (
	"id" INTEGER  PRIMARY KEY,
	"server_name" VARCHAR(50),
	"db_typ_cd" INTEGER,
	"id_persons_verantwortung" INTEGER,
	"order" INTEGER,
	"updated_at" DATE,
	"created_at" DATE
);


CREATE INDEX idx_db_servers_id ON db_servers (id);
CREATE INDEX idx_db_servers_id_persons_verantwortung ON db_servers (id_persons_verantwortung);


CREATE TRIGGER tr_inc_id_db_servers BEFORE INSERT ON db_servers
BEGIN
    UPDATE db_servers SET
        id = (SELECT MAX(id) + 1 FROM db_servers)
    WHERE rowid=NEW.rowid;
END;
