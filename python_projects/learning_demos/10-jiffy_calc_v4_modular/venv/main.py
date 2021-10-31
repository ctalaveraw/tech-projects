# Program that takes a "Jiffy" and converts it to different units of time.
# Stitched together by: github.com/ctalaveraw

# v4 is a modular version of v3

import intro
import global_var
import check

# Introduction of program
intro.program_start()

# This runs the program indefinitely unless "exit" is entered in as input
user_input = ""
while user_input != global_var.terminate_program:
    print('"Jiffy" will be converted to a chosen unit; acceptable units are: "seconds", "minutes", and "hours".')
    print('Acceptable format is: jiffys:unit')
    user_input = input('\nPlease enter an amount of "Jiffy"s and desired units, separated by a colon:\n')
    try:
        jiffy_and_new_unit = user_input.split(':')  # Variable will store Jiffy input and desired unit in a list
        print(f'\nThe input returned the list: {jiffy_and_new_unit}\n')
        jiffy_and_new_unit_dictionary = {"jiffy": jiffy_and_new_unit[0], "unit": jiffy_and_new_unit[1]}  # Dictionary
        print(f'The input returned the dictionary: {jiffy_and_new_unit_dictionary}\n')
        check.validate_and_execute(jiffy_and_new_unit_dictionary)
    except IndexError:  # used to prevent user inputs that are not lists
        print('\nA number of "Jiffy"s and a conversion unit must be provided!\n')

# End of program.
input(f'The program will now {global_var.terminate_program}.\n{global_var.continue_message}')
