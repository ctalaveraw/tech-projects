## Program to calculate a "Jiffy", which is 1/60th of a second.
## Stitched together by: gtihub.com/ctalaveraw

## v1 is based off the QB seconds percentage v5.




## Begin program

## Global variables are defined here
continue_message = str('Tap any key!\n')
terminate_program = str('exit')
input_seconds = ''

## A function representing the continue message will be created.
def continue_program():
    input(continue_message)
## A function for displaying error messages.
def error_message():
    message = print('Invalid value provided!')
    return(message)

## This block introduces the user to the program.
print('\nHello user!\n')
print('A "Jiffy" is not a joke, but a real unit of time measurement used in computing.')
print('This program will accept seconds as input and will return the value in "Jiffy" units!')
print('Release v1.0 - Initial release.\n')
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
        if input_seconds.isdigit(): # Input have to be positive digits
            if int(input_seconds) > 0: # Executing calculation only if inputs greater than 0
                return_jiffy = calc_sec_to_jiffy(int(input_seconds))
                print(return_jiffy)
            elif (int(input_seconds) == 0): # Catching any zero values
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
        print('Seconds to Jiffy calculator has finished executing!\n')

## This runs the program indefinitly unless "exit" is typed for both inputs
while input_seconds != terminate_program:
    input_seconds = input('Please enter the number of seconds:\n')
    validate_and_execute_calc()


## End of program.
input(f'The program will now {terminate_program}.\n{continue_message}')
