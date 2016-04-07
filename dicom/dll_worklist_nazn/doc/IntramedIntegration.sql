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
      @patUniqueID int, -- External UniqueID, т.е _Ваш_ ID -> PatNr
      @patCardCode varchar(80), -- Номер Карты -> PatientID
      @patPrefix char(1)= null, -- В программе не отображается! Пока не используется
      @patLastName varchar(35)='', -- Фамилия -> PatientName
      @patFirstName varchar(35)='', -- Имя -> PatientName
      @patMiddleName varchar(35)='', -- Отчество -> PatientName
        @patBirthDate char(8)=null,  -- Дата рождения -> PatientBirthDate
      @patSex char(1)='',  -- 'M' || 'F' -> PatientSex
      @HIPAXAETitle varchar(16), -- -> AE
      @patRoom varchar(60)='', -- Комната Пока не используется
      @patDiagnCode varchar(10)='', -- Код направительного диагноза по МКБ-10 -> Пока не используется
      @patReqDepartment varchar(60)='', -- Направившее подразделение
      @patReqPhLastName varchar (35)='', -- Фамилия направившего врача  -> Phys1
      @patReqPhFirstName varchar (35)='', -- Имя направившего врача  -> Phys2
      @patReqPhMiddleName varchar (35)='', -- Отчество направившего врача -> Phys3
      @patModalityName varchar(30),  -- Название модальности ('Рентген') -> Modality
      @patBodyPart varchar(80)='', -- Название исследуемой части тела -> Пока не используется
      @patStudyName varchar(60)='', -- Название исследования
      @patUrgent smallint=null, -- Экстренный (1/0)-> Пока не используется
      @patTimeDate varchar(14)=null, -- Время направления -> StudyDate, StudyTime
	@site int=0 	-- 0 - Поликлиника, 1 - Стационар	
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
