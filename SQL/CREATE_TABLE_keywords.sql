CREATE TABLE "keywords" (
	"id" INTEGER  PRIMARY KEY,
	"schluesselwort" VARCHAR(50),
	"updated_at" DATE,
	"created_at" DATE	
);

CREATE INDEX idx_keywords_id ON keywords (id);
CREATE INDEX idx_keywords_schluesselwort ON keywords (schluesselwort);


CREATE TRIGGER tr_inc_id_keywords BEFORE INSERT ON keywords
BEGIN
    UPDATE keywords SET
        id = (SELECT MAX(id) + 1 FROM keywords)
    WHERE rowid=NEW.rowid;
END;
