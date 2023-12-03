from time import sleep
import os
from colorama import Fore, Style

# Stores console's window size at launch
AC_SCREEN_WIDTH = 80
AC_SCREEN_HEIGHT = 35

# Console functions >
# Configures console's window size according to platform


def set_console_size():
    console_title = "One Shot"

    os.system('echo -n -e "\033]0;{}\007"'.format(console_title))
    os.system('echo "\033[8;{0};{1}t"'.format(AC_SCREEN_HEIGHT, AC_SCREEN_WIDTH))



def clear():
    os.system('clear')

# Returns an ANSI Sequence to change cursor position


def pos(x, y):
    return '\x1b[{};{}H'.format(int(y), int(x))


# Prints a headline
def headline(text, char='='):
    typewriter(text+'\n')
    typewriter(len(text) * char+'\n')


def typewriter(text, speed=1):
    delay = 0.045 * speed
    for char in text:
        print(char, end='', flush=True)
        sleep(delay)

def descricao_local(cur):
    descricao, estruturas, objetos, itens = cur.fetchone()

    if descricao is not None:
        typewriter(descricao+'\n\n\n')

    if (estruturas and any(e is not None and e != '' for e in estruturas)) or (objetos and any(o is not None and o != '' for o in objetos)) or (itens and any(i is not None and i != '' for i in itens)):
        typewriter('Niko vê:\n')
    else:
        typewriter('Niko não vê nada de interessante.\n')


    if estruturas is not None:
        for e in estruturas:
            if e is not None:
                typewriter('\n\nEstruturas:\n')
                typewriter(e+'\n')

    if objetos is not None:
        for o in objetos:
            if o is not None:
                typewriter('\n\nObjetos:\n')
                typewriter(o+'\n')

    if itens is not None:
        for i in itens:
            if i is not None: 
                typewriter('\n\nItens:\n')
                typewriter(i+'\n')

def inventory(cur):
    results = cur.fetchall()
    if results:
        typewriter('Niko tem:\n')
        for result in results:
            itensMName, itensMDescription, itensEName, itensEDescription = result
            if itensMName is not None:
                typewriter(f'{itensMName}: {itensMDescription}\n')
            if itensEName is not None:
                typewriter(f'{itensEName}: {itensEDescription}\n')
    else:
        typewriter('Niko não tem nada.\n')


def erro(message):
    typewriter(Fore.RED + message + Style.RESET_ALL)


def notice_handler(conn, notice):
    typewriter(notice)
    typewriter('\n\nPressione enter para continuar...')
    input()