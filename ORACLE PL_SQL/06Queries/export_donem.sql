prompt Importing table DONEM...
set feedback off
set define off
insert into DONEM (DONEM_ID, YARIYIL_ID, YIL, BAS_TARIH, BIT_TARIH)
values (1, 1, 2023, to_date('02-02-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'));

insert into DONEM (DONEM_ID, YARIYIL_ID, YIL, BAS_TARIH, BIT_TARIH)
values (2, 2, 2023, to_date('02-09-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'));

insert into DONEM (DONEM_ID, YARIYIL_ID, YIL, BAS_TARIH, BIT_TARIH)
values (3, 3, 2023, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('02-08-2023', 'dd-mm-yyyy'));

insert into DONEM (DONEM_ID, YARIYIL_ID, YIL, BAS_TARIH, BIT_TARIH)
values (4, 1, 2024, to_date('02-02-2024', 'dd-mm-yyyy'), to_date('02-06-2024', 'dd-mm-yyyy'));

insert into DONEM (DONEM_ID, YARIYIL_ID, YIL, BAS_TARIH, BIT_TARIH)
values (5, 2, 2024, to_date('02-09-2024', 'dd-mm-yyyy'), to_date('02-01-2025', 'dd-mm-yyyy'));

insert into DONEM (DONEM_ID, YARIYIL_ID, YIL, BAS_TARIH, BIT_TARIH)
values (6, 3, 2024, to_date('02-07-2024', 'dd-mm-yyyy'), to_date('02-08-2024', 'dd-mm-yyyy'));

prompt Done.
