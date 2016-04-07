 -- object recreation
DROP INDEX mir.dicom_wlres_buffer_idx1;

CREATE UNIQUE INDEX dicom_wlres_buffer_idx1 ON mir.dicom_wlres_buffer
  USING btree (accessionnumber COLLATE pg_catalog."default");

CREATE UNIQUE INDEX accessionnumber_idx ON mypacs.worklist
  USING btree (accessionnumber);