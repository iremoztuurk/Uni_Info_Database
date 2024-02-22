prompt Importing table OGRENCI...
set feedback off
set define off
insert into OGRENCI (OGRENCI_ID, KISI_ID, OGRENCI_NO, VELI_KISI_ID, KAYIT_TARIHI)
values (1, 1, '1', null, to_date('01-01-2023', 'dd-mm-yyyy'));

insert into OGRENCI (OGRENCI_ID, KISI_ID, OGRENCI_NO, VELI_KISI_ID, KAYIT_TARIHI)
values (2, 2, '2', null, to_date('01-01-2023', 'dd-mm-yyyy'));

insert into OGRENCI (OGRENCI_ID, KISI_ID, OGRENCI_NO, VELI_KISI_ID, KAYIT_TARIHI)
values (3, 3, '3', 2, to_date('01-01-2023', 'dd-mm-yyyy'));

insert into OGRENCI (OGRENCI_ID, KISI_ID, OGRENCI_NO, VELI_KISI_ID, KAYIT_TARIHI)
values (4, 4, '4', null, to_date('01-01-2023', 'dd-mm-yyyy'));

insert into OGRENCI (OGRENCI_ID, KISI_ID, OGRENCI_NO, VELI_KISI_ID, KAYIT_TARIHI)
values (5, 5, '5', null, to_date('01-01-2023', 'dd-mm-yyyy'));

prompt Done.
