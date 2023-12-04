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

## 0.045
def typewriter(text, speed=1):
    delay = 0.005 * speed
    for char in text:
        print(char, end='', flush=True)
        sleep(delay)

def descricao_local(cur):
    descricao, estruturas, objetos, Item = cur.fetchone()

    if descricao is not None:
        typewriter('Niko está em '+descricao+'\n\n\n')

    if (estruturas and any(e is not None and e != '' for e in estruturas)) or (objetos and any(o is not None and o != '' for o in objetos)) or (Item and any(i is not None and i != '' for i in Item)):
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

    if Item is not None:
        for i in Item:
            if i is not None: 
                typewriter('\n\nItem:\n')
                typewriter(i+'\n')

def inventory(cur):
    results = cur.fetchall()
    if results:
        typewriter('Niko tem:\n')
        for result in results:
            ItemMName, ItemMDescription, ItemEName, ItemEDescription = result
            if ItemMName is not None:
                typewriter(f'{ItemMName}: {ItemMDescription}\n')
            if ItemEName is not None:
                typewriter(f'{ItemEName}: {ItemEDescription}\n')
    else:
        typewriter('Niko não tem nada.\n')


def erro(message):
    typewriter(Fore.RED + message + Style.RESET_ALL)


def notice_handler(conn, notice):
    typewriter(notice)
    typewriter('\n\nPressione enter para continuar...')
    input()