CREATE TABLE "HR"."STAGE_EMPREGADOS" (
  "STG_ID" NUMBER,
  "STG_ID_EMP" NUMBER(6, 0),
  "STG_NOME_EMP" VARCHAR2(46 BYTE),
  "STG_MAIL_EMP" VARCHAR2(25 BYTE) NOT NULL ENABLE,
  "STG_FONE_EMP" VARCHAR2(20 BYTE),
  "STG_DT_CONTRATO" DATE NOT NULL ENABLE,
  "STG_TEMPO_CONTRATO" NUMBER,
  "STG_CARGO" VARCHAR2(35 BYTE) NOT NULL ENABLE,
  "STG_QTDE_CARGO" NUMBER,
  "STG_SALARIO" NUMBER(8, 2),
  "STG_COMISSAO" NUMBER,
  "STG_NOME_GERENTE" VARCHAR2(46 BYTE),
  "STG_ID_GERENTE" NUMBER(6, 0),
  "STG_DEPARTAMENTO" VARCHAR2(30 BYTE),
  "STG_ORCAMENTO_DEPARTAMENTO" NUMBER,
  "STG_PCT_SALARIO" VARCHAR2(41 BYTE)
) -- gerado a partir do create table as SELECT...
--CREATE TABLE stage_empregados as (
INSERT INTO stage_empregados (
    SELECT 0 as stg_id,
      e1.employee_id as stg_id_emp,
      e1.first_name || ' ' || e1.last_name as stg_nome_emp,
      e1.email as stg_mail_emp,
      e1.phone_number as stg_fone_emp,
      e1.hire_date as stg_dt_contrato,
      trunc(months_between(sysdate, e1.hire_date) / 12) as stg_tempo_contrato,
      j1.job_title as stg_cargo,
      (
        SELECT count(*)
        FROM employees e2
        WHERE e2.job_id = e1.job_id --subquery correlata
      ) as stg_qtde_cargo,
      e1.salary as stg_salario,
      NVL(e1.commission_pct, 0) as stg_comissao,
      -- se a comissao é nula ele retorna 0, se nao ele retorna a propria comissao 
      e3.first_name || ' ' || e3.last_name as stg_nome_gerente,
      e1.manager_id as stg_id_gerente,
      d1.department_name as stg_departamento,
      (
        SELECT SUM (salary)
        FROM employees e4
        WHERE e4.department_id = e1.department_id
      ) as stg_orcamento_departamento,
      round(
        e1.salary / (
          SELECT SUM(salary)
          FROM employees e4
          WHERE e4.department_id = e1.department_id
        ),
        2
      ) * 100 || '%' as stg_pct_salario
    FROM employees e1
      join jobs j1 on e1.job_id = j1.job_id
      left join employees e3 on e3.employee_id = e1.manager_id
      left join departments d1 on d1.department_id = e1.department_id
  );
--Feito antes do insert
CREATE SEQUENCE seq_stage nocache;
CREATE TRIGGER tg_bi_stg BEFORE
INSERT ON stage_empregados FOR EACH ROW BEGIN :new.stg_id := seq_stage.nextval;
END;
/