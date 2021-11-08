# A function will be created, with two parameters representing the input data to be passed along.
def calc_jiffy_convert(num_of_jiffy, unit):
    convert_to_sec = (num_of_jiffy * (1 / 60))
    if unit == 'seconds':
        return f'You entered {num_of_jiffy} "Jiffy"s, which equals {convert_to_sec} seconds!'
    elif unit == 'minutes':
        return f'You entered {num_of_jiffy} "Jiffy"s, which equals {convert_to_sec / 60} minutes!'
    elif unit == 'hours':
        return f'You entered {num_of_jiffy} "Jiffy"s, which equals {(convert_to_sec / 60) / 60} hours!'
    else:
        return 'Invalid conversion unit provided! Please try again!\n'
