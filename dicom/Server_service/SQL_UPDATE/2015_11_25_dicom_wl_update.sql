ALTER TABLE mypacs.worklist ADD COLUMN prescid CHAR(36);

CREATE INDEX worklist_idx01 ON mypacs.worklist USING btree (prescid);

