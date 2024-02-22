prompt Importing table ORG...
set feedback off
set define off
insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (1, 'HacUni', 'Hacettepe Universitesi', null, 1, 'HACETTEPE UNIVERSITESI', 1);

insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (2, 'KizKamp', 'Kizilay Kampusu', 1, 2, 'KIZILAY KAMPUSU', 1);

insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (3, 'MuhFak', 'Muhendislik Fakultesi', 2, 3, 'MUHENDISLIK FAKULTESI', 1);

insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (4, 'CENG', 'Bilgisayar Muhendisligi', 3, 4, 'BILGISAYAR MUHENDISLIGI', 1);

insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (5, 'IE', 'Endustri Muhendisligi', 3, 4, 'ENDUSTRI MUHENDISLIGI', 1);

insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (6, null, 'A Binasi', 5, 3, 'A BINASI', 1);

insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (7, 'A-202', 'A202-OFIS', 6, 9, 'A202-OFIS', 1);

insert into ORG (ORG_ID, ORG_KODU, ORG_ADI, UST_ORG_ID, ORG_TUR_ID, ORG_ADI_ASC, ORG_AKTIF)
values (8, 'D-110', 'D110-DERSLIK', 6, 6, 'D110-DERSLIK', 1);

prompt Done.
