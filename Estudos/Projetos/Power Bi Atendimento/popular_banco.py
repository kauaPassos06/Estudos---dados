import pyodbc
from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker('pt_BR')

# -------------------------------------------------------
# CONEXÃO COM SQL SERVER
# -------------------------------------------------------
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=tcp:DESKTOP-DT4MKHC,1433;'
    'DATABASE=Estudo;'
    'Trusted_Connection=yes;'
)
cursor = conn.cursor()
print("Conectado ao banco com sucesso!")

# -------------------------------------------------------
# DEPARTAMENTOS
# -------------------------------------------------------
departamentos = [
    ('NAC', 1, 'Daniela Costa'),
    ('Qualidade', 2, 'Eduardo Alves'),
    ('TI', 3, 'Gabriel Martins'),
    ('Financeiro', 4, 'Marcos Vitor'),
    ('RH', 2, 'Helena Rocha'),
    ('Insights', 3, 'Larissa Melo'),
]
for dep in departamentos:
    cursor.execute("INSERT INTO Departamentos (Nome, Andar, Gestor) VALUES (?,?,?)", dep)
print("Departamentos inseridos!")

# -------------------------------------------------------
# FUNCIONARIOS
# -------------------------------------------------------
cargos = ['Analista', 'Consultor', 'Gerente', 'Assistente', 'Desenvolvedor']
turnos = ['Manha', 'Tarde', 'Noite']
estados = ['SP', 'RJ', 'MG', 'PR', 'SC']
deps = [1, 2, 3, 4, 5, 6]

for _ in range(50):
    cursor.execute("""
        INSERT INTO Funcionarios (Nome, Cargo, DepID, Salario, DataAdmissao, Estado, Turno, Ativo)
        VALUES (?,?,?,?,?,?,?,?)
    """, (
        fake.name(),
        random.choice(cargos),
        random.choice(deps),
        round(random.uniform(2500, 12000), 2),
        fake.date_between(start_date='-5y', end_date='-6m'),
        random.choice(estados),
        random.choice(turnos),
        1
    ))
print("Funcionarios inseridos!")

# -------------------------------------------------------
# PACIENTES
# -------------------------------------------------------
planos = ['Bradesco Saude', 'Unimed', 'SulAmerica', 'Amil', 'Porto Seguro']
tipos_plano = ['Individual', 'Familiar', 'Empresarial']

for _ in range(200):
    cursor.execute("""
        INSERT INTO Pacientes (Nome, CPF, DataNascimento, Estado, Cidade, Plano, TipoPlano, DataCadastro)
        VALUES (?,?,?,?,?,?,?,?)
    """, (
        fake.name(),
        fake.cpf().replace('.','').replace('-',''),
        fake.date_of_birth(minimum_age=18, maximum_age=80),
        random.choice(estados),
        fake.city(),
        random.choice(planos),
        random.choice(tipos_plano),
        fake.date_between(start_date='-3y', end_date='today')
    ))
print("Pacientes inseridos!")

# -------------------------------------------------------
# MOTIVOS
# -------------------------------------------------------
motivos = [
    ('Conduta do Consultor', 'Atendimento'),
    ('Tempo de Espera', 'Operacional'),
    ('Informacao Incorreta', 'Qualidade'),
    ('Cancelamento Indevido', 'Operacional'),
    ('Cobranca Indevida', 'Financeiro'),
    ('Resultado de Exame', 'Qualidade'),
    ('Agendamento', 'Operacional'),
    ('Duvida sobre Plano', 'Comercial'),
    ('Demora no Atendimento', 'Atendimento'),
    ('Problema no Sistema', 'TI'),
]
for mot in motivos:
    cursor.execute("INSERT INTO Motivos (Descricao, Categoria) VALUES (?,?)", mot)
print("Motivos inseridos!")

# -------------------------------------------------------
# ATENDIMENTOS
# -------------------------------------------------------
canais = ['Telefone', 'WhatsApp', 'Email', 'Chat', 'Presencial']
tipos = ['Agendamento', 'Duvida', 'Reclamacao', 'Elogio', 'Cancelamento']

# busca IDs gerados
cursor.execute("SELECT PacID FROM Pacientes")
pac_ids = [row[0] for row in cursor.fetchall()]

cursor.execute("SELECT FuncID FROM Funcionarios")
func_ids = [row[0] for row in cursor.fetchall()]

for _ in range(500):
    data = fake.date_time_between(start_date='-1y', end_date='now')
    tipo = random.choice(tipos)
    nota = random.randint(1, 5) if tipo in ['Reclamacao', 'Elogio', 'Duvida'] else None
    cursor.execute("""
        INSERT INTO Atendimentos (PacID, FuncID, DataAtendimento, Canal, TipoAtendimento, NotaCSAT, Duracao, Transferido, Rechamada, Resolvido)
        VALUES (?,?,?,?,?,?,?,?,?,?)
    """, (
        random.choice(pac_ids),
        random.choice(func_ids),
        data,
        random.choice(canais),
        tipo,
        nota,
        random.randint(3, 60),
        random.choice([0, 0, 0, 1]),
        random.choice([0, 0, 1]),
        random.choice([0, 1, 1, 1])
    ))
print("Atendimentos inseridos!")

# -------------------------------------------------------
# OCORRENCIAS
# -------------------------------------------------------
cursor.execute("SELECT AtendID FROM Atendimentos WHERE TipoAtendimento = 'Reclamacao'")
rec_ids = [row[0] for row in cursor.fetchall()]

cursor.execute("SELECT FuncID FROM Funcionarios WHERE Cargo = 'Analista'")
analista_ids = [row[0] for row in cursor.fetchall()]

cursor.execute("SELECT MotID FROM Motivos")
mot_ids = [row[0] for row in cursor.fetchall()]

prioridades = ['Alta', 'Media', 'Baixa']

for atend_id in rec_ids:
    data_abertura = fake.date_between(start_date='-1y', end_date='today')
    prazo = random.randint(3, 10)
    fechada = random.choice([True, True, False])
    data_fechamento = None
    sla = None
    if fechada:
        dias = random.randint(1, prazo + 3)
        data_fechamento = data_abertura + timedelta(days=dias)
        sla = 1 if dias <= prazo else 0

    cursor.execute("""
        INSERT INTO Ocorrencias (AtendID, FuncAnalista, MotID, DataAbertura, DataFechamento, Prazo, SLACumprido, Prioridade, Procedente, Descricao)
        VALUES (?,?,?,?,?,?,?,?,?,?)
    """, (
        atend_id,
        random.choice(analista_ids),
        random.choice(mot_ids),
        data_abertura,
        data_fechamento,
        prazo,
        sla,
        random.choice(prioridades),
        random.choice(['Sim', 'Sim', 'Nao']),
        fake.sentence(nb_words=10)
    ))
print("Ocorrencias inseridas!")

# -------------------------------------------------------
# COMMIT E FECHAR
# -------------------------------------------------------
conn.commit()
conn.close()
print("\nTudo inserido com sucesso!")
