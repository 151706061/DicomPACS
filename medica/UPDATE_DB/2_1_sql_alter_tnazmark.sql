	ALTER TABLE ASU.TNAZMARK ADD (FK_NAZMEDLECHID NUMBER);
	COMMENT ON COLUMN ASU.TNAZMARK.FK_NAZMEDLECHID IS 'TNAZMEDLECH.FK_ID - код назначенного препарата на выдачу. “олько дл€ медикоментозных назначений. Add A.Nakorjakov 13122007';
	exit
	/ 