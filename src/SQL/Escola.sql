--Apagar Tabela
USE master 
GO
DROP DATABASE Escola

-- Criar Table
CREATE DATABASE Escola
GO
USE Escola

-- Criando Tabela Alunos

CREATE TABLE Aluno(
RA				INT				NOT NULL,
Nome			VARCHAR(100)	NOT NULL,
Idade			INT				NOT NULL
PRIMARY KEY (RA)
)
GO

CREATE TABLE Disciplina(
Codigo					INT				NOT NULL,
Nome					VARCHAR(100)	NOT NULL,	
Carga_Horaria			INT 
PRIMARY KEY (Codigo)
)
GO

CREATE TABLE Titulacao(
Codigo			INT				NOT NULL,
Titulo			VARCHAR(40)		NOT NULL
PRIMARY KEY (Codigo)
)
GO

CREATE TABLE Professor(
Registro			INT					NOT NULL,
Nome				VARCHAR(100)		NOT NULL,
Titulacao			INT					NOT NULL
PRIMARY KEY (Registro)
FOREIGN KEY (Titulacao) REFERENCES Titulacao(Codigo)
)
GO

CREATE TABLE Curso(
Codigo				INT					NOT NULL,
Nome				VARCHAR(50)			NOT NULL,
Area				VARCHAR(30)			NOT NULL
PRIMARY KEY (Codigo)
)
GO

CREATE TABLE Aluno_Disciplina(
Codigo_Disciplina       INT				NOT NULL,
RA_Aluno				INT				NOT NULL
PRIMARY KEY (Codigo_Disciplina,RA_Aluno)
FOREIGN KEY (Codigo_Disciplina) REFERENCES Disciplina (Codigo),
FOREIGN KEY (RA_Aluno) REFERENCES Aluno (RA)
)
GO

CREATE TABLE Disciplina_Curso(
Codigo_Disciplina		INT				NOT NULL,
Codigo_Curso			INT				NOT NULL
PRIMARY KEY (Codigo_Disciplina,Codigo_Curso)
FOREIGN KEY (Codigo_Disciplina) REFERENCES Disciplina (Codigo),
FOREIGN KEY (Codigo_Curso) REFERENCES Curso (Codigo)
)
GO

CREATE TABLE Professor_Disciplina(
Codigo_Disciplina				INT			NOT NULL,
Codigo_Professor				INT			NOT NULL
PRIMARY KEY (Codigo_Disciplina,Codigo_Professor)
FOREIGN KEY (Codigo_Disciplina) REFERENCES Disciplina (Codigo), 
FOREIGN KEY (Codigo_Professor) REFERENCES Professor (Registro)
)
GO

INSERT INTO Aluno VALUES
(3416,	'DIEGO PIOVESAN DE RAMOS',	18),
(3423,	'LEONARDO MAGALHÃES DA ROSA',	17),
(3434,	'LUIZA CRISTINA DE LIMA MARTINELI',	20),
(3440,	'IVO ANDRÉ FIGUEIRA DA SILVA',	25),
(3443,	'BRUNA LUISA SIMIONI',	37),
(3448,	'THAÍS NICOLINI DE MELLO',	17),
(3457,	'LÚCIO DANIEL TÂMARA ALVES',	29),
(3459,	'LEONARDO RODRIGUES',	25),
(3465,	'ÉDERSON RAFAEL VIEIRA',	19),
(3466,	'DAIANA ZANROSSO DE OLIVEIRA',	21),
(3467,	'DANIELA MAURER',	23),
(3470,	'ALEX SALVADORI PALUDO',	42),
(3471,	'VINÍCIUS SCHVARTZ',	19),
(3472,	'MARIANA CHIES ZAMPIERI',	18),
(3482,	'EDUARDO CAINAN GAVSKI',	19),
(3483,	'REDNALDO ORTIZ DONEDA',	20),
(3499,	'MAYELEN ZAMPIERON',	22)

INSERT INTO Disciplina VALUES
(1,	'Laboratório de Banco de Dados',	80),
(2,	'Laboratório de Engenharia de Software',	80),
(3,	'Programação Linear e Aplicações',	80),
(4,	'Redes de Computadores',	80),
(5,	'Segurança da informação',	40),
(6,	'Teste de Software',	80),
(7,	'Custos e Tarifas Logísticas',	80),
(8,	'Gestão de Estoques',	40),
(9,	'Fundamentos de Marketing',	40),
(10,	'Métodos Quantitativos de Gestão',	80),
(11,	'Gestão do Tráfego Urbano',	80),
(12,	'Sistemas de Movimentação e Transporte',	40)

INSERT INTO Titulacao VALUES
(1,	'Especialista'),
(2,	'Mestre'),
(3,'Doutor')

INSERT INTO Professor VALUES
(1111,	'Leandro',	2),
(1112,	'Antonio',	2),
(1113,	'Alexandre',	3),
(1114,	'Wellington',	2),
(1115,	'Luciano',	1),
(1116,	'Edson',	2),
(1117,	'Ana',	2),
(1118,	'Alfredo',	1),
(1119,	'Celio',	2),
(1120,	'Dewar',	3),
(1121,	'Julio',	1)

INSERT INTO Curso VALUES
(1,	'ADS',	'Ciências da Computação'),
(2,	'Logística',	'Engenharia Civil')

INSERT INTO Aluno_Disciplina VALUES
(1,	3416),
(4,	3416),
(1,	3423),
(2,	3423),
(5,	3423),
(6,	3423),
(2,	3434),
(5,	3434),
(6,	3434),
(1,	3440),
(5,	3443),
(6,	3443),
(4,	3448),
(5,	3448),
(6,	3448),
(2,	3457),
(4,	3457),
(5,	3457),
(6,	3457),
(1,	3459),
(6,	3459),
(7,	3465),
(11,	3465),
(8,	3466),
(11,	3466),
(8,	3467),
(12,	3467),
(8,	3470),
(9,	3470),
(11,	3470),
(12,	3470),
(7,	3471),
(7,	3472),
(12,	3472),
(9,	3482),
(11,	3482),
(8,	3483),
(11,	3483),
(12,	3483),
(8,	3499)

INSERT INTO Professor_Disciplina VALUES	
(1,	1111),
(2,	1112),
(3,	1113),
(4,	1114),
(5,	1115),
(6,	1116),
(7,	1117),
(8,	1118),
(9,	1117),
(10,	1119),
(11,	1120),
(12,	1121)

INSERT INTO Disciplina_Curso VALUES	
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	2),
(8,	2),
(9,	2),
(10,	2),
(11,	2),
(12,	2)

-- Como fazer as listas de chamadas, com RA e nome por disciplina ?		

--Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores que as ministram	
SELECT
 d.Nome,
 p.Nome

FROM Disciplina d INNER JOIN Professor p
 ON d.Codigo = p.Titulacao

 SELECT 
 d.Nome AS Nome_Disciplina, 
 p.Nome AS Nome_Professor
FROM Disciplina d
INNER JOIN Professor_Disciplina pd ON d.Codigo = pd.Codigo_Disciplina
INNER JOIN Professor p ON pd.Codigo_Professor = p.Registro;


--Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o nome do curso	
SELECT 
c.Nome AS "Nome Curso"
FROM Disciplina d
INNER JOIN Disciplina_Curso dc 
ON d.Codigo = dc.Codigo_Disciplina
INNER JOIN Curso c 
ON dc.Codigo_Curso = c.Codigo
WHERE d.Nome = 'Gestão de Estoques';
   

--Fazer uma pesquisa que , dado o nome de uma disciplina, retorne sua área		
SELECT 
c.Area AS "Área"
FROM Disciplina d
INNER JOIN Disciplina_Curso dc 
ON d.Codigo = dc.Codigo_Disciplina
INNER JOIN Curso c 
ON dc.Codigo_Curso = c.Codigo
WHERE d.Nome = 'Gestão de Estoques';

--Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor que a ministra	
SELECT 
p.Nome AS "Nome Professor"
FROM Disciplina d
INNER JOIN Professor_Disciplina pd 
ON d.Codigo = pd.Codigo_Disciplina
INNER JOIN Professor p 
ON pd.Codigo_Professor = p.Registro
WHERE d.Nome = 'Gestão de Estoques';

--Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados em cada uma delas	
SELECT d.Nome AS Nome_Disciplina, 
COUNT(ad.RA_Aluno) AS Quantidade_Alunos
FROM 
Aluno_Disciplina ad RIGHT JOIN Disciplina d 
ON ad.Codigo_Disciplina = d.Codigo
GROUP BY d.Nome;

--Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor.  Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados	

SELECT 
p.Nome AS Nome_Professor
FROM 
Professor p INNER JOIN Professor_Disciplina pd 
ON p.Registro = pd.Codigo_Professor
INNER JOIN Disciplina d 
ON pd.Codigo_Disciplina = d.Codigo
JOIN (
    SELECT Codigo_Disciplina
    FROM Aluno_Disciplina
    GROUP BY Codigo_Disciplina
    HAVING COUNT(RA_Aluno) >= 5
) AS Disciplinas_Cinco_Alunos ON d.Codigo = Disciplinas_Cinco_Alunos.Codigo_Disciplina
WHERE d.Nome = 'Teste de Software';

-- Quantidade de Alunos Matriculados por disciplinas
SELECT d.Nome AS Nome_Disciplina, COUNT(ad.RA_Aluno) AS Quantidade_Alunos
FROM Disciplina d
LEFT JOIN Aluno_Disciplina ad ON d.Codigo = ad.Codigo_Disciplina
GROUP BY d.Codigo, d.Nome;

--Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que ministram aula nele. A coluna de ve se chamar quantidade													

SELECT c.Nome AS Nome_Curso, 
COUNT(pd.Codigo_Professor) AS Quantidade
FROM 
Curso c RIGHT JOIN Disciplina_Curso dc 
ON c.Codigo = dc.Codigo_Curso
RIGHT JOIN Professor_Disciplina pd 
ON dc.Codigo_Disciplina = pd.Codigo_Disciplina
GROUP BY c.Codigo, c.Nome;





