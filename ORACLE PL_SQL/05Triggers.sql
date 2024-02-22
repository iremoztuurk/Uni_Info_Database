CREATE OR REPLACE TRIGGER "IREM"."INC_LAST_VAL" 
before insert on kisi
for each row
declare
    v_row_num number;
begin
    dbms_output.put_line('Yeni kisi eklendi..');
    lastval('KISI', 'KISI_ID', v_row_num);
    dbms_output.put_line('last val1:' || v_row_num);
    :NEW.kisi_id := v_row_num + 1;
    dbms_output.put_line('last val2:' || :NEW.kisi_id);
    
    update seq 
    set last_val = v_row_num + 1
    where tablo_adi = 'KISI'
    and field_name = 'KISI_ID';
end;

/
ALTER TRIGGER "IREM"."INC_LAST_VAL" ENABLE;
--------------------------------------------------------
CREATE OR REPLACE TRIGGER "IREM"."INC_UYRUK_ID" 
before insert on uyruk
for each row
begin
    dbms_output.put_line('Yeni uyruk eklendi..');
    :NEW.uyruk_id := pk_seq_uyruk.NEXTVAL;
    update seq
    set last_val = :NEW.uyruk_id
    where tablo_adi = 'UYRUK'
    and field_name = 'UYRUK_ID';
end;

/
ALTER TRIGGER "IREM"."INC_UYRUK_ID" ENABLE;
