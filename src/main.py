import psycopg2
import sys
import getpass

from game.utils import *

# Conectar ao banco de dados PostgreSQL
conn = psycopg2.connect(database="study", user="postgres", password="2605", host="localhost", port="5432")

# Criar um cursor para executar consultas SQL
cur = conn.cursor()

with open('database/ddl.sql', 'r') as f:
    sql = f.read()
cur.execute(sql)
conn.commit()

with open('database/trigger.sql', 'r') as f:
    sql = f.read()
cur.execute(sql)
conn.commit()

with open('database/dml.sql', 'r') as f:
    sql = f.read()
cur.execute(sql)
conn.commit()

# Função para iniciar o jogo
set_console_size()
clear()
headline('One Shot', '-')
typewriter('This is a test '+getpass.getuser()+'\n')
typewriter('Pressione qualquer tecla para continuar...')
input()
clear()

while True:
    
    cur.execute("SELECT descricao FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0));")
    descricao = cur.fetchone()
    typewriter(descricao[0]+'\n')

    print(pos(1, 18))
    comando = input('> ')
    comando = comando.lower()
    # Se o usuário digitar 'sair', interrompa o loop
    if comando == 'desisto' or comando == 'sair':
        break

    cur.execute("INSERT INTO comandos (funcao) VALUES (%s)", (comando,))
    conn.commit()


    # cur.execute("SELECT dialogo FROM dialogos WHERE comando = %s", (comando,))
    # dialogo = cur.fetchone()

    # # Se um diálogo foi encontrado, imprima-o
    # if dialogo is not None:
    #     print(dialogo[0])

    clear()