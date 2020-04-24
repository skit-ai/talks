"""
"""

from typing import List


def plain(x: int) -> int:
    return x + 1

def inp_cons(x: (lambda x: x > 3)) -> int:
    return x + 1

# TODO: Homework 1. Type inference.
def out_cons(x: int) -> (lambda x: x > 2):
    return x + 1

# TODO: Homework 2. Only for mathematical operations.
def all_cons(x: (lambda x: x > 3)) -> (lambda x: x > 2):
    return x + 1

# TODO: More stuff
# - Check if a function is called at the right time.
# - Shape inference for matrix operations.
# - ...


if __name__ == "__main__":
    print(inp_cons(12))
