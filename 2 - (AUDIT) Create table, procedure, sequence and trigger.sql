CREATE TABLE "C##AUDIT"."TB_AUDIT" (
    "AUD_ID" NUMBER(10, 0),
    "AUD_NOME_TABELA" VARCHAR2(30 BYTE),
    "AUD_TIPO_EVENTO" VARCHAR2(10 BYTE),
    "AUD_IDENT_LINHA" VARCHAR2(30 BYTE),
    "AUD_CAMPOS" VARCHAR2(255 BYTE),
    "AUD_VALORES_ANTIGOS" VARCHAR2(2000 BYTE),
    "AUD_VALORES_NOVOS" VARCHAR2(2000 BYTE),
    "AUD_USUARIO_BD" VARCHAR2(30 BYTE),
    "AUD_USUARIO_SO" VARCHAR2(100 BYTE),
    "AUD_TIMESTAMP" TIMESTAMP (6),
    CONSTRAINT "CK_AUD_01" CHECK ("AUD_NOME_TABELA" IS NOT NULL) ENABLE,
    CONSTRAINT "CK_AUD_02" CHECK ("AUD_TIPO_EVENTO" IS NOT NULL) ENABLE,
    CONSTRAINT "CK_AUD_03" CHECK ("AUD_IDENT_LINHA" IS NOT NULL) ENABLE,
    CONSTRAINT "CK_AUD_04" CHECK ("AUD_USUARIO_BD" IS NOT NULL) ENABLE,
    CONSTRAINT "CK_AUD_05" CHECK ("AUD_USUARIO_SO" IS NOT NULL) ENABLE,
    CONSTRAINT "CK_AUD_06" CHECK ("AUD_TIMESTAMP" IS NOT NULL) ENABLE,
    CONSTRAINT "PK_AUD" PRIMARY KEY ("AUD_ID")
);

GRANT INSERT ON c##audit.tb_audit to c##app;

CREATE SEQUENCE seq_aud NOCACHE;

CREATE TRIGGER tg_bi_aud BEFORE
INSERT ON C##AUDIT.TB_AUDIT
    FOR EACH ROW BEGIN :NEW.aud_id := seq_aud.NEXTVAL;
END;
/

CREATE OR REPLACE PROCEDURE pr_aud (
    aud_id INTEGER,
    aud_nome_tabela VARCHAR2,
    aud_tipo_evento VARCHAR2,
    aud_ident_linha VARCHAR2,
    aud_campos VARCHAR2,
    aud_valores_anteriores VARCHAR2,
    aud_valores_novos VARCHAR2,
    aud_usuario_bd VARCHAR2,
    aud_usuario_so VARCHAR2,
    aud_usuario_timestamp TIMESTAMP
)
AS
BEGIN
    INSERT INTO tb_audit VALUES (
        aud_id,
        aud_nome_tabela,
        aud_tipo_evento,
        aud_ident_linha,
        aud_campos,
        aud_valores_anteriores,
        aud_valores_novos,
        aud_usuario_bd,
        aud_usuario_so,
        aud_usuario_timestamp
    );
END;
/

grant execute on c##audit.pr_aud to c##app;

