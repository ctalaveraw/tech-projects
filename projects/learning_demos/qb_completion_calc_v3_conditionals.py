## Program to calculate completion percentage of a quarterback
## Stitched together by: gtihub.com/ctalaveraw

## v3 implements conditionals.
## This is for input validation so only values that make sense can be provided.


## A function representing the continue message will be created.
def continue_message():
    message = str('Tap any key to continue.\n')
    input(message)
## A function for displaying error messages.
def error_message():
    message = print('Invalid value!\nOnly whole numbers greater than 0 allowed!')
    print(message)

## This block introduces the user to the program.
print('\nHello user!\n')
print('\n\nWelcome to this hastily-made QB completion percentage calculator')
print('Release v3.0 - using conditionals and booleans for input validation.')
print('I hope you like American football...\n')
continue_message()
print('The code for the function will be made in the background.\n')
continue_message()




## A function will be created, with two parameters representing the input data to be passed along.
def calc_completion_percent(completion, attempt):
        completion_percentage = float((completion / attempt) * 100)
        return(f'Out of {attempt} balls, {completion} were caught, completing {completion_percentage}% of throws.')

## This will be a conditional statement in a custom function to be sure input is validated.
## the built in ".isdigit()" function checks wheter an integer value is used.
def validate_calc_completion_percent():
    if input_attempts.isdigit() and input_complete.isdigit():
        return_completion_percent = calc_completion_percent(int(input_complete), int(input_attempts))
        if input_complete == 0 or input_attempts == 0:
            error_message()
        print(return_completion_percent)
    else:
        error_message()

## Now two seperate input statements, stored in variables, will be created to store the data
input_attempts = input("Please enter the total number of attempted passes:\n")
input_complete = input("Please enter the total number of completed passes:\n")

validate_calc_completion_percent()



## End of program.
input('Press any key to exit.\n')

## FIX DIVIDE BY ZERO ERROR