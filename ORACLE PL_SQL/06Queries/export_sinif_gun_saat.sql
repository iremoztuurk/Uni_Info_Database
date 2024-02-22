prompt Importing table SINIF_GUN_SAAT...
set feedback off
set define off
insert into SINIF_GUN_SAAT (SINIF_GUN_SAAT_ID, SINIF_ID, GUN_ID, BAS_SAAT, SURE)
values (1, 1, 1, to_date('22-12-2022 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 50);

insert into SINIF_GUN_SAAT (SINIF_GUN_SAAT_ID, SINIF_ID, GUN_ID, BAS_SAAT, SURE)
values (2, 2, 3, to_date('24-12-2022 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), 50);

prompt Done.
