CREATE TABLE stage_eventos as (
--INSERT INTO stage_eventos (
SELECT 
    0 as stg_id,
    eventos.eve_id as stg_id_eve,
    eventos.eve_descricao as stg_eve_descricao,
    jogadores.jog_nome as stg_nome_jogador,
    jogadores.jog_data_nascimento as stg_data_nascimento, -- RETIRAR?
    partidas.par_data as stg_data_partida, -- RETIRAR?
    trunc(months_between(partidas.par_data, jogadores.jog_data_nascimento)/12) as stg_idade_jogador, -- TRANSFORMACAO
    (
        SELECT COUNT (*) 
        FROM EVENTOS eventos2
        WHERE eve_descricao = 'Gol' AND 
        eventos2.eve_jog_id = eventos.eve_jog_id 
    ) as stg_gols_jogador_total,
    (
        SELECT COUNT (*) 
        FROM EVENTOS eventos3
        WHERE eve_descricao = 'Gol' AND 
        eventos3.eve_jog_id = eventos.eve_jog_id AND
        eventos3.eve_par_id = partidas.par_id
    ) as stg_gols_jogador_partida,
    (
        SELECT COUNT (*) 
        FROM EVENTOS eventos
        WHERE (eve_descricao = 'Cartão Vermelho (Direto)' OR 
        eve_descricao = 'Cartão Amarelo') AND
        eventos.eve_par_id = partidas.par_id
    ) as stg_cartoes_partida
    
FROM 
    EVENTOS eventos join
    JOGADORES jogadores on eventos.eve_jog_id = jogadores.jog_id join
    PARTIDAS partidas on eventos.eve_par_id = partidas.par_id
ORDER BY
    stg_cartoes_partida DESC
);

SELECT DISTINCT eve_descricao from eventos;

--Feito antes do insert
CREATE SEQUENCE seq_stage nocache;

CREATE TRIGGER tg_bi_stg
BEFORE INSERT ON stage_eventos
FOR EACH ROW
BEGIN
    :new.stg_id := seq_stage.nextval;
END;
/