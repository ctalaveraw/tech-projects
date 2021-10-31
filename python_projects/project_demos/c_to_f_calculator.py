# This program is designed to take a value from the user,
# which will represent a "Celsius" temperature;
# a calculation will be done to convert the value
# to Fahrenheit.

# The "Celsius" variable is declared
temp_unit_c = float(input("Please enter a Celsius temperature: "))

# The "Fahrenheit" variable is declared, using the value from Celsius
temp_unit_f = (temp_unit_c * 1.8) + 32


# The output for both temperatures is shown to the user, accurate to one decimal place.
print('You entered %0.1f Celsius, which equals %0.1f Fahrenheit' %(temp_unit_c,temp_unit_f))