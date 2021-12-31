'''
Encode every letter into its corresponding numbered position in the alphabet.
Symbols and spaces will also be used in the input. 
'''


## A function will de defined, which holds the code to be printed to the user
print ('Hello! Please enter a letter, which will return a number value.')

def StringChallenge(strParam):
  # code goes here
    return ' '.join(str(ord(c) - 96) for c in strParam.lower() if c.isalpha())
  

# keep this function call here 
print(StringChallenge(input()))
  
