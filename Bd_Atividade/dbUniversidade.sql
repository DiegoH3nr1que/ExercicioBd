--CRIAÇÃO TABELA DEPARTAMENTOS--
CREATE TABLE departamentos (
	idDep int Primary Key,
	nomeDept varchar(50) NOT NULL UNIQUE
);

--CRIAÇÃO TABELA ORIENTADOR--
CREATE TABLE orientadores (
	idOrient int Primary Key,
	nomeOrient varchar(50) NOT NULL UNIQUE,
	idDep INT,
	CONSTRAINT fk_idDep
	FOREIGN KEY (idDep) REFERENCES departamentos
);


--CRIAÇÃO TABELA DISCIPLINAS--
CREATE TABLE disciplinas (
	idDisc int Primary Key,
	nomeDisc varchar(50) NOT NULL UNIQUE,
	creditos int NOT NULL DEFAULT 0, 
	ementa_disc VARCHAR(200),
	idDep INT,
	CONSTRAINT fk_idDep
	FOREIGN KEY (idDep) REFERENCES departamentos
);

--CRIAÇÃO TABELA ALUNOS--
CREATE TABLE alunos (
	idAluno int Primary Key,
	nomeAluno varchar(50) NOT NULL UNIQUE,
	rua varchar(150) NOT NULL,
	logradouro varchar(150) NOT NULL,
	bairro varchar(150) NOT NULL,
	numeroRes int NOT NULL,
	complemento VARCHAR (50),
	ddd_tel smallint NOT NULL,
	tel int NOT NULL,
	idDisc INT,
	CONSTRAINT fk_idDisc
	FOREIGN KEY (idDisc) REFERENCES disciplinas
);

--CRIAÇÃO TABELA ALUNO PÓS GRAD--
CREATE TABLE Pos_graduando (
	formacao_escolar varchar(100) NOT NULL,
	idAluno int,
	CONSTRAINT fk_idAluno
	FOREIGN KEY (idAluno) REFERENCES alunos,
	idOrient int,
	CONSTRAINT fk_idOrient
	FOREIGN KEY (idOrient) REFERENCES orientadores
);

--CRIAÇÃO TABELA ALUNO GRAD--
CREATE TABLE graduando (
	ano_ingresso varchar(100) NOT NULL,
	idAluno int,
	CONSTRAINT fk_idAluno
	FOREIGN KEY (idAluno) REFERENCES alunos
);

--CRIAÇÃO TABELA PRE REQUISITOS--

CREATE TABLE pre_requisitos (
	idDisc int PRIMARY KEY,
	FOREIGN KEY (idDisc) REFERENCES disciplinas,
	idDisc_pre int,
	FOREIGN KEY (idDisc_pre) REFERENCES disciplinas
);

ALTER TABLE pre_requisitos ADD nome_pre VARCHAR(150);

--CRIAÇÃO TABELA ENTIDADE ASSOCIATIVA--
CREATE TABLE aluno_disciplina (
	idDisc int,
	FOREIGN KEY (idDisc) REFERENCES disciplinas,
	idAluno int,
	FOREIGN KEY (IdAluno) REFERENCES alunos,
	media_final smallint,
	frequencia smallint,
	CHECK (0<=frequencia),
	CHECK (frequencia<=100) 
);

--INSERINDO VALORES --
INSERT INTO departamentos VALUES(0,'Tecnologia');
INSERT INTO departamentos VALUES(1,'Exatas');
INSERT INTO departamentos VALUES(2,'Filosofia');

INSERT INTO disciplinas VALUES(0,'Engenharia de Software', 10,  
'Aprenda sobre desenvolvimento de aplicações',   0, 0);
INSERT INTO disciplinas VALUES(1,'Cálculo 1', 5,  'Aprenda cálculos matemáticos',  
1, 1);
INSERT INTO disciplinas VALUES(2,'Ervas medicinais', 5,  'Conheça sobre ervas relaxantes',
2, 2);

INSERT INTO pre_requisitos VALUES(0,0,'Lógica de Programação');
INSERT INTO pre_requisitos VALUES(1,1,'Matemática Básica');
INSERT INTO pre_requisitos VALUES(2,2,'THC e CBD');

INSERT INTO pre_requisitos VALUES(0,0,'Lógica de Programação');
INSERT INTO pre_requisitos VALUES(1,1,'Matemática Básica');
INSERT INTO pre_requisitos VALUES(2,2,'THC e CBD');
							  

INSERT INTO orientadores VALUES(0,'André Cassulinha',1);
INSERT INTO orientadores VALUES(1,'Gabriel Unimed',2);
INSERT INTO orientadores VALUES(2,'Cainã Elevador',0);

INSERT INTO alunos VALUES(0,'Rafão da Pizza', 'Rua A', 'Log D', 'Bairro A', 10, NULL, 015, 999999990,0);
INSERT INTO alunos VALUES(1,'Vítor Mala', 'Rua B', 'Log C', 'Bairro B', 20, 'Casa', 014,40028922,2);
INSERT INTO alunos VALUES(2,'Giovanni Marmita', 'Rua C', 'Log B', 'Bairro C',30, 'Apto Bloco 1', 013,88888888,2);
INSERT INTO alunos VALUES(4,'Diego Granada', 'Rua D', 'Log A', 'Bairro D',40, 'Cond. Vila Real', 011,33333333,1);

INSERT INTO aluno_disciplina VALUES(0,0,78,80);
INSERT INTO aluno_disciplina VALUES(1,1,57,62);
INSERT INTO aluno_disciplina VALUES(2,2,99,70);
INSERT INTO aluno_disciplina VALUES(2,4,87,100);

INSERT INTO graduando VALUES('01/03/2020',0);
INSERT INTO graduando VALUES('01/06/2019',1);
INSERT INTO graduando VALUES('02/02/2020',2);

INSERT INTO pos_graduando VALUES ('Matemática Básica', 4,1)

SELECT * FROM pos_graduando NATURAL INNER JOIN alunos;
