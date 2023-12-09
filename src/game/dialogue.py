from game.utils import *


def selectnamefromid(cur, id):
    cur.execute("SELECT CharacterType FROM Character WHERE CharacterId = %s", (id,))
    if cur.fetchone()[0] == "NPC":
        cur.execute("SELECT NpcName FROM NPC WHERE CharacterId = %s", (id,))
        return cur.fetchone()[0]
    else:
        return "Niko"


def dialogue_handler(conn, dialogue):
    dialogue_number = int(dialogue)
    cur = conn.cursor()

    cur.execute(
        "SELECT HaveChoice, DialogueText, CharacterId, NextDialogue, AllChoices FROM Dialogue WHERE DialogueId = %s",
        (dialogue_number,),
    )
    result = cur.fetchone()
    have_choice = result[0]

    if have_choice:
        result = [dialogue_number] + list(result[1:])
        dialogue_choice_handler(conn, result)
    else:
        dialogue_text = result[1]
        character_name = selectnamefromid(cur, result[2])
        next_dialogue = result[3]

        clear()
        typewriter(f"[{character_name}]\n\n")
        typewriter(dialogue_text)
        typewriter("\n\n\n\nPressione enter para continuar...")
        input()

        if next_dialogue is not None:
            dialogue_handler(conn, next_dialogue)

def dialogue_choice_handler(conn, result):
    cur = conn.cursor()
    dialogue_text = result[1]
    character_name = selectnamefromid(cur, result[2])
    next_dialogue = result[3]
    all_choices = result[4]
    cur = conn.cursor()
    cur.execute(
        "SELECT Choice, ChoiceId, NextDialogue FROM DialogueChoice WHERE DialogueId = %s",
        (result[0],),
    )
    choices = cur.fetchall()
    choices = [(i, *choice) for i, choice in enumerate(choices, start=1)]

    if all_choices:
        chosen_choices = []
        while set(chosen_choices) != set(choices):
            while True:
                clear()
                typewriter(f"[{character_name}]\n\n")
                typewriter(dialogue_text + "\n\n")
                for choice in choices:
                    typewriter(f"{choice[0]}    [{choice[1]}]\n")
                try:
                    chosen_choice = int(input("\nEscolha uma opção\n\n> "))
                    if chosen_choice not in [choice[0] for choice in choices]:
                        raise ValueError
                    break
                except ValueError:
                    clear()
                    typewriter("Opção inválida. Por favor, escolha uma opção válida.")
                    input("\n\nPressione ENTER para continuar...")

            choice_found = False
            for choice in choices:
                if choice[0] == chosen_choice:
                    if chosen_choice not in [choice[0] for choice in chosen_choices]:
                        chosen_choices.append(choice)
                        dialogue_handler(conn, choice[3])
                    else:
                        dialogue_handler(conn, choice[3])
                    choice_found = True
                    break

            if not choice_found:
                clear()
                typewriter("Opção inválida. Por favor, escolha uma opção válida.")
                input("\n\nPressione ENTER para continuar...")
        dialogue_handler(conn, next_dialogue)
    else:
        while True:
            clear()
            typewriter(f"[{character_name}]\n\n")
            typewriter(dialogue_text + "\n\n")
            for choice in choices:
                typewriter(f"{choice[0]}    [{choice[1]}]\n")
            try:
                chosen_choice = int(input("\nEscolha uma opção\n\n> "))
                if chosen_choice not in [choice[0] for choice in choices]:
                    raise ValueError
            except ValueError:
                clear()
                typewriter("Opção inválida. Por favor, escolha uma opção válida.")
                input("\n\nPressione ENTER para continuar...")
                continue

            for choice in choices:
                if choice[0] == chosen_choice:
                    dialogue_handler(conn, choice[3])
                    break
            else:
                clear()
                typewriter("Opção inválida. Por favor, escolha uma opção válida.")
                input("\n\nPressione ENTER para continuar...")
                continue
            break
        dialogue_handler(conn, next_dialogue)