CREATE OR REPLACE FUNCTION FC_USER_BD RETURN VARCHAR2 AS
    V_USER VARCHAR2 (30);
BEGIN
    SELECT USER INTO V_USER FROM DUAL;
    RETURN V_USER;
END FC_USER_BD;
/

CREATE OR REPLACE FUNCTION FC_USER_SO RETURN VARCHAR2 AS
    V_USER VARCHAR2(200);
BEGIN
    V_USER := sys_context('USERENV', 'OS_USER');
    RETURN V_USER;
END FC_USER_SO;
/

create or replace FUNCTION FC_TIMESTAMP RETURN TIMESTAMP AS
    V_TIMESTAMP TIMESTAMP;
BEGIN
    SELECT CAST(CAST(SYSTIMESTAMP AS TIMESTAMP WITH TIME ZONE) AT TIME ZONE 'America/Sao_Paulo' AS TIMESTAMP) INTO V_TIMESTAMP FROM DUAL;
    RETURN V_TIMESTAMP;
END FC_TIMESTAMP;
/

CREATE OR REPLACE TRIGGER tg_aud_hcopas
AFTER UPDATE OR DELETE ON C##APP.hcopas
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'hcopas';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.hcop_edicao <> :new.hcop_edicao then
            P_CAMPOS := P_CAMPOS || 'hcop_edicao, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hcop_edicao) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hcop_edicao) || ', ';
        END IF;
        
        IF :old.hcop_date_in <> :new.hcop_date_in then
            P_CAMPOS := P_CAMPOS || 'hcop_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hcop_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hcop_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hcop_edicao, hcop_date_in ';
        P_VALORES_ANTERIORES := :old.hcop_edicao || ', ' || :old.hcop_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hcop_id || '-' || :old.hcop_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP);
END;
/

CREATE OR REPLACE TRIGGER tg_aud_hselecoes
AFTER UPDATE OR DELETE ON C##APP.hselecoes
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'hselecoes';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.hsel_nome <> :new.hsel_nome then
            P_CAMPOS := P_CAMPOS || 'hsel_nome, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hsel_nome) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hsel_nome) || ', ';
        END IF;

        IF :old.hsel_trigrama <> :new.hsel_trigrama then
            P_CAMPOS := P_CAMPOS || 'hsel_trigrama, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hsel_trigrama) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hsel_trigrama) || ', ';
        END IF;
        
        IF :old.hsel_date_in <> :new.hsel_date_in then
            P_CAMPOS := P_CAMPOS || 'hsel_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hsel_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hsel_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hsel_nome, hsel_trigrama, hsel_date_in ';
        P_VALORES_ANTERIORES := :old.hsel_nome || ', ' || :old.hsel_trigrama || ', ' || :old.hsel_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hsel_id || '-' || :old.hsel_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP );
END;
/

CREATE OR REPLACE TRIGGER tg_aud_htreinadores
AFTER UPDATE OR DELETE ON C##APP.htreinadores
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'htreinadores';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.htre_nome <> :new.htre_nome then
            P_CAMPOS := P_CAMPOS || 'htre_nome, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.htre_nome) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.htre_nome) || ', ';
        END IF;
        
        IF :old.htre_date_in <> :new.htre_date_in then
            P_CAMPOS := P_CAMPOS || 'htre_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.htre_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.htre_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'htre_nome, htre_date_in ';
        P_VALORES_ANTERIORES := :old.htre_nome || ', ' || :old.htre_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.htre_id || '-' || :old.htre_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP);
END;
/

CREATE OR REPLACE TRIGGER tg_aud_hescalacoes
AFTER UPDATE OR DELETE ON C##APP.hescalacoes
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'hescalacoes';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.hesc_cop_id <> :new.hesc_cop_id then
            P_CAMPOS := P_CAMPOS || 'hesc_cop_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hesc_cop_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hesc_cop_id) || ', ';
        END IF;

        IF :old.hesc_sel_id <> :new.hesc_sel_id then
            P_CAMPOS := P_CAMPOS || 'hesc_sel_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hesc_sel_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hesc_sel_id) || ', ';
        END IF;

        IF :old.hesc_tre_id <> :new.hesc_tre_id then
            P_CAMPOS := P_CAMPOS || 'hesc_tre_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hesc_tre_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hesc_tre_id) || ', ';
        END IF;

        IF :old.hesc_date_in <> :new.hesc_date_in then
            P_CAMPOS := P_CAMPOS || 'hesc_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hesc_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hesc_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hesc_cop_id, hesc_sel_id, hesc_tre_id, hesc_date_in ';
        P_VALORES_ANTERIORES := :old.hesc_cop_id || ', ' || :old.hesc_sel_id || ', ' || :old.hesc_tre_id || ', ' || :old.hesc_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hesc_id|| '-' || :old.hesc_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO,  P_AUD_TIMESTAMP);
END;
/

CREATE OR REPLACE TRIGGER tg_aud_hcidades
AFTER UPDATE OR DELETE ON C##APP.hcidades
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'hcidades';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.hcid_nome <> :new.hcid_nome then
            P_CAMPOS := P_CAMPOS || 'hcid_nome, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hcid_nome) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hcid_nome) || ', ';
        END IF;
        
        IF :old.hcid_date_in <> :new.hcid_date_in then
            P_CAMPOS := P_CAMPOS || 'hcid_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hcid_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hcid_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hcid_nome, hcid_date_in ';
        P_VALORES_ANTERIORES := :old.hcid_nome || ', ' || :old.hcid_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hcid_id || '-' || :old.hcid_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP );
END;
/

CREATE OR REPLACE TRIGGER tg_aud_hestadios
AFTER UPDATE OR DELETE ON C##APP.hestadios
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'hestadios';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.hest_nome <> :new.hest_nome then
            P_CAMPOS := P_CAMPOS || 'hest_nome, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hest_nome) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hest_nome) || ', ';
        END IF;

        IF :old.hest_cid_id <> :new.hest_cid_id then
            P_CAMPOS := P_CAMPOS || 'hest_cid_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hest_cid_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hest_cid_id) || ', ';
        END IF;
        
        IF :old.hest_date_in <> :new.hest_date_in then
            P_CAMPOS := P_CAMPOS || 'hest_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hest_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hest_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hest_nome, hest_cid_id, hest_date_in ';
        P_VALORES_ANTERIORES := :old.hest_nome || ', ' || :old.hest_cid_id || ', ' || :old.hest_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hest_id || '-' || :old.hest_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP);
END;
/

CREATE OR REPLACE TRIGGER tg_aud_hpartidas
AFTER UPDATE OR DELETE ON C##APP.hpartidas
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;

BEGIN
    P_NOME_TABELA := 'hpartidas';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';

        IF :old.hpar_fifa_id <> :new.hpar_fifa_id then
            P_CAMPOS := P_CAMPOS || 'hpar_fifa_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_fifa_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_fifa_id) || ', ';
        END IF;

        IF :old.hpar_data <> :new.hpar_data then
            P_CAMPOS := P_CAMPOS || 'hpar_date, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_data) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_data) || ', ';
        END IF;

        IF :old.hpar_publico <> :new.hpar_publico then
            P_CAMPOS := P_CAMPOS || 'hpar_publico, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_publico) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_publico) || ', ';
        END IF;

        IF :old.hpar_fase <> :new.hpar_fase then
            P_CAMPOS := P_CAMPOS || 'hpar_fase, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_fase) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_fase) || ', ';
        END IF;

        IF :old.hpar_condicoes_especiais_vitoria <> :new.hpar_condicoes_especiais_vitoria then
            P_CAMPOS := P_CAMPOS || 'hpar_condicoes_especiais_vitoria, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_condicoes_especiais_vitoria) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_condicoes_especiais_vitoria) || ', ';
        END IF;

        IF :old.hpar_esc_id_a <> :new.hpar_esc_id_a then
            P_CAMPOS := P_CAMPOS || 'hpar_esc_id_a, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_esc_id_a) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_esc_id_a) || ', ';
        END IF;

        IF :old.hpar_esc_id_b <> :new.hpar_esc_id_b then
            P_CAMPOS := P_CAMPOS || 'hpar_esc_id_b, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_esc_id_b) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_esc_id_b) || ', ';
        END IF;

        IF :old.hpar_cop_id <> :new.hpar_cop_id then
            P_CAMPOS := P_CAMPOS || 'hpar_cop_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_cop_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_cop_id) || ', ';
        END IF;

        IF :old.hpar_est_id <> :new.hpar_est_id then
            P_CAMPOS := P_CAMPOS || 'hpar_est_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_est_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_est_id) || ', ';
        END IF;
        
        IF :old.hpar_date_in <> :new.hpar_date_in then
            P_CAMPOS := P_CAMPOS || 'hpar_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hpar_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hpar_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hpar_fifa_id, hpar_date, hpar_publico, hpar_fase, hpar_condicoes_especiais_vitoria, hpar_esc_id_a, hpar_esc_id_b, hpar_cop_id, hpar_est_id, hpar_date_in ';
        P_VALORES_ANTERIORES := :old.hpar_fifa_id || ', ' || :old.hpar_data || ', ' || :old.hpar_publico || ', ' || :old.hpar_fase || ', ' || :old.hpar_condicoes_especiais_vitoria || ', ' || :old.hpar_esc_id_a || ', ' || :old.hpar_esc_id_b || ', ' || :old.hpar_cop_id || ', ' || :old.hpar_est_id || ', ' || :old.hpar_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hpar_id || '-' || :old.hpar_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;

    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP);
END;
/

CREATE OR REPLACE TRIGGER tg_aud_hjogadores
AFTER UPDATE OR DELETE ON C##APP.hjogadores
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'hjogadores';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.hjog_nome <> :new.hjog_nome then
            P_CAMPOS := P_CAMPOS || 'hjog_nome, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjog_nome) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjog_nome) || ', ';
        END IF;

        IF :old.hjog_data_nascimento <> :new.hjog_data_nascimento then
            P_CAMPOS := P_CAMPOS || 'hjog_date_nascimento, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjog_data_nascimento) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjog_data_nascimento) || ', ';
        END IF;
        
        IF :old.hjog_date_in <> :new.hjog_date_in then
            P_CAMPOS := P_CAMPOS || 'hjog_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjog_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjog_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hjog_nome, hjog_date_nascimento, hjog_date_in ';
        P_VALORES_ANTERIORES := :old.hjog_nome || ', ' || :old.hjog_data_nascimento || ', ' || :old.hjog_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hjog_id || '-' || :old.hjog_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP);
END;
/

CREATE OR REPLACE TRIGGER tg_aud_hescalacoes_jogadores
AFTER UPDATE OR DELETE ON C##APP.hescalacoes_jogadores
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'hescalacoes_jogadores';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.hjsc_esc_id <> :new.hjsc_esc_id then
            P_CAMPOS := P_CAMPOS || 'hjsc_esc_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjsc_esc_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjsc_esc_id) || ', ';
        END IF;

        IF :old.hjsc_jog_id <> :new.hjsc_jog_id then
            P_CAMPOS := P_CAMPOS || 'hjsc_jog_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjsc_jog_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjsc_jog_id) || ', ';
        END IF;

        IF :old.hjsc_numero_camisa <> :new.hjsc_numero_camisa then
            P_CAMPOS := P_CAMPOS || 'hjsc_numero_camisa, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjsc_numero_camisa) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjsc_numero_camisa) || ', ';
        END IF;

        IF :old.hjsc_posicao <> :new.hjsc_posicao then
            P_CAMPOS := P_CAMPOS || 'hjsc_posicao, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjsc_posicao) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjsc_posicao) || ', ';
        END IF;

        IF :old.hjsc_date_in <> :new.hjsc_date_in then
            P_CAMPOS := P_CAMPOS || 'hjsc_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.hjsc_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.hjsc_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'hjsc_esc_id, hjsc_jog_id, hjsc_numero_camisa, hjsc_posicao, hjsc_date_in ';
        P_VALORES_ANTERIORES := :old.hjsc_esc_id || ', ' || :old.hjsc_jog_id || ', ' || :old.hjsc_numero_camisa || ', ' || :old.hjsc_posicao || ', ' || :old.hjsc_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.hjsc_esc_id|| '-' || :old.hjsc_jog_id || '-' || :old.hjsc_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP);
END;
/

CREATE OR REPLACE TRIGGER tg_aud_heventos
AFTER UPDATE OR DELETE ON C##APP.heventos
FOR EACH ROW
DECLARE
    P_NOME_TABELA  varchar2(30);
    P_TIPO_EVENTO  varchar2(10);
    P_IDENT_LINHA  varchar2(50);
    P_CAMPOS  varchar2(2000);
    P_VALORES_ANTERIORES  varchar2(2000);
    P_VALORES_NOVOS  varchar2(2000);
    P_AUD_USUARIO_BD varchar2(30);
    P_AUD_USUARIO_SO varchar2(200);
    P_AUD_TIMESTAMP TIMESTAMP;
BEGIN
    P_NOME_TABELA := 'heventos';
    IF UPDATING THEN
        P_TIPO_EVENTO := 'UPDATE';
        IF :old.heve_tempo_decorrido <> :new.heve_tempo_decorrido then
            P_CAMPOS := P_CAMPOS || 'heve_tempo_decorrido, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.heve_tempo_decorrido) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.heve_tempo_decorrido) || ', ';
        END IF;

        IF :old.heve_descricao <> :new.heve_descricao then
            P_CAMPOS := P_CAMPOS || 'heve_descricao, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.heve_descricao) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.heve_descricao) || ', ';
        END IF;

        IF :old.heve_par_id <> :new.heve_par_id then
            P_CAMPOS := P_CAMPOS || 'heve_par_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.heve_par_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.heve_par_id) || ', ';
        END IF;

        IF :old.heve_jog_id <> :new.heve_jog_id then
            P_CAMPOS := P_CAMPOS || 'heve_jog_id, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.heve_jog_id) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.heve_jog_id) || ', ';
        END IF;
        
        IF :old.heve_date_in <> :new.heve_date_in then
            P_CAMPOS := P_CAMPOS || 'heve_date_in, ';
            P_VALORES_ANTERIORES := P_VALORES_ANTERIORES || TO_CHAR(:old.heve_date_in) || ', ';
            P_VALORES_NOVOS := P_VALORES_NOVOS ||  TO_CHAR(:new.heve_date_in) || ', ';
        END IF;
        
    ELSE
        P_TIPO_EVENTO := 'DELETE';
        P_campos :=  'heve_tempo_decorrido, heve_descricao, heve_par_id, heve_jog_id, heve_date_in ';
        P_VALORES_ANTERIORES := :old.heve_tempo_decorrido || ', ' || :old.heve_descricao || ', ' || :old.heve_par_id || ', ' || :old.heve_jog_id || ', ' || :old.heve_date_in;

    END IF;
    P_IDENT_LINHA := TO_CHAR(:old.heve_id || '-' || :old.heve_date_in);
    P_AUD_USUARIO_BD := fc_user_bd;
    P_AUD_USUARIO_SO := fc_user_so;
    P_AUD_TIMESTAMP := fc_timestamp;
    C##AUDIT.pr_aud(0, P_NOME_TABELA, P_TIPO_EVENTO,P_IDENT_LINHA ,P_campos, P_VALORES_ANTERIORES, P_VALORES_NOVOS,P_AUD_USUARIO_BD,P_AUD_USUARIO_SO, P_AUD_TIMESTAMP);
END;
/
