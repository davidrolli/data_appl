CREATE TABLE "projects" (
	"id" INTEGER  PRIMARY KEY,
	"projektname" VARCHAR(254),
	"beschreibung" VARCHAR,
	"id_persons_projektverantwortung" INTEGER,
	"updated_at" DATE,
	"created_at" DATE	
);

CREATE INDEX idx_projects_id ON projects (id);
CREATE INDEX idx_projects_id_persons_projektverantwortung ON projects (id_persons_projektverantwortung);


CREATE TRIGGER tr_inc_id_projects BEFORE INSERT ON projects
BEGIN
    UPDATE projects SET
        id = (SELECT MAX(id) + 1 FROM projects)
    WHERE rowid=NEW.rowid;
END;
