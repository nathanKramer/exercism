"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME = 40

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(layers, time_per_layer=2):
    """Calculate the preparation time.

    :param layers: int - number of layers in the lasagna.
    :param time_per_layer: int - time taken to prepare a layer.
    :return: int - total preparation time (in minutes).

    Function that takes the number of layers in the lasagna and the time taken to
    prepare a layer as arguments and returns the total time taken to prepare the lasagna.
    """
    return layers * time_per_layer


def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the total elapsed time.

    :param number_of_layers: int - number of layers in the lasagna.
    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - total elapsed time (in minutes).

    Function that takes the number of layers in the lasagna and the actual minutes
    the lasagna has been in the oven as arguments and returns the total elapsed time.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
