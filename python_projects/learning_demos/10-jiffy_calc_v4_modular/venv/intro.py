import global_var


# This block introduces the user to the program.

def program_start():
    print('\nHello user!\n')
    print('A "Jiffy" is not a joke, but a real unit of time measurement used in computing.')
    print('This program will accept a "Jiffy" amount as input and convert to a new unit!')
    print('Release v3.0 - using sets, lists and dictionaries.\n')
    print(f'Type "{global_var.terminate_program}" at any time to {global_var.terminate_program} the program.')
    global_var.continue_program()
