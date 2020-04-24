"""
Usage:
  check.py <file-name>
"""

import ast
import pdb

import astor
import astpretty
from docopt import docopt


def get_input_annotation(node, arg_index=0):
    return node.args.args[arg_index].annotation

def pp(node):
    print(astpretty.pprint(node))

def check_inp_cons():
    # global vars
    provided = arg.value

    c_n = get_input_annotation(defs[1])
    c_s = astor.to_source(c_n)
    c_f = eval(c_s)

    # pdb.set_trace()

    if not c_f(provided):
        raise Exception("your code failed that test")

if __name__ == "__main__":
    args = docopt(__doc__)

    with open(args["<file-name>"]) as fp:
        tree = ast.parse(fp.read())

    defs = [tree.body[i] for i in range(2, 6)]
    usage = tree.body[-1].body[0].value.args[0]

    arg = usage.args[0]

    # pdb.set_trace()
    # TODO: Show trees and structure and general stuff

    check_inp_cons()
