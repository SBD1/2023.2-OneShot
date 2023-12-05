import psycopg2
from contextlib import closing
import getpass
from game.utils import *

with closing(psycopg2.connect(database="study", user="postgres", password="2605", host="localhost", port="5432")) as conn:
    with conn.cursor() as cur:
        sql_files = ['database/drop.sql', 'database/ddl.sql',
                     'database/proceaduresComands.sql', 'database/trigger.sql', 'database/dml.sql']
        for sql_file in sql_files:
            execute_sql_file(cur, sql_file)
            conn.commit()

        clear()

        command_functions = {
            'abrir inventario': ('database/dql/inventario.sql', inventory),
            '': ('database/dql/local.sql', descricao_local)
        }

        prevcomando = ''
        comando = ''

        while True:
            sql_file, function = command_functions.get(
                comando, ('database/dql/local.sql', descricao_local))
            execute_sql_file(cur, sql_file)
            function(cur)

            prevcomando = comando
            print(pos(1, 25))
            comando = input('> ').lower()

            if comando in ['end', 'exit', 'quit']:
                break

            try:
                clear()
                cur.execute(
                    "INSERT INTO Command(CommandFunction,PcId) VALUES (%s,1)", (comando,))
                conn.commit()
            except Exception as e:
                conn.rollback()
                message = str(e).split('CONTEXT')[0]
                Exception_handler(message)
                typewriter("\nPressione enter para continuar...")
                input()
                if prevcomando == 'abrir inventario':
                    comando = prevcomando

            for notice in conn.notices:
                if 'Niko' in notice:
                    notice = notice.replace('NOTICE:', '').replace('  ', '')
                    notice_handler(conn, notice)
            conn.notices.clear()

            clear()