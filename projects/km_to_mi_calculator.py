# This program is designed to take a value from the user,
# which will represent "km"; a calculation will be done
# to convert the value to miles.

# The "kilometer" variable is declared
km = float(input("Please enter a value in km to be converted to mi: "))

# The "conversion factor" variable is declared
convert_km_to_mi = 0.621371

# The "miles" variable is declared, and the calculation is performed.
mi = km * convert_km_to_mi
# The output is shown to the user.
print('You entered %0.2f kilometers, which equals %0.2f miles' %(km,mi))