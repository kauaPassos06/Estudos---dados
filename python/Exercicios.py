# =====================================================
# EXERCÍCIOS PYTHON — COMPLETO
# =====================================================

# -------------------------------------------------------
# AULA 01 — VARIÁVEIS, INPUT E F-STRING
# -------------------------------------------------------
print("Vamos começar com seu nome")
nome = input("Digite seu nome: ")
idade = int(input("Digite sua idade: "))
sal = int(input("Digite seu salário: "))
salv = int(input("Digite seu salário variavel: "))
n1 = int(input("Digite o 1 numero: "))
n2 = int(input("Digite o 2 numero: "))
rem = float(input("Digite o valor de reembolso: "))

total = n1 + n2
total_salario = sal + salv
mes = idade * 12
rem = rem + 50

print(f"Seja Bem vindo ao python, {nome}")
print(f"Seu tempo de vida em meses é: {mes} meses")
print(f"A sua renda total é: {total_salario}")
print(f"A soma dos dois numeros da: {total}")
print(f"O valor do reembolso com a taxa de bonus é: {rem}")

# -------------------------------------------------------
# AULA 02 — IF / ELIF / ELSE
# -------------------------------------------------------

# Maior de idade
idade = int(input("Qual é sua idade: "))
if idade >= 18:
    print("Você já é maior de idade.")
elif idade < 0:
    print("Não foi possível saber")
else:
    print("Você é menor de idade.")

# Comparação de salários
sal1 = float(input("Seu salário: "))
sal2 = float(input("Salário da sua namorada: "))
if sal1 > sal2:
    print("Seu salário é maior.")
elif sal1 < sal2:
    print("O salário dela é maior. Ela foi efetivada, respeita!")
else:
    print("Vocês ganham exatamente a mesma coisa!")

# Reembolso
rem = float(input("Digite o valor do reembolso: "))
if rem > 500:
    print("ALERTA: Reembolso de alto valor! Enviando para auditoria.")
else:
    print("Reembolso aprovado automaticamente.")

# Login
user = str(input("Digite o user: "))
senha = int(input("Digite a senha: "))
if user == "kaua" and senha == 1234:
    print("Acesso liberado ao banco de dados.")
elif user != "kaua" or senha != 1234:
    print("Senha ou usuario incorreto")

# Par ou ímpar
num = int(input("Digite o valor: "))
if num % 2 == 0:
    print("Numero par")
else:
    print("Numero impar")

# -------------------------------------------------------
# AULA 03 — LISTAS
# -------------------------------------------------------

# Lista de hardware
hardware = []
hardware.append("Mouse Sem Fio")
hardware.append("Teclado Mecânico")
hardware.append("Notebook ThinkPad")
print(f"Lista completa: {hardware}")

# Acessando por índice
marcas = ["Delboni", "Lavoisier", "Salomão"]
print(f"A segunda marca é: {marcas[1]}")

# While com lista
fila_atendimento = []
while len(fila_atendimento) < 4:
    nome = input(f"Digite o nome da {len(fila_atendimento) + 1}ª pessoa: ")
    fila_atendimento.append(nome)
print(f"Existem {len(fila_atendimento)} pessoas aguardando atendimento no SAC.")

# Alterando item da lista
erro_sistema = [200, 300, 500]
erro_sistema[2] = 503
print(f"Lista atualizada: {erro_sistema}")

# Soma de itens
frilas = [960, 450, 600]
soma = frilas[0] + frilas[-1]
print(f"Soma do primeiro e último: {soma}")

# -------------------------------------------------------
# AULA 04 — FOR
# -------------------------------------------------------

# Percorrendo lista de nomes
nomes = []
for i in range(1, 6):
    nome = str(input(f"Digite o {i}º nome: "))
    nomes.append(nome)
for nome in nomes:
    print(nome)

# Média de CSAT
notas_csat = []
for i in range(1, 5):
    nota = float(input(f"Digite a {i}ª nota do CSAT: "))
    notas_csat.append(nota)
total = 0
for nota in notas_csat:
    total += nota
media_csat = total / len(notas_csat)
print(f"A média das notas é: {media_csat:.2f}")

# Filtro
