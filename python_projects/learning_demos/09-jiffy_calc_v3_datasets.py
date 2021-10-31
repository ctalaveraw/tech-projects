# Program that takes a "Jiffy" and converts it to different units of time.
# Stitched together by: github.com/ctalaveraw

# v3 will implement dictionaries


# Begin program

# Global variables are defined here

continue_message = str('Tap any key!\n')
terminate_program = str('exit')


# A function representing the continue message will be created.
def continue_program():
    input(continue_message)


# Functions for displaying error messages.
def zero_value_error():
    message = 'All values must be greater than zero!'
    return message


def negative_value_error():
    message = 'No negative values can be used!'
    return message


def invalid_value_error():
    message = 'The input is not a valid integer!'
    return message


def invalid_type_error():
    message = 'Improper Data Type Used'
    return message


# This block introduces the user to the program.
print('\nHello user!\n')
print('A "Jiffy" is not a joke, but a real unit of time measurement used in computing.')
print('This program will accept a "Jiffy" amount as input and convert to a new unit!')
print('Release v3.0 - using sets, lists and dictionaries.\n')
print(f'Type "{terminate_program}" at any time to {terminate_program} the program.')
continue_program()


# A function will be created, with two parameters representing the input data to be passed along.
def calc_jiffy_convert(num_of_jiffy, unit):
    convert_to_sec = (num_of_jiffy * (1 / 60))
    if unit == 'seconds':
        return f'You entered {num_of_jiffy} "Jiffy"s, which equals {convert_to_sec} seconds!'
    elif unit == 'minutes':
        return f'You entered {num_of_jiffy} "Jiffy"s, which equals {convert_to_sec / 60} minutes!'
    elif unit == 'hours':
        return f'You entered {num_of_jiffy} "Jiffy"s, which equals {(convert_to_sec / 60) / 60} hours!'
    else:
        return 'Invalid conversion unit provided! Please try again!\n'


# This will be a conditional statement in a custom function to be sure input is validated.
def validate_and_execute_calc():
    try:
        input_jiffy_value = int(jiffy_and_new_unit_dictionary["jiffy"])
        if input_jiffy_value > 0:  # Executing calculation only if inputs greater than 0
            return_jiffy = calc_jiffy_convert(input_jiffy_value, jiffy_and_new_unit_dictionary["unit"])
            print(return_jiffy)
        elif input_jiffy_value == 0:  # Catching any zero values
            zero_value_error()
        else:
            negative_value_error()  # Any other value given as input will display a generic error message
    except ValueError:  # Used to catch any invalid value conversions
        invalid_value_error()
    except TypeError:  # Used to catch any invalid type errors in actual code
        invalid_type_error()
    except IndexError:  # Used to stop errors related to list ranges
        invalid_type_error()


# This runs the program indefinitely unless "exit" is entered in as input
user_input = ""
while user_input != terminate_program:
    print('"Jiffy" will be converted to a chosen unit; acceptable units are: "seconds", "minutes", and "hours".')
    print('Acceptable format is: jiffys:unit')
    user_input = input('\nPlease enter an amount of "Jiffy"s and desired units, separated by a colon:\n')
    try:
        jiffy_and_new_unit = user_input.split(':')  # Variable will store Jiffy input and desired unit in a list
        print(f'\nThe input returned the list: {jiffy_and_new_unit}\n')
        jiffy_and_new_unit_dictionary = {"jiffy": jiffy_and_new_unit[0], "unit": jiffy_and_new_unit[1]}  # Dictionary
        print(f'The input returned the dictionary: {jiffy_and_new_unit_dictionary}\n')
        validate_and_execute_calc()
    except IndexError:  # used to prevent user inputs that are not lists
        print('\nA number of "Jiffy"s and a conversion unit must be provided!\n')

# End of program.
input(f'The program will now {terminate_program}.\n{continue_message}')
