CREATE TABLE "rel_keywords_table_n" (
	"table_pointer" INTEGER,
	"table_rec_id" INTEGER,
	"id_keywords" INTEGER,
	"updated_at" DATE,
	"created_at" DATE,
	PRIMARY KEY (table_pointer, table_rec_id, id_keywords)
);


CREATE INDEX idx_rel_keywords_table_n_table_pointer ON rel_keywords_table_n (table_pointer);
CREATE INDEX idx_rel_keywords_table_n_table_rec_id ON rel_keywords_table_n (table_rec_id);
CREATE INDEX idx_rel_keywords_table_n_id_keywords ON rel_keywords_table_n (id_keywords);
