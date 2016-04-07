-- Add/modify columns 
alter table ASU.TMODALITY add FC_COMM varchar2(50);
-- Add comments to the columns 
comment on column ASU.TMODALITY.FC_COMM
  is 'Комментарий';
/
insert into asu.tmodality (fk_id, fc_name,FC_COMM) 
select 1,'AU','Audio' from dual
union
select 2,'BI' ,  'Biomagnetic Imaging'  from dual
union
select 3,'CD' ,  'Color flow Doppler'  from dual
union
select 4,'CR' ,  'Computed radiography'  from dual
union
select 5,'CT' ,  'Computed tomography'  from dual
union
select 6,'DD' ,  'uplex Doppler'  from dual
union
select 7,'DG' ,  'iaphanography'  from dual
union
select 8,'DSA' ,  'Digital Subtraction Angiography'  from dual
union
select 9,'DX' ,  'Digital Radiography'  from dual
union
select 10,'ECG' ,  'Electrocardiography'  from dual
union
select 11,'EPS' ,  'Cardiac Electrophysiology'  from dual
union
select 12,'ES' ,  'Endoscopy'  from dual
union
select 13,'GM' ,  'General Microscopy'  from dual
union
select 14,'HC' ,  'Hard Copy'  from dual
union
select 15,'HD' ,  'Hemodynamic Waveform'  from dual
union
select 16,'IO' ,  'Intra-Oral Radiography'  from dual
union
select 17,'IVUS' ,'Intravascular Ultrasound'  from dual
union
select 18,'LS' ,  'Laser surface scan'  from dual
union
select 19,'MG' ,  'Mammography'  from dual
union
select 20,'MR' ,  'Magnetic Resonance'  from dual
union
select 21,'NM' ,  'Nuclear Medicine'  from dual
union
select 22,'OCT' ,  'Optical Coherence Tomography'  from dual
union
select 23,'OP' ,  'Ophthalmic Photography'  from dual
union
select 24,'OPM' ,  'Ophthalmic Mapping'  from dual
union
select 25,'OPR' ,  'Ophthalmic Refraction'  from dual
union
select 26,'OPV' ,  'Ophthalmic Visual Field'  from dual
union
select 27,'OT' ,  'Other'  from dual
union
select 28,'PR' ,  'Presentation State'  from dual
union
select 29,'PET' ,  'Positron Emission Tomography - PET'  from dual
union
select 30,'PX' ,  'Panoramic X-Ray'  from dual
union
select 31,'REG' ,  'Registration'  from dual
union
select 32,'RF' ,  'Radio Fluoroscopy'  from dual
union
select 33,'RG' ,  'Radiographic imaging (conventional film/screen)'  from dual
union
select 34,'RTDOSE' ,  'Radiotherapy Dose'  from dual
union
select 35,'RTIMAGE' ,  'Radiotherapy Image'  from dual
union
select 36,'RTPLAN' ,  'Radiotherapy Plan'  from dual
union
select 37,'RTRECORD' ,  'RT Treatment Record'  from dual
union
select 38,'RTSTRUCT' ,  'Radiotherapy Structure Set'  from dual
union
select 39,'SEG' ,  'Segmentation'  from dual
union
select 40,'SM' ,  'Slide Microscopy'  from dual
union
select 41,'SMR' ,  'Stereometric Relationship'  from dual
union
select 42,'SR' ,  'SR Document'  from dual
union
select 43,'ST' ,  'Single-photon emission computed tomography (SPECT)'  from dual
union
select 44,'TG' ,  'Thermography'  from dual
union
select 45,'US' ,  'Ultrasound'  from dual
union
select 46,'XA' ,  'X-Ray Angiography'  from dual
union
select 47,'XC' ,  'External-camera photography'  from dual