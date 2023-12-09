import re
from time import sleep
import os
from colorama import Fore, Style


COLOR_NIKO = Fore.BLUE
COLOR_STRUCTURE = Fore.MAGENTA
COLOR_OBJECT = Fore.CYAN
COLOR_ITEM_MATERIAL = Fore.YELLOW
COLOR_ITEM_EQUIPMENT = Fore.GREEN
COLOR_NPC = Fore.WHITE
COLOR_ERROR = Fore.RED

ITEM_TYPE_ITEMS = "Itens"
ITEM_TYPE_EQUIPMENTS = "Equipamentos"


def clear():
    os.system("clear")


def pos(x, y):
    return "\x1b[{};{}H".format(int(y), int(x))


def headline(text, char="="):
    typewriter("\n".join([text, len(text) * char]))

def typewriter(text, speed=1):
    delay = 0.0001 * speed
    text = re.sub(r"\bNiko\b", COLOR_NIKO + "Niko" + Style.RESET_ALL, text)
    text = re.sub(r"@user@", Fore.GREEN + os.getlogin() + Style.RESET_ALL, text)
    text = text.replace("???", Fore.MAGENTA + "???" + Style.RESET_ALL)
    for char in text:
        print(char, end="", flush=True)
        sleep(delay)


def print_items(items, color, label):
    if items and any(item is not None for item in items):
        typewriter(f"{color}{label}:{Style.RESET_ALL}\n")
        for item in items:
            if item is not None:
                typewriter(color + item + "\n" + Style.RESET_ALL)
        typewriter("\n")


def any_non_empty(items):
    return any(
        item_list is not None
        and any(item is not None and item != "" for item in item_list)
        for item_list in items
    )


def descricao_local(cur):
    result = cur.fetchone()
    if result is not None:
        (
            nome,
            nomequarto,
            estruturas,
            objetos,
            item_material,
            item_equipamento,
            npc_descriptions,
        ) = result

        conexoes = []
        if nomequarto is not None:
            cur.execute(
                """
                SELECT ConnectionName
                FROM Connection
                WHERE Room1Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1))
                OR Room2Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1))
            """
            )
            conexoes = [result[0] for result in cur.fetchall()]

        if nomequarto is not None:
            typewriter(f"Niko está em {nomequarto} {nome}\n\n")
        else:
            typewriter(f"Niko está em {nome}\n\n")

        if any_non_empty(
            [estruturas, objetos, item_material, item_equipamento, conexoes]
        ):
            typewriter("Niko vê:\n\n")
        else:
            typewriter("Niko não vê nada de interessante.\n\n")

        if nomequarto is not None:
            print_items(conexoes, Fore.MAGENTA, "Conexões")
        else:
            print_items(estruturas, COLOR_STRUCTURE, "Estruturas")

        print_items(objetos, COLOR_OBJECT, "Objetos")
        print_items(item_material, COLOR_ITEM_MATERIAL, "Itens")
        print_items(item_equipamento, COLOR_ITEM_EQUIPMENT, "Equipamentos")
        print_items(npc_descriptions, Fore.WHITE, "Seres")
    else:
        Exception_handler("Nenhum resultado encontrado.\n")


def print_conexoes(cur):
    with open("database/dql/conections.sql", "r") as file:
        conections = file.read()

    cur.execute(conections)
    results = cur.fetchall()
    results = [result[0] for result in results]
    print_items(results, Fore.MAGENTA, "Conexões")


def inventory(cur):
    results = cur.fetchall()
    if results:
        typewriter("Niko tem:\n\n\n")
        items = {ITEM_TYPE_ITEMS: [], ITEM_TYPE_EQUIPMENTS: []}
        colors = {ITEM_TYPE_ITEMS: Fore.YELLOW, ITEM_TYPE_EQUIPMENTS: Fore.GREEN}
        for result in results:
            ItemMName, ItemMDescription, ItemEName, ItemEDescription = result
            if ItemMName is not None:
                items[ITEM_TYPE_ITEMS].append(f"{ItemMName} - {ItemMDescription}")
            if ItemEName is not None:
                items[ITEM_TYPE_EQUIPMENTS].append(f"{ItemEName} - {ItemEDescription}")

        for item_type, item_list in items.items():
            if item_list:
                print_items(item_list, colors[item_type], item_type)
    else:
        typewriter("Niko não tem nada.\n")


def viagem_rapida(cur):
    results = cur.fetchall()
    if results:
        typewriter("Niko pode ir para:\n\n")
        for result in results:
            typewriter(f"{result[0]}\n")
    else:
        typewriter("Niko não pode ir para lugar nenhum.\n")


def Exception_handler(message):
    typewriter(COLOR_ERROR + message + Style.RESET_ALL)


def notice_handler(conn, notice):
    clear()
    try:
        typewriter(notice)
        typewriter("\n\nPressione enter para continuar...")
        input()
    except Exception as e:
        typewriter(COLOR_ERROR + "An error occurred: " + str(e) + Style.RESET_ALL)

def execute_sql_file(cur, file_path):
    with open(file_path, "r") as f:
        sql = f.read()
    cur.execute(sql)

def help():
    typewriter(Fore.WHITE+"Principais Comandos:\n\n")
    typewriter(Fore.CYAN+"ir para 'Direção'"+Style.RESET_ALL+" - Move Niko para região que está ao Norte, Sul, Leste ou Oeste\n")
    typewriter(Fore.MAGENTA+"viagem rapida"+Style.RESET_ALL+" - Exibe as regiões que Niko pode viajar\n")
    typewriter(Fore.BLUE+"viajar para 'região'"+Style.RESET_ALL+" - Viaja para uma região\n")
    typewriter(Fore.YELLOW+"entrar em 'Estrutura'"+Style.RESET_ALL+" - Move Niko para dentro de uma estrutura\n")
    typewriter(Fore.GREEN+"sair"+Style.RESET_ALL+" - Move Niko para fora de uma estrutura\n")
    typewriter(Fore.RED+"pegar 'Item'"+Style.RESET_ALL+" - Pega um item do chão\n")
    typewriter(Fore.WHITE+"abrir inventário"+Style.RESET_ALL+" - Abre o inventário\n")
    typewriter(Fore.CYAN+"fechar inventário"+Style.RESET_ALL+" - Fecha o inventário\n")
    typewriter(Fore.MAGENTA+"combinar 'Item' com 'Item'"+Style.RESET_ALL+" - Combina dois itens do inventário\n")
    typewriter(Fore.BLUE+"conversar com 'npc'"+Style.RESET_ALL+" - Conversa com um npc\n")
    typewriter(Fore.YELLOW+"interagir com 'Objeto'"+Style.RESET_ALL+" - Interage com um objeto\n")
    typewriter(Fore.GREEN+"interagir com 'Objeto' utilizando 'item'"+Style.RESET_ALL+" - Interage com um objeto Utilizando um item\n")
    typewriter(Fore.RED+"passar pela 'Conexão'"+Style.RESET_ALL+" - Passa pela conexão\n")
    typewriter(Fore.WHITE+"olhar em volta"+Style.RESET_ALL+" - Olha em volta\n")
    typewriter(Fore.CYAN+"ajuda"+Style.RESET_ALL+" - Exibe os comandos\n")
    typewriter(Fore.BLUE+" "+Style.RESET_ALL+" - Ao não digitar nada e apenas dar enter, Se algum dos menus de inventario ou viagem rapida estiverem abertos, eles serão fechados\n")
    typewriter(Fore.YELLOW+"exit"+Style.RESET_ALL+" - Sai do jogo\n\n")

    typewriter("\n\nPressione enter para continuar...")
    input()
    clear()

def game_intro(pname):
    headline("Bem-vindo ao jogo OneShot")
    typewriter("\n\nPressione enter para inicar o jogo...")
    input()
    clear()
    help()