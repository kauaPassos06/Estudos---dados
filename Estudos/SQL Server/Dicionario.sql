
-- =====================================================
-- RESUMO SQL SERVER — CONSULTA RÁPIDA
-- =====================================================

-- -------------------------------------------------------
-- SELECT BÁSICO
-- -------------------------------------------------------
SELECT * FROM Tabela                          -- traz tudo
SELECT coluna1, coluna2 FROM Tabela           -- colunas específicas
SELECT coluna AS Apelido FROM Tabela          -- renomeia coluna

-- -------------------------------------------------------
-- WHERE — FILTROS
-- -------------------------------------------------------
WHERE coluna = 'valor'                        -- igual (texto)
WHERE coluna = 100                            -- igual (número)
WHERE coluna != 'valor'                       -- diferente
WHERE coluna > 100                            -- maior que
WHERE coluna >= 100                           -- maior ou igual
WHERE coluna < 100                            -- menor que
WHERE coluna BETWEEN 100 AND 500             -- entre dois valores
WHERE coluna LIKE 'A%'                        -- começa com A
WHERE coluna LIKE '%silva%'                   -- contém silva
WHERE coluna IN ('SP', 'RJ', 'MG')           -- lista de valores
WHERE coluna NOT IN ('SP', 'RJ')             -- fora da lista
WHERE coluna IS NULL                          -- valor nulo
WHERE coluna IS NOT NULL                      -- valor não nulo
WHERE cond1 AND cond2                         -- as duas verdadeiras
WHERE cond1 OR cond2                          -- basta uma ser verdadeira

-- DIFERENÇA: = vs LIKE
-- = busca exata e é mais performático
-- LIKE é para busca parcial com %

-- -------------------------------------------------------
-- ORDER BY
-- -------------------------------------------------------
ORDER BY coluna ASC                           -- crescente (padrão)
ORDER BY coluna DESC                          -- decrescente
ORDER BY coluna1 ASC, coluna2 DESC           -- múltiplas colunas

-- -------------------------------------------------------
-- FUNÇÕES DE AGREGAÇÃO
-- -------------------------------------------------------
COUNT(*)                                      -- conta registros
COUNT(coluna)                                 -- conta não nulos
SUM(coluna)                                   -- soma
AVG(coluna)                                   -- média
MAX(coluna)                                   -- maior valor
MIN(coluna)                                   -- menor valor

-- -------------------------------------------------------
-- GROUP BY + HAVING
-- -------------------------------------------------------
SELECT coluna, COUNT(*) AS Total
FROM Tabela
GROUP BY coluna                               -- agrupa por coluna

-- HAVING filtra depois do agrupamento (WHERE não funciona com agregação)
GROUP BY coluna
HAVING COUNT(*) > 3
HAVING AVG(salario) > 5000

-- -------------------------------------------------------
-- JOINS
-- -------------------------------------------------------
-- INNER JOIN — só registros que existem nas duas tabelas
SELECT A.coluna, B.coluna
FROM TabelaA A
INNER JOIN TabelaB B ON A.id = B.id

-- LEFT JOIN — todos da esquerda, NULL se não tiver na direita
SELECT A.coluna, B.coluna
FROM TabelaA A
LEFT JOIN TabelaB B ON A.id = B.id

-- JOIN com múltiplas tabelas
FROM TabelaA A
INNER JOIN TabelaB B ON A.id = B.id
INNER JOIN TabelaC C ON B.id = C.id

-- -------------------------------------------------------
-- CASE WHEN — if/else dentro do SQL
-- -------------------------------------------------------
SELECT Nome,
CASE
    WHEN salario >= 8000 THEN 'Alto'
    WHEN salario > 5000  THEN 'Medio'
    ELSE 'Baixo'
END AS Faixa
FROM Funcionarios

-- -------------------------------------------------------
-- SUBQUERY — SELECT dentro de SELECT
-- -------------------------------------------------------
-- O SELECT interno roda primeiro e devolve um valor

-- Com operador de comparação
WHERE salario > (SELECT AVG(salario) FROM Funcionarios)

-- Com IN
WHERE DepID IN (SELECT DepID FROM Departamentos WHERE Andar = 3)

-- Com NOT IN
WHERE FuncID NOT IN (SELECT FuncAnalista FROM Ocorrencias)

-- -------------------------------------------------------
-- WINDOW FUNCTIONS
-- -------------------------------------------------------
-- Calculam sem reduzir linhas (diferente do GROUP BY)

-- OVER — define a janela de cálculo
-- PARTITION BY — agrupa dentro da janela
-- ORDER BY — ordena dentro da janela

-- ROW_NUMBER — numera sem empate (1, 2, 3...)
ROW_NUMBER() OVER (PARTITION BY Cargo ORDER BY Salario DESC) AS Ranking

-- RANK — numera com empate (1, 1, 3...)
RANK() OVER (ORDER BY Salario DESC) AS Posicao

-- LAG — pega o valor da linha anterior
LAG(coluna) OVER (PARTITION BY id ORDER BY data) AS ValorAnterior

-- AVG/SUM/COUNT com OVER — agrega sem reduzir linhas
AVG(Salario) OVER (PARTITION BY Cargo) AS MediaDoCargo
SUM(Salario) OVER (PARTITION BY Departamento) AS TotalDep

-- -------------------------------------------------------
-- COMANDOS ÚTEIS
-- -------------------------------------------------------
-- Criar tabela
CREATE TABLE Nome (
    id INT PRIMARY KEY IDENTITY(1,1),
    coluna VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NULL
);

-- Inserir dados
INSERT INTO Nome (coluna, valor) VALUES ('texto', 100.00)

-- Atualizar dados
UPDATE Nome SET coluna = 'novo' WHERE id = 1

-- Deletar dados
DELETE FROM Nome WHERE id = 1

-- Adicionar coluna
ALTER TABLE Nome ADD nova_coluna VARCHAR(50)

-- Renomear coluna
EXEC SP_RENAME 'dbo.Tabela.coluna_antiga', 'coluna_nova', 'COLUMN'

-- Chave estrangeira
ALTER TABLE Tabela
ADD CONSTRAINT FK_nome FOREIGN KEY (coluna) REFERENCES OutraTabela(id)
