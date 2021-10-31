## Program to calculate completion percentage of a quarterback
## Stitched together by: gtihub.com/ctalaveraw

## No input by the user, but a function will be made to do the calculation

## This block introduces the user to the program.
print('\nHello ' + 'user!\n')
print('\n\nWelcome to this n00b program.\nThis program will practice variables.')
print('I hope you like American football...\n')
input('Tap a key to bare with me!\n')
print('In the background, some code will run and display some values.\n')
input('Tap any key to continue!\n')

## This block displays an example of the intended first calculation.
## Some global variables are declared
continue_message_test = str('Tap a key to go next.\n')
pass_attempt = int(60)
pass_complete = int(40)

print('In this example, a "completion percentage" will be calculated.')
print(f'Someone threw {60} passes, and completed {40} of them.\n')
input(continue_message_test)
print(f'The raw math calculation for this is "{40} / {60}".')
print('This uses one "slash" because a decimal value is needed.\n')
input(continue_message_test)
print('In the next step, the calculation will be done and the result will be shown.\n')
input(continue_message_test)

## A global variable representing the calculation will be made.
## The value will be printed onscreen. This value will always need to be a decimal.
## The data type will be "float"
completion_percentage_test = float(pass_complete / pass_attempt)

print(completion_percentage_test)
print("")
input(continue_message_test)

## This next block will display the calculation in a message.
print('The values used were stored as a "variable".\nThese can be used to make messages.')
print('The following example will use variables in its background code.\n')
input(continue_message_test)

print(f'Someone threw {pass_attempt} passes, and completed {pass_complete} of them.')
print(f"This equals a completion percentage of {completion_percentage_test}%.\n")

## Next, a function will be created to represent the completion percentage.
print('The calculation that was just created will be represented by a function.')
print('This will be done in the background.\n')
input(continue_message_test)

## This block of code will represent the created function
def completion_percent_calculation_test():
    completion_percent = float(pass_complete / pass_attempt)
    print(f'The attempted pass count is {pass_attempt} and the completion count is {pass_complete}.')
    print(f'This means a completion percentage of {completion_percent}%.')

## A seperate function representing the continue message will be created.
def continue_message():
    message = str('Tap a key to go next.\n')
    input(message)

print('Now the created function will be called.\nThe output of the function is:\n')
completion_percent_calculation_test()
print('')
continue_message()

## This block will implement parameters, so data can be plugged into the function
def completion_percent_calculation(completion, attempt):
    completion_percent = float(completion / attempt)
    print(f'The attempted pass count is {attempt} and the completion count is {completion}.')
    print(f'This means a completion percentage of {completion_percent}%.')

## This block calls the created function using the parameters provided.
print('Parameters have been implemented, so values can be passed to the function.')
print(f'In this example, {55} completed passes out of {100} attempts will be passed to it.\n')
print('The output of the function is:\n')
completion_percent_calculation(55, 100)
print('')
continue_message()

## Now different values can be tested.
print("Let's try passing values of 80 and 150, respectively.\n")
print('The output of the function is:\n')
completion_percent_calculation(80, 150)
print('\nThanks for your time testing my noobie program!')
input('Press any key to exit!\n')