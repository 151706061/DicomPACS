delete from med.tmo_group where tmo_group.fc_group = 'Аптека';

INSERT INTO med.tmo_group VALUES (null,'Аптека',0);

update med.tkart set fk_mogroupid = (select groupid from med.tmo_group where fc_group = 'Аптека' );

