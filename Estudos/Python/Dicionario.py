# =====================================================
# RESUMO PYTHON — CONSULTA RÁPIDA
# =====================================================

# -------------------------------------------------------
# VARIÁVEIS E TIPOS
# -------------------------------------------------------
nome = "Kauã"          # str — texto
idade = 19             # int — número inteiro
salario = 5800.00      # float — número decimal
ativo = True           # bool — verdadeiro/falso

# -------------------------------------------------------
# INPUT E F-STRING
# -------------------------------------------------------
nome = input("Digite seu nome: ")
idade = int(input("Digite sua idade: "))
salario = float(input("Digite seu salário: "))

print(f"Olá {nome}, você tem {idade} anos.")
print(f"Salário formatado: R${salario:.2f}")  # :.2f = 2 casas decimais

# -------------------------------------------------------
# IF / ELIF / ELSE
# -------------------------------------------------------
if idade >= 18:
    print("Maior de idade")
elif idade < 0:
    print("Idade inválida")
else:
    print("Menor de idade")

# Operadores lógicos
if user == "kaua" and senha == 1234:   # AND — os dois precisam ser true
    print("Acesso liberado")
if user != "kaua" or senha != 1234:    # OR — basta um ser true
    print("Acesso negado")
if num % 2 == 0:                       # % — resto da divisão (par/impar)
    print("Par")

# -------------------------------------------------------
# LISTAS
# -------------------------------------------------------
lista = []                    # lista vazia
lista.append("item")          # adiciona no final
lista[0]                      # acessa pelo índice (começa no 0)
lista[-1]                     # último item
lista[2] = "novo"             # altera item pelo índice
len(lista)                    # tamanho da lista
sum(lista)                    # soma (só números)

# -------------------------------------------------------
# WHILE
# -------------------------------------------------------
while len(lista) < 4:
    item = input("Digite: ")
    lista.append(item)

# -------------------------------------------------------
# FOR
# -------------------------------------------------------
# Percorrendo lista simples
for item in lista:
    print(item)

# Com range — para repetir N vezes
for i in range(1, 6):         # 1 até 5
    print(i)

# For com if
for salario in salarios:
    if salario > 4000:
        print(salario)

# Acumulador dentro do for
total = 0
for nota in notas:
    total += nota             # += é o mesmo que total = total + nota
media = total / len(notas)

# -------------------------------------------------------
# DICIONÁRIOS
# -------------------------------------------------------
pessoa = {
    "nome": "Kauã",
    "idade": 19,
    "cargo": "Analista"
}

pessoa["nome"]                # acessando valor pela chave
pessoa["cargo"] = "Gerente"   # alterando valor

# Lista de dicionários
funcionarios = [
    {"nome": "Ana", "salario": 4500},
    {"nome": "Bruno", "salario": 3800}
]

for func in funcionarios:
    print(func["nome"], func["salario"])

# -------------------------------------------------------
# FUNÇÕES
# -------------------------------------------------------
# Função simples
def saudacao(nome):
    print(f"Olá, {nome}!")

saudacao("Kauã")

# Função com retorno
def calcular_media(notas):
    return sum(notas) / len(notas)

resultado = calcular_media([8, 9, 7, 10])
print(f"Média: {resultado:.2f}")

# Função com dicionário
def analisar_ocorrencia(ocorrencia):
    if ocorrencia["procedente"] == "Sim":
        print(f"Tipo: {ocorrencia['tipo']} — PROCEDENTE")
    else:
        print(f"Tipo: {ocorrencia['tipo']} — IMPROCEDENTE")

# -------------------------------------------------------
# PRÓXIMO: PANDAS
# -------------------------------------------------------
# import pandas as pd
# df = pd.read_csv("arquivo.csv")
# df = pd.read_excel("arquivo.xlsx")
