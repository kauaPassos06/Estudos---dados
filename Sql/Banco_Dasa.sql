-- =====================================================
-- BANCO DE DADOS — DASA (ESTUDO)
-- =====================================================

-- -------------------------------------------------------
-- DEPARTAMENTOS
-- -------------------------------------------------------
CREATE TABLE Departamentos (
    DepID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Andar INT NOT NULL
);

INSERT INTO Departamentos (Nome, Andar) VALUES
('NAC', 1), ('Qualidade', 2), ('TI', 3),
('Financeiro', 4), ('RH', 2), ('Insights', 3);

-- -------------------------------------------------------
-- FUNCIONARIOS
-- -------------------------------------------------------
CREATE TABLE Funcionarios (
    FuncID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    DepID INT FOREIGN KEY REFERENCES Departamentos(DepID),
    Salario DECIMAL(10,2) NOT NULL,
    DataAdmissao DATE NOT NULL,
    Estado CHAR(2) NOT NULL
);

INSERT INTO Funcionarios (Nome, Cargo, DepID, Salario, DataAdmissao, Estado) VALUES
('Ana Silva', 'Analista', 1, 4500.00, '2021-03-15', 'SP'),
('Bruno Souza', 'Consultor', 1, 3800.00, '2020-07-01', 'RJ'),
('Carlos Lima', 'Assistente', 5, 2800.00, '2022-01-10', 'MG'),
('Daniela Costa', 'Gerente', 1, 9200.00, '2019-05-20', 'SP'),
('Eduardo Alves', 'Analista', 2, 5400.00, '2021-11-03', 'PR'),
('Fernanda Dias', 'Analista', 6, 5100.00, '2020-09-14', 'SP'),
('Gabriel Martins', 'Gerente', 3, 11000.00, '2018-02-28', 'SC'),
('Helena Rocha', 'Gerente', 5, 8500.00, '2019-08-17', 'RJ'),
('Igor Penna', 'Assistente', 4, 3100.00, '2023-03-05', 'SP'),
('Julia Neves', 'Consultora', 1, 3200.00, '2023-06-20', 'MG'),
('Kaua Passos', 'Analista', 6, 5800.00, '2022-08-01', 'SP'),
('Larissa Melo', 'Gerente', 6, 12000.00, '2017-04-11', 'SP'),
('Marcos Vitor', 'Gerente', 4, 9800.00, '2018-11-30', 'RJ'),
('Natalia Cruz', 'Analista', 2, 4200.00, '2021-07-22', 'PR'),
('Otto Rangel', 'Assistente', 3, 3300.00, '2022-12-01', 'SC'),
('Paula Faria', 'Consultora', 1, 3600.00, '2020-04-08', 'SP'),
('Rafael Mota', 'Analista', 6, 6200.00, '2021-09-15', 'RJ'),
('Sabrina Lima', 'Analista', 2, 4900.00, '2022-02-17', 'MG'),
('Thiago Bueno', 'Desenvolvedor', 3, 7200.00, '2019-10-25', 'SP'),
('Ursula Pinto', 'Assistente', 5, 2700.00, '2023-09-10', 'RJ'),
('Vitor Caldas', 'Desenvolvedor', 3, 7500.00, '2020-06-03', 'PR'),
('Wendy Araujo', 'Consultora', 1, 3100.00, '2023-11-14', 'SC'),
('Xisto Borges', 'Assistente', 4, 2900.00, '2022-07-19', 'MG'),
('Yasmin Torres', 'Analista', 3, 5600.00, '2021-04-30', 'SP'),
('Zeca Oliveira', 'Assistente', 1, 3400.00, '2023-01-22', 'RJ');

-- -------------------------------------------------------
-- PACIENTES
-- -------------------------------------------------------
CREATE TABLE Pacientes (
    PacID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE NOT NULL,
    Estado CHAR(2) NOT NULL,
    Plano VARCHAR(50) NOT NULL
);

INSERT INTO Pacientes (Nome, DataNascimento, Estado, Plano) VALUES
('João Andrade', '1980-05-12', 'SP', 'Bradesco Saude'),
('Maria Souza', '1992-08-23', 'RJ', 'Unimed'),
('Pedro Costa', '1975-11-03', 'MG', 'SulAmerica'),
('Lucia Ferreira', '1988-02-17', 'SP', 'Bradesco Saude'),
('Roberto Alves', '2001-07-30', 'PR', 'Unimed'),
('Camila Nunes', '1995-04-14', 'SP', 'Amil'),
('Fernando Lima', '1970-09-08', 'SC', 'SulAmerica'),
('Patricia Melo', '1983-12-25', 'RJ', 'Bradesco Saude'),
('Ricardo Gomes', '1998-03-19', 'SP', 'Unimed'),
('Beatriz Rocha', '1990-06-07', 'MG', 'Amil'),
('Sergio Pinto', '1965-01-22', 'SP', 'Bradesco Saude'),
('Tatiana Cruz', '2000-10-11', 'RJ', 'Unimed'),
('Marcelo Dias', '1978-07-04', 'PR', 'SulAmerica'),
('Renata Borges', '1993-05-29', 'SP', 'Amil'),
('Gustavo Neves', '1987-08-16', 'SC', 'Bradesco Saude'),
('Aline Torres', '1996-02-03', 'MG', 'Unimed'),
('Felipe Araujo', '1982-11-27', 'SP', 'SulAmerica'),
('Juliana Mota', '1999-04-18', 'RJ', 'Bradesco Saude'),
('Daniel Faria', '1974-09-09', 'SP', 'Amil'),
('Vanessa Oliveira', '2003-01-15', 'PR', 'Unimed'),
('Rodrigo Santos', '1991-06-21', 'SP', 'Bradesco Saude'),
('Melissa Cardoso', '1986-03-08', 'MG', 'SulAmerica'),
('Alexandre Lima', '1977-12-14', 'RJ', 'Amil'),
('Cristina Alves', '1994-07-26', 'SC', 'Unimed'),
('Paulo Mendes', '1969-10-30', 'SP', 'Bradesco Saude'),
('Bianca Ramos', '2002-05-05', 'SP', 'Amil'),
('Leonardo Teixeira', '1985-08-12', 'PR', 'Unimed'),
('Mariana Freitas', '1997-02-28', 'RJ', 'SulAmerica'),
('Henrique Barbosa', '1972-11-19', 'MG', 'Bradesco Saude'),
('Isabela Cunha', '2001-04-07', 'SP', 'Unimed');

-- -------------------------------------------------------
-- ATENDIMENTOS
-- -------------------------------------------------------
CREATE TABLE Atendimentos (
    AtendID INT PRIMARY KEY IDENTITY(1,1),
    PacID INT FOREIGN KEY REFERENCES Pacientes(PacID),
    FuncID INT FOREIGN KEY REFERENCES Funcionarios(FuncID),
    DataAtendimento DATE NOT NULL,
    TipoAtendimento VARCHAR(30) NOT NULL,
    NotaCSAT INT NULL,
    Duracao INT NOT NULL
);

INSERT INTO Atendimentos (PacID, FuncID, DataAtendimento, TipoAtendimento, NotaCSAT, Duracao) VALUES
(1,2,'2025-01-05','Agendamento',5,8),(2,16,'2025-01-06','Duvida',4,12),
(3,10,'2025-01-07','Reclamacao',2,25),(4,2,'2025-01-08','Agendamento',5,7),
(5,22,'2025-01-09','Duvida',3,15),(6,16,'2025-01-10','Reclamacao',1,30),
(7,10,'2025-01-11','Agendamento',4,9),(8,2,'2025-01-12','Duvida',5,11),
(9,22,'2025-01-13','Reclamacao',2,22),(10,16,'2025-01-14','Agendamento',5,8),
(11,2,'2025-01-15','Duvida',4,14),(12,10,'2025-01-16','Reclamacao',1,35),
(13,22,'2025-01-17','Agendamento',5,6),(14,16,'2025-01-18','Duvida',3,18),
(15,2,'2025-01-19','Reclamacao',2,28),(16,10,'2025-01-20','Agendamento',5,7),
(17,22,'2025-01-21','Duvida',4,13),(18,16,'2025-01-22','Reclamacao',1,40),
(19,2,'2025-01-23','Agendamento',5,9),(20,10,'2025-01-24','Duvida',3,16),
(21,22,'2025-02-01','Reclamacao',2,24),(22,16,'2025-02-02','Agendamento',5,8),
(23,2,'2025-02-03','Duvida',4,11),(24,10,'2025-02-04','Reclamacao',1,33),
(25,22,'2025-02-05','Agendamento',5,7),(26,16,'2025-02-06','Duvida',3,19),
(27,2,'2025-02-07','Reclamacao',2,27),(28,10,'2025-02-08','Agendamento',5,8),
(29,22,'2025-02-09','Duvida',4,12),(30,16,'2025-02-10','Reclamacao',1,38),
(1,10,'2025-02-11','Agendamento',5,6),(2,2,'2025-02-12','Duvida',4,14),
(3,22,'2025-02-13','Reclamacao',2,26),(4,16,'2025-02-14','Agendamento',5,9),
(5,10,'2025-02-15','Duvida',3,17),(6,2,'2025-03-01','Reclamacao',1,42),
(7,22,'2025-03-02','Agendamento',5,7),(8,16,'2025-03-03','Duvida',4,13),
(9,10,'2025-03-04','Reclamacao',2,23),(10,2,'2025-03-05','Agendamento',5,8),
(11,22,'2025-03-06','Duvida',3,15),(12,16,'2025-03-07','Reclamacao',1,36),
(13,10,'2025-03-08','Agendamento',5,6),(14,2,'2025-03-09','Duvida',4,11),
(15,22,'2025-03-10','Reclamacao',2,29),(16,16,'2025-03-11','Agendamento',5,8),
(17,10,'2025-03-12','Duvida',3,16),(18,2,'2025-03-13','Reclamacao',1,41),
(19,22,'2025-03-14','Agendamento',5,7);

-- -------------------------------------------------------
-- OCORRENCIAS
-- -------------------------------------------------------
CREATE TABLE Ocorrencias (
    OcorID INT PRIMARY KEY IDENTITY(1,1),
    AtendID INT FOREIGN KEY REFERENCES Atendimentos(AtendID),
    FuncAnalista INT FOREIGN KEY REFERENCES Funcionarios(FuncID),
    DataAbertura DATE NOT NULL,
    DataFechamento DATE NULL,
    Tipo VARCHAR(50) NOT NULL,
    Procedente VARCHAR(3) NOT NULL,
    Descricao VARCHAR(200) NOT NULL
);

INSERT INTO Ocorrencias (AtendID, FuncAnalista, DataAbertura, DataFechamento, Tipo, Procedente, Descricao) VALUES
(3,11,'2025-01-08','2025-01-10','Conduta do Consultor','Sim','Consultor nao resolveu a duvida do paciente'),
(6,11,'2025-01-11','2025-01-13','Tempo de Espera','Nao','Paciente reclamou mas tempo estava dentro do SLA'),
(9,14,'2025-01-14','2025-01-16','Informacao Incorreta','Sim','Consultor passou dados errados sobre o exame'),
(12,11,'2025-01-17',NULL,'Conduta do Consultor','Sim','Tom inadequado durante o atendimento'),
(15,14,'2025-01-20','2025-01-22','Cancelamento Indevido','Nao','Cancelamento foi solicitado pelo proprio paciente'),
(18,11,'2025-01-23',NULL,'Informacao Incorreta','Sim','Paciente recebeu orientacao errada sobre preparo de exame'),
(21,14,'2025-02-02','2025-02-04','Conduta do Consultor','Sim','Consultor desligou a ligacao sem resolver'),
(24,11,'2025-02-05',NULL,'Tempo de Espera','Sim','Paciente ficou mais de 20 minutos em espera'),
(27,14,'2025-02-08','2025-02-10','Informacao Incorreta','Nao','Informacao estava correta conforme protocolo'),
(30,11,'2025-02-11',NULL,'Conduta do Consultor','Sim','Multiplas reclamacoes do mesmo consultor'),
(33,14,'2025-02-14','2025-02-16','Cancelamento Indevido','Sim','Sistema cancelou agendamento sem solicitacao'),
(36,11,'2025-03-02',NULL,'Conduta do Consultor','Sim','Consultor sem empatia durante atendimento critico'),
(39,14,'2025-03-05','2025-03-07','Informacao Incorreta','Nao','Paciente interpretou mal a orientacao'),
(42,11,'2025-03-08',NULL,'Tempo de Espera','Sim','Fila de espera acima do esperado no periodo'),
(45,14,'2025-03-11','2025-03-13','Conduta do Consultor','Sim','Consultor nao seguiu protocolo de atendimento'),
(48,11,'2025-03-14',NULL,'Informacao Incorreta','Sim','Orientacao incorreta sobre cobertura do plano');
