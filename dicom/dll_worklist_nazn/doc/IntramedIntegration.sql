ALTER TABLE [dbo].[dicpat] ADD
[risid] [int] NULL
Go
ALTER TABLE [dbo].[worklist] ADD
[risid] [varchar] (50) COLLATE Cyrillic_General_CI_AS NULL
Go
CREATE     trigger 
	[dbo].[i_dicpat]
on 
	[dbo].[dicpat]
for insert as 
update dicpat set dicpat.risid=worklist.risid 
from dicpat inner join worklist on dicpat.patid=worklist.patid
inner join inserted on dicpat.patnum=inserted.patnum
Go
CREATE         procedure [dbo].[sp_InsertInQueue]
      @patUniqueID int, -- External UniqueID, �.� _���_ ID -> PatNr
      @patCardCode varchar(80), -- ����� ����� -> PatientID
      @patPrefix char(1)= null, -- � ��������� �� ������������! ���� �� ������������
      @patLastName varchar(35)='', -- ������� -> PatientName
      @patFirstName varchar(35)='', -- ��� -> PatientName
      @patMiddleName varchar(35)='', -- �������� -> PatientName
        @patBirthDate char(8)=null,  -- ���� �������� -> PatientBirthDate
      @patSex char(1)='',  -- 'M' || 'F' -> PatientSex
      @HIPAXAETitle varchar(16), -- -> AE
      @patRoom varchar(60)='', -- ������� ���� �� ������������
      @patDiagnCode varchar(10)='', -- ��� ��������������� �������� �� ���-10 -> ���� �� ������������
      @patReqDepartment varchar(60)='', -- ����������� �������������
      @patReqPhLastName varchar (35)='', -- ������� ������������ �����  -> Phys1
      @patReqPhFirstName varchar (35)='', -- ��� ������������ �����  -> Phys2
      @patReqPhMiddleName varchar (35)='', -- �������� ������������ ����� -> Phys3
      @patModalityName varchar(30),  -- �������� ����������� ('�������') -> Modality
      @patBodyPart varchar(80)='', -- �������� ����������� ����� ���� -> ���� �� ������������
      @patStudyName varchar(60)='', -- �������� ������������
      @patUrgent smallint=null, -- ���������� (1/0)-> ���� �� ������������
      @patTimeDate varchar(14)=null, -- ����� ����������� -> StudyDate, StudyTime
	@site int=0 	-- 0 - �����������, 1 - ���������	
as
SET DATEFORMAT mdy
declare @t datetime
set @t='18991230 ' + SUBSTRING(@patTimeDate,9,2)+':'+SUBSTRING(@patTimeDate,11,2)--+':'+SUBSTRING(@patTimeDate,13,2)
insert into worklist (status, patname, patid, patotherid, patbirthdate, patbirthtime, patsex, pataddresse,
 patmedicalalerts, patethnicgroup, patcontrastallergies, patpregnancystatus, pathistory, patcomments,
  specialneeds, patstate, patconfidentialconstraint, accessionnumber, referringpysician, requestingservice,
   requestingphysician, sstationaetitle, spstartdate, spstarttime, modatity, sperformingphysician, 
   spstepdescription, spstepid, sstationname, spsteplocation, premedication, requestedcontrastagent,
    requestedprocedureid, proceduredescription, studyinstanceuid, requestedprocedurepriority,
     patienttransportarrangements, readingphysician, currentlocation, resultsphysician, procedurecomments,
      imagingcomments, admissionid, admittingdiagnosisdescription, risid)
--		status,		patname,										patid,patotherid, patbirthdate,					patbirthtime,		patsex, pataddresse,
  values (0, @patLastName+'^'+@patFirstName+'^'+@patMiddleName, @patCardCode, '', SUBSTRING(@patBirthDate,1,8), 'Dec 30 1899 12:00AM', @patSex, '',
-- patmedicalalerts, patethnicgroup, patcontrastallergies, patpregnancystatus, pathistory, patcomments,    
     '',				'',				'',					0,					'',			'', 
-- specialneeds, patstate, patconfidentialconstraint, accessionnumber, referringpysician,																						requestingservic
      '',			'',			'',						'',					IsNull(@patReqPhLastName,'')+'^'+Rtrim(Ltrim(@patReqPhMiddleName))+'^'+RTrim(LTrim(@patReqPhFirstName)),'', 
-- requestingphysician, sstationaetitle,	spstartdate,	spstarttime, modatity, sperformingphysician,       
      '',				@HIPAXAETitle, SUBSTRING(@patTimeDate,1,8), @t,	@patModalityName,		'', 
-- spstepdescription, spstepid, sstationname, spsteplocation, premedication, requestedcontrastagent,
       '',				'',			'',				'',			'',				'', 
-- requestedprocedureid, proceduredescription, studyinstanceuid,																					requestedprocedurepriority,
        '',					'',
-- '1.3.4515.14156.563637.64.7.335.2426.' + Replace(Replace(Cast(Rand() as varchar(17))+'.'+Cast(Rand(1) as varchar(17)),'0.',''),'.0','.1')+'.1',
--'1.2.276.0.54.'+Replace(cast(year(getdate()) as char(4))+'.'+cast(month(getdate()) as varchar(2))+'.'+cast(day(getdate()) as varchar(2)) +'.'+ Cast(rand()*1000000 as  varchar(10)),'.0','.1'),
'1.2.276.0.54.'+Replace(convert(char(11),getdate(),102 ) +'.'+ Cast(rand()*1000000 as  varchar(10)),'.0','.1'),
 '',
-- patienttransportarrangements, readingphysician, currentlocation, resultsphysician, procedurecomments,
         '',						'',				'',					'',				@patStudyName, 
--imagingcomments, admissionid, admittingdiagnosisdescription, risid)         
          '',		'',			'',							@patUniqueID) 
 
SELECT SCOPE_IDENTITY()
