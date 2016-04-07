	drop index asu.tnazmark_by_nazid
	/
	CREATE INDEX asu.tnazmark_by_nazid ON asu.tnazmark
	(
		fk_nazid                        ASC
	)
	PCTFREE     10
	INITRANS    2
	MAXTRANS    255
	TABLESPACE  indx
	STORAGE   (
		INITIAL     131072
		MINEXTENTS  1
		MAXEXTENTS  2147483645
	)
	NOLOGGING
	/

	exit
	/