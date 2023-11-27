import psycopg2
import sys
import getpass

from game.utils import *

# Conectar ao banco de dados PostgreSQL
conn = psycopg2.connect(database="study", user="postgres", password="2605", host="localhost", port="5432")

# Criar um cursor para executar consultas SQL
cur = conn.cursor()

# Função para iniciar o jogo
def iniciar_jogo():
    # Obter o estado inicial do jogo do banco de dados
    cur.execute("SELECT * FROM estado_do_jogo")
    estado_do_jogo = cur.fetchone()

    # Exibir o estado inicial do jogo para o usuário
    print(estado_do_jogo)

# Função para lidar com a entrada do usuário
def lidar_com_entrada_do_usuario(entrada):
    # Atualizar o estado do jogo com base na entrada do usuário
    cur.execute("UPDATE estado_do_jogo SET ... WHERE ...", (entrada,))

    # Obter o novo estado do jogo do banco de dados
    cur.execute("SELECT * FROM estado_do_jogo")
    estado_do_jogo = cur.fetchone()

    # Exibir o novo estado do jogo para o usuário
    print(estado_do_jogo)

# Loop principal do jogo

set_console_size()
clear()
headline('One Shot')
print(pos(10, 5))
typewriter('This is a test')


print(pos(5, 10))
input('> ')

print(getpass.getuser())
clear()

# while True:





#     # Obter a entrada do usuário
#     entrada = input(">  ")

#     # Lidar com a entrada do usuário
#     lidar_com_entrada_do_usuario(entrada)