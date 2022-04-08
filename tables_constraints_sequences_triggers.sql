CREATE TABLE cidades (
    cid_id     INTEGER NOT NULL,
    cid_nome   VARCHAR2(100),
    cid_pai_id INTEGER NOT NULL
);

COMMENT ON TABLE cidades IS
    'Esta tabela armazena dados referentes às cidades em que se encontram os Cidades.';

COMMENT ON COLUMN cidades.cid_id IS
    'Chave primária da tabela  CIDADES.';

COMMENT ON COLUMN cidades.cid_pai_id IS
    'Esta coluna faz referência à tabela Países, indicando à qual país esta cidade pertence.';

COMMENT ON COLUMN cidades.cid_nome IS
    'Esta coluna armazena o nome da cidade.';

CREATE TABLE copas (
    cop_id     INTEGER NOT NULL,
    cop_edicao NUMBER(4)
);

COMMENT ON TABLE copas IS
    'Esta tabela armazena dados referentes às Copas.';

COMMENT ON COLUMN copas.cop_id IS
    'Chave primária da tabela COPAS.';

COMMENT ON COLUMN copas.cop_edicao IS
    'Esta coluna armazena o ano de realização da copa.';

CREATE TABLE escalacoes (
    esc_id     INTEGER NOT NULL,
    esc_cop_id INTEGER NOT NULL,
    esc_sel_id INTEGER NOT NULL,
    esc_tre_id INTEGER NOT NULL
);

COMMENT ON TABLE escalacoes IS
    'Esta tabela armazena dados referentes às escalações realizadas.';

COMMENT ON COLUMN escalacoes.esc_id IS
    'chave primária da tabela ESCALACOES.';

COMMENT ON COLUMN escalacoes.esc_cop_id IS
    'Esta coluna faz referência à tabela Copas, indicando para qual edição da copa essa escalação foi designada.';

COMMENT ON COLUMN escalacoes.esc_sel_id IS
    'Esta coluna faz referência à tabela Selecoes, indicando a qual seleção essa escalação pertence.';

COMMENT ON COLUMN escalacoes.esc_tre_id IS
    'Esta coluna faz referência à tabela Treinadores, indicando quem foi o treinador responsável por essa escalação.';


CREATE TABLE estadios (
    est_id     INTEGER NOT NULL,
    est_nome   VARCHAR2(100),
    est_cid_id INTEGER NOT NULL
);

COMMENT ON TABLE estadios IS
    'Esta tabela armazena dados referentes aos Estádios em que foram disponibilizadas para a realização das partidas.';

COMMENT ON COLUMN estadios.est_id IS
    'Chave primária da tabela ESTADIOS.';

COMMENT ON COLUMN estadios.est_cid_id IS
    'Esta coluna faz referência à tabela Cidade, indicando em qual cidade o estádio está localizado.';

COMMENT ON COLUMN estadios.est_nome IS
    'Esta coluna armazena o nome do estádio.';

CREATE TABLE eventos (
    eve_id              INTEGER NOT NULL,
    eve_tempo_decorrido NUMBER(3),
    eve_descricao       VARCHAR2(200),
    eve_jog_id          INTEGER NOT NULL,
    eve_par_id          INTEGER NOT NULL
);

COMMENT ON TABLE eventos IS
    'Esta tabela armazena dados referentes aos eventos que podem acontecer durante uma partida.';

COMMENT ON COLUMN eventos.eve_id IS
    'Chave primária da tabela  EVENTOS.';

COMMENT ON COLUMN eventos.eve_tempo_decorrido IS
    'Esta coluna armazena a marcação de tempo de partida no momento do acontecimento do evento (em minutos).';

COMMENT ON COLUMN eventos.eve_descricao IS
    'Descrição do evento (cartões, faltas, gols, substituições etc.).';

COMMENT ON COLUMN eventos.eve_jog_id IS
    'Esta coluna faz referência à tabela Jogadores, indicando o jogador envolvido no evento.';

COMMENT ON COLUMN eventos.eve_par_id IS
    'Esta coluna faz referência à tabela Partidas, indicando a partida em que o evento ocorreu.';

CREATE TABLE jogadores (
    jog_id   INTEGER NOT NULL,
    jog_nome VARCHAR2(200)
);

COMMENT ON TABLE jogadores IS
    'Esta tabela armazena dados referentes aos jogadores convocados de uma copa.';

COMMENT ON COLUMN jogadores.jog_id IS
    'Chave primária da tabela JOGADORES.';

COMMENT ON COLUMN jogadores.jog_nome IS
    'Esta coluna armazena o nome do jogador.';

CREATE TABLE jogadores_escalacoes (
    jsc_jog_id        INTEGER NOT NULL,
    jsc_numero_camisa VARCHAR2(2),
    jsc_esc_id        INTEGER NOT NULL
);

COMMENT ON TABLE jogadores_escalacoes IS
    'Esta tabela armazena dados referentes à escalação dos jogadores.';

COMMENT ON COLUMN jogadores_escalacoes.jsc_jog_id IS
    'Esta coluna faz referência à tabela Jogadores, indicando o jogador escalado.';

COMMENT ON COLUMN jogadores_escalacoes.jsc_esc_id IS
    'Esta coluna faz referência à tabela Escalacoes, indicando a escalação da qual o jogador faz parte.';

COMMENT ON COLUMN jogadores_escalacoes.jsc_numero_camisa IS
    'Esta coluna armazena o número da camisa de jogador em uma determinada escalação.';                                                             

CREATE TABLE paises (
    pai_id   INTEGER NOT NULL,
    pai_nome VARCHAR2(100)
);

COMMENT ON TABLE paises IS
    'Esta tabela armazena dados referentes aos países em que se encontra cada país.';

COMMENT ON COLUMN paises.pai_id IS
    'Chave primária da tabela  PAISES.';

COMMENT ON COLUMN paises.pai_nome IS
    'Esta coluna armazena o nome do país.';

CREATE TABLE partidas (
    par_id                   INTEGER NOT NULL,
    par_data                 DATE,
    par_publico              INTEGER,
    par_fase                 VARCHAR2(100),
    par_condicoes_de_vitoria VARCHAR2(100),
    par_cop_id               INTEGER NOT NULL,
    par_esc_id_a             INTEGER NOT NULL,
    par_esc_id_b             INTEGER NOT NULL,
    par_est_id               INTEGER NOT NULL
);

COMMENT ON TABLE partidas IS
    'Essa tabela armazena dados referentes a uma partida disputada durante a copa.';

COMMENT ON COLUMN partidas.par_id IS
    'Chave primária da tabela PARTIDAS.';

COMMENT ON COLUMN partidas.par_data IS
    'Esta coluna armazena a data em que a partida aconteceu.';

COMMENT ON COLUMN partidas.par_publico IS
    'Esta coluna armazena a quantidade de espectadores na partida.';

COMMENT ON COLUMN partidas.par_fase IS
    'Esta coluna armazena a fase da copa em que a partida aconteceu.';

COMMENT ON COLUMN partidas.par_condicoes_de_vitoria IS
    'Esta coluna armazena as condições de vitória especiais ocorridas na partida.';

COMMENT ON COLUMN partidas.par_cop_id IS
    'Esta coluna faz referência à tabela Copas, indicando em qual edição da copa a partida aconteceu.';

COMMENT ON COLUMN partidas.par_esc_id_a IS
    'Esta coluna faz referência à tabela Escalacoes, indicando a escalação da equipe mandante para a partida.';

COMMENT ON COLUMN partidas.par_esc_id_b IS
    'Esta coluna faz referência à tabela Escalacoes, indicando a escalação da equipe visitante para a partida.';

COMMENT ON COLUMN partidas.par_est_id IS
    'Esta coluna faz referência à tabela Estadios, indicando o estádio em que a partida aconteceu.';

CREATE TABLE selecoes (
    sel_id       INTEGER NOT NULL,
    sel_nome     VARCHAR2(100),
    sel_trigrama CHAR(3)
);

COMMENT ON TABLE selecoes IS
    'Esta tabela armazena dados referentes às seleções participantes.';

COMMENT ON COLUMN selecoes.sel_id IS
    'Chave primária da tabela  SELECOES.';

COMMENT ON COLUMN selecoes.sel_nome IS
    'Esta coluna armazena o nome da seleção.';

COMMENT ON COLUMN selecoes.sel_trigrama IS
    'Esta coluna armazena o trigrama da seleção.';

CREATE TABLE treinadores (
    tre_id   INTEGER NOT NULL,
    tre_nome VARCHAR2(200)
);

COMMENT ON TABLE treinadores IS
    'Esta tabela armazena dados referentes aos Treinadores.';

COMMENT ON COLUMN treinadores.tre_id IS
    'chave primária da tabela TREINADORES.';

COMMENT ON COLUMN treinadores.tre_nome IS
    'Esta coluna armazena o nome do treinador.';

------------------------------------------PRIMARY KEYS------------------------------------------
ALTER TABLE cidades ADD CONSTRAINT pk_cid PRIMARY KEY ( cid_id );

ALTER TABLE copas ADD CONSTRAINT pk_cop PRIMARY KEY ( cop_id );

ALTER TABLE escalacoes ADD CONSTRAINT pk_esc PRIMARY KEY ( esc_id );

ALTER TABLE estadios ADD CONSTRAINT pk_est PRIMARY KEY ( est_id );

ALTER TABLE eventos ADD CONSTRAINT pk_eve PRIMARY KEY ( eve_id );

ALTER TABLE jogadores ADD CONSTRAINT pk_jog PRIMARY KEY ( jog_id );

ALTER TABLE jogadores_escalacoes ADD CONSTRAINT pk_jsc PRIMARY KEY ( jsc_jog_id, jsc_esc_id );

ALTER TABLE paises ADD CONSTRAINT pk_pai PRIMARY KEY ( pai_id );

ALTER TABLE partidas ADD CONSTRAINT pk_par PRIMARY KEY ( par_id );

ALTER TABLE selecoes ADD CONSTRAINT pk_sel PRIMARY KEY ( sel_id );

ALTER TABLE treinadores ADD CONSTRAINT pk_tre PRIMARY KEY ( tre_id );
------------------------------------------------------------------------------------------------

------------------------------------------FOREIGN KEYS------------------------------------------
ALTER TABLE cidades ADD CONSTRAINT fk_cid_pai FOREIGN KEY ( cid_pai_id ) REFERENCES paises ( pai_id );

ALTER TABLE escalacoes ADD CONSTRAINT fk_esc_cop FOREIGN KEY ( esc_cop_id ) REFERENCES copas ( cop_id );

ALTER TABLE escalacoes ADD CONSTRAINT fk_esc_sel FOREIGN KEY ( esc_sel_id ) REFERENCES selecoes ( sel_id );

ALTER TABLE escalacoes ADD CONSTRAINT fk_esc_tre FOREIGN KEY ( esc_tre_id ) REFERENCES treinadores ( tre_id );

ALTER TABLE estadios ADD CONSTRAINT fk_est_cid FOREIGN KEY ( est_cid_id ) REFERENCES cidades ( cid_id );

ALTER TABLE eventos ADD CONSTRAINT fk_eve_jog FOREIGN KEY ( eve_jog_id ) REFERENCES jogadores ( jog_id );

ALTER TABLE eventos ADD CONSTRAINT fk_eve_par FOREIGN KEY ( eve_par_id ) REFERENCES partidas ( par_id );

ALTER TABLE jogadores_escalacoes ADD CONSTRAINT fk_jsc_esc FOREIGN KEY ( jsc_esc_id ) REFERENCES escalacoes ( esc_id );

ALTER TABLE jogadores_escalacoes ADD CONSTRAINT fk_jsc_jog FOREIGN KEY ( jsc_jog_id ) REFERENCES jogadores ( jog_id );

ALTER TABLE partidas ADD CONSTRAINT fk_par_cop FOREIGN KEY ( par_cop_id ) REFERENCES copas ( cop_id );

ALTER TABLE partidas ADD CONSTRAINT fk_par_esc_a FOREIGN KEY ( par_esc_id_a ) REFERENCES escalacoes ( esc_id );

ALTER TABLE partidas ADD CONSTRAINT fk_par_esc_b FOREIGN KEY ( par_esc_id_b ) REFERENCES escalacoes ( esc_id );

ALTER TABLE partidas ADD CONSTRAINT fk_par_est FOREIGN KEY ( par_est_id ) REFERENCES estadios ( est_id );

------------------------------------------------------------------------------------------------

------------------------------------------- SEQUENCE -------------------------------------------
CREATE SEQUENCE seq_tre NOCACHE;

CREATE SEQUENCE seq_cop NOCACHE;

CREATE SEQUENCE seq_esc NOCACHE;

CREATE SEQUENCE seq_est NOCACHE;

CREATE SEQUENCE seq_eve NOCACHE;

CREATE SEQUENCE seq_jog NOCACHE;

CREATE SEQUENCE seq_pai NOCACHE;

CREATE SEQUENCE seq_par NOCACHE;

CREATE SEQUENCE seq_sel NOCACHE;

CREATE SEQUENCE seq_cid NOCACHE;
------------------------------------------------------------------------------------------------

-------------------------------------------- TRIGGER --------------------------------------------

CREATE TRIGGER tg_bi_tre 
BEFORE INSERT ON treinadores 
FOR EACH ROW 
BEGIN 
    :NEW.tre_id := seq_tre.nextval; 
end;
/

CREATE TRIGGER tg_bi_cop 
BEFORE INSERT ON copas 
FOR EACH ROW 
BEGIN 
    :NEW.cop_id := seq_cop.nextval; 
end; 
/

CREATE TRIGGER tg_bi_esc 
BEFORE INSERT ON escalacoes 
FOR EACH ROW 
BEGIN 
    :NEW.esc_id := seq_esc.nextval; 
end;
/

CREATE TRIGGER tg_bi_est 
BEFORE INSERT ON estadios 
FOR EACH ROW 
BEGIN 
    :NEW.est_id := seq_est.nextval; 
end;
/

CREATE TRIGGER tg_bi_eve 
BEFORE INSERT ON eventos 
FOR EACH ROW 
BEGIN 
    :NEW.eve_id := seq_eve.nextval; 
end;
/

CREATE TRIGGER tg_bi_cid 
BEFORE INSERT ON cidades 
FOR EACH ROW 
BEGIN 
    :NEW.cid_id := seq_cid.nextval; 
end; 
/
 
CREATE TRIGGER tg_bi_jog 
BEFORE INSERT ON jogadores 
FOR EACH ROW 
BEGIN 
    :NEW.jog_id := seq_jog.nextval; 
end;
/
 
CREATE TRIGGER tg_bi_pai 
BEFORE INSERT ON paises 
FOR EACH ROW 
BEGIN 
    :NEW.pai_id := seq_pai.nextval; 
end;
/
 
CREATE TRIGGER tg_bi_par 
BEFORE INSERT ON partidas 
FOR EACH ROW 
BEGIN 
    :NEW.par_id := seq_par.nextval; 
end;
/
 
CREATE TRIGGER tg_bi_sel 
BEFORE INSERT ON selecoes 
FOR EACH ROW 
BEGIN 
    :NEW.sel_id := seq_sel.nextval; 
end;
/

/*CREATE TRIGGER tg_bi_est2
BEFORE INSERT ON estadios
FOR EACH ROW

DECLARE

  est_cid_id integer;
BEGIN

  select distinct tab_cid_nome

into est_cid_id

from tabelao

where tab_est_nome = :NEW.est_nome;
:NEW.est_cid_id := est_cid_id;
end;
/*/
------------------------------------------------------------------------------------------------

--------------------------------------------TABELAS DE HISTORIAMENTO ---------------------------


CREATE TABLE hcidades (
    hcid_id      INTEGER NOT NULL,
    hcid_nome    VARCHAR2(100),
    hcid_date_in DATE NOT NULL
);

COMMENT ON TABLE hcidades IS
    'Esta tabela armazena dados referentes às cidades em que se encontram os Cidades.';

ALTER TABLE hcidades ADD CONSTRAINT pk_hcid PRIMARY KEY ( hcid_id, hcid_date_in );

CREATE TABLE hcopas (
    hcop_id      INTEGER NOT NULL,
    hcop_edicao  NUMBER(4),
    hcop_date_in DATE NOT NULL
);

COMMENT ON TABLE hcopas IS
    'Esta tabela armazena dados referentes às Copas.';

ALTER TABLE hcopas ADD CONSTRAINT pk_hcop PRIMARY KEY ( hcop_id, hcop_date_in );

CREATE TABLE hescalacoes (
    hesc_id      INTEGER NOT NULL,
    hesc_cop_id  INTEGER NOT NULL,
    hesc_sel_id  INTEGER NOT NULL,
    hesc_tre_id  INTEGER NOT NULL,
    hesc_date_in DATE NOT NULL
);

COMMENT ON TABLE hescalacoes IS
    'Esta tabela armazena dados referentes às escalações realizadas.';

ALTER TABLE hescalacoes ADD CONSTRAINT pk_hesc PRIMARY KEY ( hesc_id, hesc_date_in );

CREATE TABLE hestadios (
    hest_id      INTEGER NOT NULL,
    hest_cid_id  INTEGER NOT NULL,
    hest_nome    VARCHAR2(100),
    hest_date_in DATE NOT NULL
);

COMMENT ON TABLE hestadios IS
    'Esta tabela armazena dados referentes aos Estádios em que foram disponibilizadas para a realização das partidas.';

ALTER TABLE hestadios ADD CONSTRAINT pk_hest PRIMARY KEY (hest_id, hest_date_in);

CREATE TABLE heventos (
    heve_id              INTEGER NOT NULL,
    heve_tempo_decorrido NUMBER(3),
    heve_descricao       VARCHAR2(200),
    heve_jog_id          INTEGER NOT NULL,
    heve_par_id          INTEGER NOT NULL,
    heve_date_in         DATE NOT NULL
);

COMMENT ON TABLE heventos IS
    'Esta tabela armazena dados referentes aos eventos que podem acontecer durante uma partida.';

ALTER TABLE heventos ADD CONSTRAINT pk_heve PRIMARY KEY ( heve_id, heve_date_in );

CREATE TABLE hjogadores (
    hjog_id      INTEGER NOT NULL,
    hjog_nome    VARCHAR2(200),
    hjog_date_in DATE NOT NULL
);

COMMENT ON TABLE hjogadores IS
    'Esta tabela armazena dados referentes aos jogadores convocados de uma copa.';

ALTER TABLE hjogadores ADD CONSTRAINT pk_hjog PRIMARY KEY ( hjog_id, hjog_date_in );

CREATE TABLE hpaises (
    hpai_id      INTEGER NOT NULL,
    hpai_nome    VARCHAR2(100),
    hpar_date_in DATE NOT NULL
);

COMMENT ON TABLE hpaises IS
    'Esta tabela armazena dados referentes aos países em que se encontra cada país.';

ALTER TABLE hpaises ADD CONSTRAINT pk_hpai PRIMARY KEY ( hpai_id, hpar_date_in );

CREATE TABLE hpartidas (
    hpar_id                   INTEGER NOT NULL,
    hpar_data                 DATE,
    hpar_publico              INTEGER,
    hpar_fase                 VARCHAR2(100),
    hpar_condicoes_de_vitoria VARCHAR2(100),
    hpar_cop_id               INTEGER NOT NULL,
    hpar_esc_id_a             INTEGER NOT NULL,
    hpar_esc_id_b             INTEGER NOT NULL,
    hpar_est_id               INTEGER NOT NULL,
    hpar_date_in              DATE NOT NULL
);

COMMENT ON TABLE hpartidas IS
    'Essa tabela armazena dados referentes a uma partida disputada durante a copa.';

ALTER TABLE hpartidas ADD CONSTRAINT pk_hpar PRIMARY KEY ( hpar_id, hpar_date_in );

CREATE TABLE hselecoes (
    hsel_id       INTEGER NOT NULL,
    hsel_nome     VARCHAR2(100),
    hsel_trigrama CHAR(3),
    hsel_date_in  DATE NOT NULL
);

COMMENT ON TABLE hselecoes IS
    'Esta tabela armazena dados referentes às seleções participantes.';

ALTER TABLE hselecoes ADD CONSTRAINT pk_hsel PRIMARY KEY ( hsel_id, hsel_date_in );

CREATE TABLE htreinadores (
    htre_id      INTEGER NOT NULL,
    htre_nome    VARCHAR2(200),
    htre_date_in DATE NOT NULL
);

COMMENT ON TABLE htreinadores IS
    'Esta tabela armazena dados referentes aos Treinadores.';

ALTER TABLE htreinadores ADD CONSTRAINT pk_htre PRIMARY KEY ( htre_id, htre_date_in );


---------------------------------------------------------------------------------------------

-------------------------------------------- PROCEDURES -------------------------------------



CREATE PROCEDURE PR_HEVE(EVE_ID INTEGER, EVE_TEMPO_DECORRIDO NUMBER, EVE_DESCRICAO VARCHAR, EVE_JOG_ID INTEGER, EVE_PAR_ID INTEGER)
AS
BEGIN
    INSERT INTO HEVENTOS VALUES (EVE_ID, EVE_TEMPO_DECORRIDO, EVE_DESCRICAO, EVE_JOG_ID, EVE_PAR_ID, SYSDATE);
END;
/

CREATE PROCEDURE PR_HPAR(PAR_ID INTEGER, DATA DATE, PAR_PUBLICO INTEGER, PAR_FASE VARCHAR, PAR_CONDICOES_DE_VITORIA VARCHAR, PAR_COP_ID INTEGER, PAR_ESC_ID_A INTEGER, PAR_ESC_ID_B INTEGER, PAR_EST_ID INTEGER)
AS
BEGIN
    INSERT INTO HPARTIDAS VALUES (PAR_ID, DATA, PAR_PUBLICO, PAR_FASE, PAR_CONDICOES_DE_VITORIA, PAR_COP_ID, PAR_ESC_ID_A, PAR_ESC_ID_B, PAR_EST_ID, SYSDATE);
END;
/

CREATE PROCEDURE PR_HJOG(JOG_ID INTEGER, JOG_NOME VARCHAR)
AS
BEGIN
    INSERT INTO HJOGADORES VALUES (JOG_ID, JOG_NOME, SYSDATE);
END;
/

CREATE PROCEDURE PR_HESC(ESC_ID INTEGER, ESC_COP_ID INTEGER, ESC_SEL_ID INTEGER, ESC_TRE_ID INTEGER)
AS
BEGIN
    INSERT INTO HESCALACOES VALUES (ESC_ID, ESC_COP_ID, ESC_SEL_ID, ESC_TRE_ID, SYSDATE);
END;
/

CREATE PROCEDURE PR_HTRE(TRE_ID INTEGER, TRE_NOME VARCHAR)
AS
BEGIN
    INSERT INTO HTREINADORES VALUES (TRE_ID, TRE_NOME, SYSDATE);
END;
/

CREATE PROCEDURE PR_HEST(EST_ID INTEGER, EST_CID_ID INTEGER, EST_NOME VARCHAR)
AS
BEGIN
    INSERT INTO HESTADIOS VALUES (EST_ID, EST_CID_ID, EST_NOME, SYSDATE);
END;
/

CREATE PROCEDURE PR_HCOP(COP_ID INTEGER, COP_EDICAO NUMBER)
AS
BEGIN
    INSERT INTO HCOPAS VALUES (COP_ID, COP_EDICAO, SYSDATE);
END;
/

CREATE PROCEDURE PR_HSEL(SEL_ID INTEGER, SEL_NOME VARCHAR, SEL_TRIGRAMA CHAR)
AS
BEGIN
    INSERT INTO HSELECOES VALUES (SEL_ID, SEL_NOME, SEL_TRIGRAMA, SYSDATE);
END;
/

CREATE PROCEDURE PR_HCID(CID_ID INTEGER, CID_NOME VARCHAR)
AS
BEGIN
    INSERT INTO HCIDADES VALUES (CID_ID, CID_NOME, SYSDATE);
END;
/
------------------------------------------------------------------------------------------------

-------------------------------------------- TRIGGERS ------------------------------------------

CREATE TRIGGER TG_AUD_PAR
AFTER UPDATE OR DELETE ON PARTIDAS
FOR EACH ROW
BEGIN
    PR_HPAR(:OLD.PAR_ID, :OLD.PAR_DATA, :OLD.PAR_PUBLICO, :OLD.PAR_FASE, :OLD.PAR_CONDICOES_DE_VITORIA, :OLD.PAR_COP_ID, :OLD.PAR_ESC_ID_A, :OLD.PAR_ESC_ID_B, :OLD.PAR_EST_ID);
END;
/

CREATE TRIGGER TG_AUD_EVE
AFTER UPDATE OR DELETE ON EVENTOS
FOR EACH ROW
BEGIN
    PR_HEVE(:OLD.EVE_ID, :OLD.EVE_TEMPO_DECORRIDO, :OLD.EVE_DESCRICAO, :OLD.EVE_JOG_ID, :OLD.EVE_PAR_ID);
END;
/

CREATE TRIGGER TG_AUD_JOG
AFTER UPDATE OR DELETE ON JOGADORES
FOR EACH ROW
BEGIN
    PR_HJOG(:OLD.JOG_ID, :OLD.JOG_NOME);
END;
/

CREATE TRIGGER TG_AUD_ESC
AFTER UPDATE OR DELETE ON ESCALACOES
FOR EACH ROW
BEGIN
    PR_HESC(:OLD.ESC_ID, :OLD.ESC_COP_ID, :OLD.ESC_SEL_ID, :OLD.ESC_TRE_ID);
END;
/

CREATE TRIGGER TG_AUD_TRE
AFTER UPDATE OR DELETE ON TREINADORES
FOR EACH ROW
BEGIN
    PR_HTRE(:OLD.TRE_ID, :OLD.TRE_NOME);
END;
/

CREATE TRIGGER TG_AUD_EST
AFTER UPDATE OR DELETE ON ESTADIOS
FOR EACH ROW
BEGIN
    PR_HEST(:OLD.EST_ID, :OLD.EST_CID_ID, :OLD.EST_NOME);
END;
/

CREATE TRIGGER TG_AUD_COP
AFTER UPDATE OR DELETE ON COPAS
FOR EACH ROW
BEGIN
    PR_HCOP(:OLD.COP_ID, :OLD.COP_EDICAO);
END;
/

CREATE TRIGGER TG_AUD_SEL
AFTER UPDATE OR DELETE ON SELECOES
FOR EACH ROW
BEGIN
    PR_HSEL(:OLD.SEL_ID, :OLD.SEL_NOME, :OLD.SEL_TRIGRAMA);
END;
/

CREATE TRIGGER TG_AUD_CID
AFTER UPDATE OR DELETE ON CIDADES
FOR EACH ROW
BEGIN
    PR_HCID(:OLD.CID_ID, :OLD.CID_NOME);
END;
/

---------------------------------------------------------------------------------------------

