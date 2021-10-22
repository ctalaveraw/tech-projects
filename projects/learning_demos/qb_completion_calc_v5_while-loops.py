## Program to calculate completion percentage of a quarterback
## Stitched together by: gtihub.com/ctalaveraw

## v5 implements while loops.
## The result of this is having the prgram run endlessly.
##
## Issues:
## - Out of bounds values can be entered, such as a 300% completion percentage
## - Exiting program still shows error message for the input.



## Begin program

## Global variables are defined here
continue_message = str('Tap any key!\n')
terminate_program = str('exit')
input_attempts = ''
input_complete = ''

## A function representing the continue message will be created.
def continue_program():
    input(continue_message)
## A function for displaying error messages.
def error_message():
    message = print('Invalid value!\nOnly whole numbers greater than 0 allowed!')
    return(message)

## This block introduces the user to the program.
print('\nHello user!\n')
print('\n\nWelcome to this hastily-made QB completion percentage calculator')
print('Release v5.0 - using while loops.')
print('I hope you like American football!\n')
print(f'Type "{terminate_program}" for both inputs at any time to {terminate_program} the program.')
continue_program()



## A function will be created, with two parameters representing the input data to be passed along.
def calc_completion_percent(completion, attempt):
        completion_percentage = float((completion / attempt) * 100)
        return(f'Out of {attempt} balls, {completion} were caught, completing {completion_percentage}% of throws.')
        

## This will be a conditional statement in a custom function to be sure input is validated.
## The built in ".isdigit()" function checks wheter positive integer value is used.
def validate_calc_completion_percent():
    try:    
        if input_attempts.isdigit() and input_complete.isdigit(): # Both inputs have to be positive digits
            if (int(input_attempts) > 0) and (int(input_complete) > 0): # Executing calculation only if both inputs greater than 0
                return_completion_percent = calc_completion_percent(int(input_attempts), int(input_complete))
                print(return_completion_percent)
            elif (int(input_attempts) == 0) or (int(input_complete) == 0): # Catching any zero values
                print('All values must be greater than 0!')
        else:
            error_message() # Any other value given as input will display a generic error message   
    except TypeError: # Used to catch any operations on unsupported objects
        print('Improper Data Typing Error')
    except ValueError: # Used to catch any invalid value conversions
        print('Improper Value Error')
    else: # If no exceptions occured, displays a success message
        print('\nSuccess!')    
    finally: # Thanks the user for running the program regardless of exception occurance
        print('QB completion % calculator has finished running!\n')

## This runs the program indefinitly unless "exit" is typed for both inputs
while (input_attempts != terminate_program) and (input_complete != terminate_program):
    input_attempts = input('Please enter the total number of attempted passes:\n')
    input_complete = input('Please enter the total number of completed passes:\n')
    validate_calc_completion_percent()


## End of program.
input(f'The program will now {terminate_program}.\n{continue_message}')
