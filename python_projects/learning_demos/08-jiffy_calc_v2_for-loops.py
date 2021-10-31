## Program to calculate a "Jiffy", which is 1/60th of a second.
## Stitched together by: gtihub.com/ctalaveraw

## v2 will implement for loops to reuse, or "iterate" code over a given set


## Begin program

## Global variables are defined here

continue_message = str('Tap any key!\n')
terminate_program = str('exit')

## A function representing the continue message will be created.
def continue_program():
    input(continue_message)

## Functions for displaying error messages.
def zero_value_error():
    message = print('All values must be greater than zero!')
    return(message)

def negative_value_error():
    message = print('No negative values can be used!')
    return(message)

def invalid_value_error():
    message = print('The input is not a valid integer!')
    return(message)
    
def invalid_type_error():
    message = print('Improper Type Error; check code of calculation function.')
    return(message)

## This block introduces the user to the program.
print('\nHello user!\n')
print('A "Jiffy" is not a joke, but a real unit of time measurement used in computing.')
print('This program will accept seconds as input and will return the value in "Jiffy" units!')
print('Release v2.0 - using "for loops".\n')
print(f'Type "{terminate_program}" at any time to {terminate_program} the program.')
continue_program()



## A function will be created, with two parameters representing the input data to be passed along.
def calc_sec_to_jiffy(seconds):
    conversion = int(seconds / (1 / 60)) 
    return(f'You entered {seconds} seconds, which equals {conversion} "Jiffys"!')    

## This will be a conditional statement in a custom function to be sure input is validated.
## The built in ".isdigit()" function checks wheter positive integer value is used.
def validate_and_execute_calc():
    try:
        input_seconds_value = int(input_seconds_element)
        if input_seconds_value > 0: # Executing calculation only if inputs greater than 0
            return_jiffy = calc_sec_to_jiffy(input_seconds_value)
            print(return_jiffy)
            print
        elif input_seconds_value == 0: # Catching any zero values
            zero_value_error()
        else:
            negative_value_error() # Any other value given as input will display a generic error message
    except ValueError: # Used to catch any invalid value conversions
        invalid_value_error()
    except TypeError: # Used to catch any invalid type errors in actual code
        invalid_value_error()


## This runs the program indefinitly unless "exit" is entered in as input
input_seconds = ""
while input_seconds != terminate_program:
    input_seconds = input('\nPlease enter the number of seconds, separated by a comma:\n')
    list_of_seconds = input_seconds.split(',')
    print(f'The input returned the list: {list_of_seconds}')
    print(f'The input returned the set: {set(list_of_seconds)}')
    for input_seconds_element in set(input_seconds.split(',')): # A set was used vs. a list, to remove duplicate values 
        validate_and_execute_calc()


## End of program.
input(f'The program will now {terminate_program}.\n{continue_message}')
