-- =====================================================
-- EXERCÍCIOS SQL SERVER — COMPLETO
-- =====================================================

-- -------------------------------------------------------
-- AULA 01 — SELECT E WHERE
-- -------------------------------------------------------

-- Traz nome e cargo de todos os funcionários
SELECT Nome, Cargo FROM Funcionarios

-- Todos os funcionários do Estado SP
SELECT * FROM Funcionarios WHERE Estado = 'SP'

-- Nome e salário acima de 6000
SELECT Nome, Salario FROM Funcionarios WHERE Salario > 6000

-- Gerentes de SP
SELECT Nome, Cargo FROM Funcionarios
WHERE Cargo = 'Gerente' AND Estado = 'SP'

-- Pacientes do plano Bradesco
SELECT * FROM Pacientes WHERE Plano = 'Bradesco Saude'

-- -------------------------------------------------------
-- AULA 02 — ORDER BY, BETWEEN, IN
-- -------------------------------------------------------

-- Salário do maior pro menor
SELECT Nome, Salario FROM Funcionarios
ORDER BY Salario DESC

-- Admitidos entre 2020 e 2021
SELECT Nome, DataAdmissao FROM Funcionarios
WHERE DataAdmissao BETWEEN '2020-01-01' AND '2021-12-31'
ORDER BY DataAdmissao

-- Funcionários de SP, RJ ou SC
SELECT Nome, Estado FROM Funcionarios
WHERE Estado IN ('SP', 'RJ', 'SC')

-- Salário entre 4000 e 7000 ordenado por cargo
SELECT Nome, Cargo FROM Funcionarios
WHERE Salario BETWEEN 4000 AND 7000
ORDER BY Cargo

-- Atendimentos de Reclamacao ou Duvida por data
SELECT * FROM Atendimentos
WHERE TipoAtendimento IN ('Reclamacao', 'Duvida')
ORDER BY DataAtendimento

-- -------------------------------------------------------
-- AULA 03 — GROUP BY E HAVING
-- -------------------------------------------------------

-- Funcionários por Estado
SELECT Estado, COUNT(*) AS Total FROM Funcionarios
GROUP BY Estado

-- Média salarial por Cargo
SELECT Cargo, AVG(Salario) AS MediaSalarial FROM Funcionarios
GROUP BY Cargo

-- Maior e menor salário
SELECT MAX(Salario) AS MaiorSalario, MIN(Salario) AS MenorSalario
FROM Funcionarios

-- Cargos com mais de 3 funcionários
SELECT Cargo, COUNT(*) AS Total FROM Funcionarios
GROUP BY Cargo
HAVING COUNT(*) > 3

-- Soma de salários por Estado do maior pro menor
SELECT Estado, SUM(Salario) AS TotalFolha FROM Funcionarios
GROUP BY Estado
ORDER BY SUM(Salario) DESC

-- -------------------------------------------------------
-- AULA 04 — INNER JOIN
-- -------------------------------------------------------

-- Nome do departamento e total de funcionários
SELECT Departamentos.Nome, COUNT(*) AS TotalFuncionarios
FROM Departamentos
INNER JOIN Funcionarios ON Departamentos.DepID = Funcionarios.DepID
GROUP BY Departamentos.Nome

-- Nome do consultor e média de CSAT
SELECT Funcionarios.Nome, AVG(NotaCSAT) AS MediaCSAT
FROM Funcionarios
INNER JOIN Atendimentos ON Funcionarios.FuncID = Atendimentos.FuncID
GROUP BY Funcionarios.FuncID, Funcionarios.Nome
ORDER BY AVG(NotaCSAT) DESC

-- Departamentos com média salarial acima de 5000
SELECT Departamentos.Nome, AVG(Salario) AS MediaSalarial
FROM Departamentos
INNER JOIN Funcionarios ON Departamentos.DepID = Funcionarios.DepID
GROUP BY Departamentos.Nome
HAVING AVG(Salario) > 5000

-- -------------------------------------------------------
-- AULA 05 — LEFT JOIN E CASE WHEN
-- -------------------------------------------------------

-- Todos os funcionários e seu departamento
SELECT Funcionarios.Nome, Departamentos.Nome AS Departamento
FROM Funcionarios
LEFT JOIN Departamentos ON Funcionarios.DepID = Departamentos.DepID

-- Todos os pacientes e data de atendimento (NULL se não tiver)
SELECT Pacientes.Nome, Atendimentos.DataAtendimento
FROM Pacientes
LEFT JOIN Atendimentos ON Pacientes.PacID = Atendimentos.PacID

-- Faixa salarial com CASE WHEN
SELECT Nome, Salario,
CASE
    WHEN Salario >= 8000 THEN 'Alto'
    WHEN Salario > 5000  THEN 'Medio'
    ELSE 'Baixo'
END AS Faixa
FROM Funcionarios

-- Avaliação do CSAT com CASE WHEN
SELECT Pacientes.Nome, Atendimentos.DataAtendimento,
CASE
    WHEN NotaCSAT = 5        THEN 'Otimo'
    WHEN NotaCSAT IN (3, 4)  THEN 'Bom'
    ELSE 'Ruim'
END AS Avaliacao
FROM Pacientes
INNER JOIN Atendimentos ON Pacientes.PacID = Atendimentos.PacID

-- -------------------------------------------------------
-- AULA 06 — SUBQUERY
-- -------------------------------------------------------

-- Funcionários acima da média salarial
SELECT Nome, Salario FROM Funcionarios
WHERE Salario > (SELECT AVG(Salario) FROM Funcionarios)

-- Funcionários do departamento NAC sem usar o ID
SELECT Nome, Cargo FROM Funcionarios
WHERE DepID = (SELECT DepID FROM Departamentos WHERE Nome = 'NAC')

-- Pacientes que tiveram reclamação
SELECT Nome FROM Pacientes
WHERE PacID IN (SELECT PacID FROM Atendimentos WHERE TipoAtendimento = 'Reclamacao')

-- Funcionários que ganham mais que Carlos Lima
SELECT Nome, Salario FROM Funcionarios
WHERE Salario > (SELECT Salario FROM Funcionarios WHERE Nome = 'Carlos Lima')

-- Funcionários que nunca analisaram ocorrência
SELECT Nome FROM Funcionarios
WHERE FuncID NOT IN (SELECT FuncAnalista FROM Ocorrencias)

-- -------------------------------------------------------
-- AULA 07 — WINDOW FUNCTIONS
-- -------------------------------------------------------

-- Média salarial do cargo de cada funcionário
SELECT Nome, Cargo, Salario,
AVG(Salario) OVER (PARTITION BY Cargo) AS MediaDoCargo
FROM Funcionarios

-- Ranking geral de salário
SELECT Nome, Salario,
RANK() OVER (ORDER BY Salario DESC) AS Posicao
FROM Funcionarios

-- Posição dentro do departamento
SELECT Funcionarios.Nome, Departamentos.Nome AS Departamento, Salario,
ROW_NUMBER() OVER (PARTITION BY Departamentos.DepID ORDER BY Salario DESC) AS Ranking
FROM Funcionarios
INNER JOIN Departamentos ON Funcionarios.DepID = Departamentos.DepID

-- Data do atendimento anterior do mesmo paciente
SELECT PacID, DataAtendimento,
LAG(DataAtendimento) OVER (PARTITION BY PacID ORDER BY DataAtendimento) AS DataAnterior
FROM Atendimentos
