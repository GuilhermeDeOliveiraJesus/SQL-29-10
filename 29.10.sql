drop database if exists escola_anhanguera;
create database escola_anhanguera;
use escola_anhanguera;

CREATE TABLE tbstatus (
    codStatus INT PRIMARY KEY,
    statusProfessor VARCHAR(10)
);

INSERT INTO tbstatus (codStatus, statusProfessor) VALUES
(1, 'Ativo'),
(2, 'Inativo'),
(3, 'Afastado'),
(4, 'Licença');

INSERT INTO tbstatus (codStatus, statusProfessor) VALUES (5, 'Aposentado');

SELECT * FROM tbstatus;

UPDATE tbstatus SET statusProfessor = 'Ativo' WHERE codStatus = 1;
UPDATE tbstatus SET statusProfessor = 'Inativo' WHERE codStatus = 2;

DELETE FROM tbstatus WHERE codStatus = 5;

CREATE TABLE tblogin (
    codLogin INT PRIMARY KEY,
    usuarioLogin VARCHAR(50),
    senhaLogin VARCHAR(10),
    Tipo INT
);

INSERT INTO tblogin (codLogin, usuarioLogin, senhaLogin, Tipo) VALUES
(1, 'admin', 'admin123', 1),
(2, 'coordenador1', 'coord123', 2),
(3, 'coordenador2', 'coord456', 2),
(4, 'professor1', 'prof123', 3),
(5, 'professor2', 'prof456', 3);

INSERT INTO tblogin (codLogin, usuarioLogin, senhaLogin, Tipo) VALUES (6, 'coordenador3', 'coord789', 2);

SELECT * FROM tblogin;

UPDATE tblogin SET senhaLogin = 'admin456' WHERE codLogin = 1;
UPDATE tblogin SET Tipo = 2 WHERE codLogin = 4;

DELETE FROM tblogin WHERE codLogin = 6;

CREATE TABLE tbformacao (
    codFormacao INT PRIMARY KEY,
    nomeFormacao VARCHAR(100),
    tipoFormacao VARCHAR(30)
);

INSERT INTO tbformacao (codFormacao, nomeFormacao, tipoFormacao) VALUES
(1, 'Bacharelado em Ciência da Computação', 'Graduação'),
(2, 'Mestrado em Engenharia de Software', 'Pós-Graduação'),
(3, 'Doutorado em Inteligência Artificial', 'Pós-Graduação'),
(4, 'Especialização em Banco de Dados', 'Pós-Graduação'),
(5, 'Licenciatura em Matemática', 'Graduação');

INSERT INTO tbformacao (codFormacao, nomeFormacao, tipoFormacao) VALUES (6, 'MBA em Gestão de TI', 'Pós-Graduação');

SELECT * FROM tbformacao;

UPDATE tbformacao SET nomeFormacao = 'Bacharelado em Ciência da Computação e Tecnologia' WHERE codFormacao = 1;
UPDATE tbformacao SET tipoFormacao = 'Especialização' WHERE codFormacao = 4;

DELETE FROM tbformacao WHERE codFormacao = 6;

CREATE TABLE tbcursos (
    codCurso INT PRIMARY KEY,
    nomeCurso VARCHAR(50),
    periodoCurso VARCHAR(20)
);

INSERT INTO tbcursos (codCurso, nomeCurso, periodoCurso) VALUES
(1, 'Ciência da Computação', 'Noturno'),
(2, 'Engenharia de Software', 'Matutino'),
(3, 'Sistemas de Informação', 'Vespertino'),
(4, 'Análise e Desenvolvimento de Sistemas', 'EAD'),
(5, 'Matemática', 'Noturno');

INSERT INTO tbcursos (codCurso, nomeCurso, periodoCurso) VALUES (6, 'Engenharia de Dados', 'Noturno');

SELECT * FROM tbcursos;

UPDATE tbcursos SET periodoCurso = 'Integral' WHERE codCurso = 2;
UPDATE tbcursos SET nomeCurso = 'Ciência de Dados' WHERE codCurso = 1;

DELETE FROM tbcursos WHERE codCurso = 6;

CREATE TABLE tbprofessor (
    codProfessor INT PRIMARY KEY,
    nomeProfessor VARCHAR(50),
    emailProfessor VARCHAR(50),
    fotoProfessor VARCHAR(255),
    codStatus INT,
    FOREIGN KEY (codStatus) REFERENCES tbstatus(codStatus)
);

INSERT INTO tbprofessor (codProfessor, nomeProfessor, emailProfessor, fotoProfessor, codStatus) VALUES
(1, 'Lucas Moreira', 'lucas.moreira@escola.edu.br', 'lucas_moreira.jpg', 1),
(2, 'Marina Ribeiro', 'marina.ribeiro@escola.edu.br', 'marina_ribeiro.jpg', 1),
(3, 'Tiago Mendes', 'tiago.mendes@escola.edu.br', 'tiago_mendes.jpg', 1),
(4, 'Patrícia Nunes', 'patricia.nunes@escola.edu.br', 'patricia_nunes.jpg', 2),
(5, 'Felipe Costa', 'felipe.costa@escola.edu.br', 'felipe_costa.jpg', 1);

INSERT INTO tbprofessor (codProfessor, nomeProfessor, emailProfessor, fotoProfessor, codStatus) VALUES 
(6, 'Beatriz Almeida', 'beatriz.almeida@escola.edu.br', 'beatriz_almeida.jpg', 1);

SELECT * FROM tbprofessor;

UPDATE tbprofessor SET emailProfessor = 'lucas.moreira.novo@escola.edu.br' WHERE codProfessor = 1;
UPDATE tbprofessor SET codStatus = 1 WHERE codProfessor = 4;

DELETE FROM tbprofessor WHERE codProfessor = 6;

CREATE TABLE tbcoordenador (
    codCoordenador INT PRIMARY KEY,
    nomeCoordenador VARCHAR(50),
    codLogin INT,
    FOREIGN KEY (codLogin) REFERENCES tblogin(codLogin)
);

INSERT INTO tbcoordenador (codCoordenador, nomeCoordenador, codLogin) VALUES
(1, 'Roberto Lima', 2),
(2, 'Fernanda Alves', 3),
(3, 'Marcos Pereira', 2);

INSERT INTO tbcoordenador (codCoordenador, nomeCoordenador, codLogin) VALUES (4, 'Carla Mendes', 2);

SELECT * FROM tbcoordenador;

UPDATE tbcoordenador SET nomeCoordenador = 'Roberto Lima Santos' WHERE codCoordenador = 1;
UPDATE tbcoordenador SET codLogin = 3 WHERE codCoordenador = 2;

DELETE FROM tbcoordenador WHERE codCoordenador = 4;

CREATE TABLE tbcursoprofessor (
    codCursoProfessor INT PRIMARY KEY,
    codCurso INT,
    codProfessor INT,
    FOREIGN KEY (codCurso) REFERENCES tbcursos(codCurso),
    FOREIGN KEY (codProfessor) REFERENCES tbprofessor(codProfessor)
);

INSERT INTO tbcursoprofessor (codCursoProfessor, codCurso, codProfessor) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 3),
(5, 3, 2),
(6, 3, 4),
(7, 4, 3),
(8, 4, 5),
(9, 5, 2),
(10, 5, 4);

INSERT INTO tbcursoprofessor (codCursoProfessor, codCurso, codProfessor) VALUES (11, 1, 3);

SELECT * FROM tbcursoprofessor;

UPDATE tbcursoprofessor SET codProfessor = 5 WHERE codCursoProfessor = 1;
UPDATE tbcursoprofessor SET codCurso = 2 WHERE codCursoProfessor = 10;

DELETE FROM tbcursoprofessor WHERE codCursoProfessor = 11;

CREATE TABLE tbformacaoprofessor (
    codFormacaoProfessor INT PRIMARY KEY,
    codFormacao INT,
    codProfessor INT,
    instituicao VARCHAR(255),
    FOREIGN KEY (codFormacao) REFERENCES tbformacao(codFormacao),
    FOREIGN KEY (codProfessor) REFERENCES tbprofessor(codProfessor)
);

INSERT INTO tbformacaoprofessor (codFormacaoProfessor, codFormacao, codProfessor, instituicao) VALUES
(1, 1, 1, 'Universidade de São Paulo'),
(2, 2, 1, 'Universidade Estadual de Campinas'),
(3, 3, 1, 'Massachusetts Institute of Technology'),
(4, 1, 2, 'Universidade Federal do Rio de Janeiro'),
(5, 2, 2, 'Universidade de São Paulo'),
(6, 4, 2, 'Pontifícia Universidade Católica'),
(7, 1, 3, 'Universidade Federal de Minas Gerais'),
(8, 2, 3, 'Universidade de São Paulo'),
(9, 1, 4, 'Universidade Estadual Paulista'),
(10, 4, 4, 'Universidade de São Paulo'),
(11, 1, 5, 'Universidade Federal do Paraná'),
(12, 2, 5, 'Universidade de São Paulo');

INSERT INTO tbformacaoprofessor (codFormacaoProfessor, codFormacao, codProfessor, instituicao) VALUES 
(13, 3, 2, 'Stanford University');

SELECT * FROM tbformacaoprofessor;

UPDATE tbformacaoprofessor SET instituicao = 'Universidade de São Paulo - Campus São Carlos' WHERE codFormacaoProfessor = 1;
UPDATE tbformacaoprofessor SET codFormacao = 2 WHERE codFormacaoProfessor = 3;

DELETE FROM tbformacaoprofessor WHERE codFormacaoProfessor = 13;

CREATE TABLE tbcursocoordenador (
    codCursoCoordenador INT PRIMARY KEY,
    codCurso INT,
    codCoordenador INT,
    FOREIGN KEY (codCurso) REFERENCES tbcursos(codCurso),
    FOREIGN KEY (codCoordenador) REFERENCES tbcoordenador(codCoordenador)
);

INSERT INTO tbcursocoordenador (codCursoCoordenador, codCurso, codCoordenador) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3);

INSERT INTO tbcursocoordenador (codCursoCoordenador, codCurso, codCoordenador) VALUES (6, 1, 3);

SELECT * FROM tbcursocoordenador;

UPDATE tbcursocoordenador SET codCoordenador = 2 WHERE codCursoCoordenador = 1;
UPDATE tbcursocoordenador SET codCurso = 3 WHERE codCursoCoordenador = 2;

DELETE FROM tbcursocoordenador WHERE codCursoCoordenador = 6;

SELECT p.codProfessor, p.nomeProfessor, p.emailProfessor, s.statusProfessor 
FROM tbprofessor p 
INNER JOIN tbstatus s ON p.codStatus = s.codStatus;