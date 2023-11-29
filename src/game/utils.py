from time import sleep
import os

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
