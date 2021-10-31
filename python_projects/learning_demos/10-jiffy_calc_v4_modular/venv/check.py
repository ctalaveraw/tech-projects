import run
import error_messages


# This will be a conditional statement in a custom function to be sure input is validated.
def validate_and_execute(jiffy_and_new_unit_dictionary):
    try:
        input_jiffy_value = int(jiffy_and_new_unit_dictionary["jiffy"])
        if input_jiffy_value > 0:  # Executing calculation only if inputs greater than 0
            return_jiffy = run.calc_jiffy_convert(input_jiffy_value, jiffy_and_new_unit_dictionary["unit"])
            print(return_jiffy)
        elif input_jiffy_value == 0:  # Catching any zero values
            error_messages.zero_value()
        else:
            error_messages.negative_value()  # Any other value given as input will display a generic error message
    except ValueError:  # Used to catch any invalid value conversions
        error_messages.invalid_value()
    except TypeError:  # Used to catch any invalid type errors in actual code
        error_messages.invalid_type()
    except IndexError:  # Used to stop errors related to list ranges
        error_messages.invalid_type()
