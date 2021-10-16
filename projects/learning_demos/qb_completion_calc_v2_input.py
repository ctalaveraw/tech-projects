## Program to calculate completion percentage of a quarterback
## Stitched together by: gtihub.com/ctalaveraw

## This version has input capability


## A function representing the continue message will be created.
def continue_message():
    message = str('Tap any key to continue.\n')
    input(message)


## This block introduces the user to the program.
print('\nHello user!\n')
print('\n\nWelcome to this hastily-made QB completion percentage calculator')
print('I hope you like American football...\n')
continue_message()
print('The code for the function will be made in the background.\n')
continue_message()


## Now two seperate input statements, stored in variables, will be created to store the data

user_input_attempts = input("Please enter the total number of attempted passes:\n")
user_input_complete = input("Please enter the total number of completed passes:\n")


## A function will be created, with two parameters representing the input data to be passed along.
def calc_completion_percent(completion, attempt):
    completion_percentage = float(completion / attempt)
    return(f'The attempted pass count is {attempt} and the completion count is {completion}.\n This means a completion percentage of {completion_percentage}%.')    

## This line of code inserts the stored user input into the created function and setting the data type
## The value of the function is then stored in a new variable.
returned_value_percent = calc_completion_percent(int(user_input_complete), int(user_input_attempts))

## This created variable is then printed on screen after returning the user input.
print(returned_value_percent)

## End of program.
input('Press any key to exit.\n')

