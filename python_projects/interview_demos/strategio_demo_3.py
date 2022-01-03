'''
Have the function ArrayChallenge(arr) take the array of numbers stored in "arr"
and determine the total number of duplicate entries.
For example if the input is "[1, 2, 2, 2, 3]" then your program should output "2"
because there are two duplicates of one of the elements.
'''

def ArrayChallenge(arr):

  # code goes here
  my_dict = {i:arr.count(i) for i in arr} # iterates over a loop to count characters and store as dictionary data type
  all_values = my_dict.values()
  max_values = max(all_values)
  if max_values >= 2:
    return(max_values)
  elif max_values < 2:
    return(0)
  else:
    return('invalid')

# keep this function call here 
print(ArrayChallenge(input()))