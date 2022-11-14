DROP DATABASE IF EXISTS manutencao;
CREATE DATABASE manutencao;

\c manutencao;


CREATE TABLE laboratorio(
    id serial PRIMARY KEY,
    nome text,
    pavilhao integer
);

CREATE TABLE tipo(
    id serial PRIMARY KEY,
    descricao text
);

CREATE TABLE tecnico(
    id serial PRIMARY KEY,
    nome text,
    cpf character(11)
);

CREATE TABLE status(
    id serial PRIMARY KEY,
    descricao text
);

CREATE TABLE equipamento(
    id serial PRIMARY KEY,
    descricao text,
    tipo_id integer REFERENCES tipo(id),
    laboratorio_id integer REFERENCES laboratorio(id)
);

CREATE TABLE servico_manutencao(
    id serial PRIMARY KEY,
    descricao text,
    data_hora_criacao timestamp,
    data_hora_solucao timestamp,
    solucao text,
    equipamento_id integer REFERENCES equipamento (id),
    tecnico_id integer REFERENCES tecnico(id),
    status_id integer REFERENCES status (id)
);

/*INSERT INTO laboratorio(nome,pavilhao) VALUES ('software',1);
INSERT INTO laboratorio(nome,pavilhao) VALUES ('hardware',2);

INSERT INTO tipo(descricao) VALUES ('Tudo relacionado ao software da máquina, formatação e intalação de programas.');
INSERT INTO tipo(descricao) VALUES ('Troca/manutenção de periférico');

INSERT INTO tecnico(nome,cpf) VALUES ('julio cesar','12345678911');
INSERT INTO tecnico(nome,cpf) VALUES ('marcia dutra','32145698733');

INSERT INTO status(descricao) VALUES ();
INSERT INTO status(descricao) VALUES ();

INSERT INTO equipamento(descricao, tipo_id,laboratorio_id) VALUES ();
INSERT INTO equipamento(descricao, tipo_id,laboratorio_id) VALUES ();

INSERT INTO servico_manutencao(descricao,data_hora_criacao, data_hora_solucao,solucao,equipamento_id,tecnico_id,status_id) VALUES ();
INSERT INTO servico_manutencao(descricao,data_hora_criacao, data_hora_solucao,solucao,equipamento_id,tecnico_id,status_id) VALUES ();
*/