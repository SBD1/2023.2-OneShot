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

    cur.execute("""
        SELECT 
            CASE 
                WHEN localizacao.sala_id IS NOT NULL THEN sala.descricao
                ELSE regiao.descricao
            END,
            CASE
                WHEN localizacao.sala_id IS NULL THEN ARRAY_AGG(DISTINCT estrutura.descricao)
                ELSE NULL
            END,
            ARRAY_AGG(DISTINCT objeto.descricao) AS objetos,
            ARRAY_AGG(DISTINCT item.descricao) AS itens
        FROM localizacao
        LEFT JOIN regiao ON localizacao.regiao_id = regiao.id
        LEFT JOIN sala ON localizacao.sala_id = sala.id
        LEFT JOIN estrutura ON regiao.id = estrutura.regiao_id
        LEFT JOIN objeto ON localizacao.id = objeto.localizacao_id
        LEFT JOIN item ON localizacao.id = item.localizacao_id
        WHERE localizacao.id = (SELECT localizacao_id FROM pc WHERE id = 0)
        GROUP BY localizacao.sala_id, sala.descricao, regiao.descricao
    """)

    descricao, estruturas, objetos, itens = cur.fetchone()

    if descricao is not None:
        typewriter(descricao+'\n')

    if estruturas is not None:
        for e in estruturas:
            if e is not None:
                typewriter(e+'\n')

    if objetos is not None:
        for o in objetos:
            if o is not None:
                typewriter(o+'\n')

    if itens is not None:
        for i in itens:
            if i is not None:
                typewriter(i+'\n')


    print(pos(1, 18))
    comando = input('> ')
    comando = comando.lower()
    # Se o usuário digitar 'sair', interrompa o loop
    if comando == 'end' or comando == 'exit' or comando == 'quit':
        break

    cur.execute("INSERT INTO comandos (funcao) VALUES (%s)", (comando,))
    conn.commit()

    # cur.execute("SELECT dialogo FROM dialogos WHERE comando = %s", (comando,))
    # dialogo = cur.fetchone()

    # # Se um diálogo foi encontrado, imprima-o
    # if dialogo is not None:
    #     print(dialogo[0])

    clear()
