import psycopg2
import sys
import getpass

from game.utils import *

# Conectar ao banco de dados PostgreSQL
conn = psycopg2.connect(database="study", user="postgres",
                        password="2605", host="localhost", port="5432")

# Criar um cursor para executar consultas SQL
cur = conn.cursor()

with open('database/ddl.sql', 'r') as f:
    sql = f.read()
cur.execute(sql)
conn.commit()

with open('database/proceaduresComands.sql', 'r') as f:
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
# headline('One Shot', '-')
# typewriter('This is a test '+getpass.getuser()+'\n')
# typewriter('Pressione qualquer tecla para continuar...')
# input()
# clear()

while True:

    with open('database/dql.sql', 'r') as f:
        sql = f.read()
    cur.execute(sql)

    descricao_local(cur)


    print(pos(1, 18))
    comando = input('> ')
    comando = comando.lower()
    # Se o usuário digitar 'sair', interrompa o loop
    if comando == 'end' or comando == 'exit' or comando == 'quit':
        break

    try:
        clear()
        cur.execute("INSERT INTO comandos (funcao,pcid) VALUES (%s,0)", (comando,))
        conn.commit()
    except Exception as e:
        conn.rollback()
        message = str(e)
        message = message.split('CONTEXT')[0]  # Remove a parte do contexto
        erro(message)
        typewriter("\nPressione enter para continuar...")
        input()

    


    clear()
