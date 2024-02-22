prompt Importing table KISI_GOREV...
set feedback off
set define off
insert into KISI_GOREV (KISI_GOREV_ID, KISI_ID, GOREV_ID, ORG_ID, BAS_TARIH, BIT_TARIH)
values (1, 6, 1, 4, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'));

insert into KISI_GOREV (KISI_GOREV_ID, KISI_ID, GOREV_ID, ORG_ID, BAS_TARIH, BIT_TARIH)
values (2, 7, 5, 3, to_date('13-04-2023', 'dd-mm-yyyy'), null);

prompt Done.
