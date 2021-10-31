## Program to calculate completion percentage of a quarterback
## Stitched together by: gtihub.com/ctalaveraw

## v4 implements error handing with try except.
## This is for input validation so only values that make sense can be provided.


## A function representing the continue message will be created.
def continue_message():
    message = str('Tap any key to continue.\n')
    input(message)
## A function for displaying error messages.
def error_message():
    message = print('Invalid value!\nOnly whole numbers greater than 0 allowed!')
    return(message)

## This block introduces the user to the program.
print('\nHello user!\n')
print('\n\nWelcome to this hastily-made QB completion percentage calculator')
print('Release v4.0 - using error handling.')
print('I hope you like American football!\n')
continue_message()

## Now two seperate input statements, stored in variables, will be created to store the data
input_attempts = input('Please enter the total number of attempted passes:\n')
input_complete = input('Please enter the total number of completed passes:\n')


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
        print('Thank you for using this QB completion % calculator!')


## Calling this function runs the program once.
validate_calc_completion_percent()



## End of program.
input('\nPress any key to exit.\n')

## Issues with this program, is that out of bounds values can be entered, such as a 300% completion percentage