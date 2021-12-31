num = int(input('Please enter a number:'))

def StringChallenge(num):
# code goes here
    for num in range(0, 51):
        if num % 3 == 0 and num % 5 == 0:
            print("FizzBuzz")
        elif num % 5 == 0:
            print("Buzz")
        elif num % 3 == 0:
            print("Fizz")
        else:
            print(num)



# keep this function call here 
StringChallenge(num)