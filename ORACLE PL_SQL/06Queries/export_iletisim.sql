prompt Importing table ILETISIM...
set feedback off
set define off
insert into ILETISIM (ILETISIM_ID, ILETISIM_SAHIP_TUR_ID, ILETISIM_SAHIP_PK_ID, ILETISIM_TUR_ID, TERCIH_SIRA_NO, ILETISIM_BILGI, ORG_ID, BAS_TARIH, BIT_TARIH, AKTIF)
values (3, 1, 5, 2, 1, '5559640256', null, to_date('01-01-2024', 'dd-mm-yyyy'), null, 1);

insert into ILETISIM (ILETISIM_ID, ILETISIM_SAHIP_TUR_ID, ILETISIM_SAHIP_PK_ID, ILETISIM_TUR_ID, TERCIH_SIRA_NO, ILETISIM_BILGI, ORG_ID, BAS_TARIH, BIT_TARIH, AKTIF)
values (4, 2, 3, 3, 1, '@tobb_etu_muh', 3, to_date('01-02-2025', 'dd-mm-yyyy'), null, 1);

insert into ILETISIM (ILETISIM_ID, ILETISIM_SAHIP_TUR_ID, ILETISIM_SAHIP_PK_ID, ILETISIM_TUR_ID, TERCIH_SIRA_NO, ILETISIM_BILGI, ORG_ID, BAS_TARIH, BIT_TARIH, AKTIF)
values (1, 1, 1, 1, 1, 'A Sokak B Binasi', null, to_date('01-01-2020', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 1);

insert into ILETISIM (ILETISIM_ID, ILETISIM_SAHIP_TUR_ID, ILETISIM_SAHIP_PK_ID, ILETISIM_TUR_ID, TERCIH_SIRA_NO, ILETISIM_BILGI, ORG_ID, BAS_TARIH, BIT_TARIH, AKTIF)
values (2, 2, 4, 4, 1, 'ceng.com.tr', 1, to_date('01-01-2020', 'dd-mm-yyyy'), null, 1);

prompt Done.
