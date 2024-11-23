"""
Generate SystemVerilog enums and print to stdout.
"""

import argparse
import math

parser = argparse.ArgumentParser()
parser.add_argument("--enum", type=str)

parser.add_argument("--values", type=str, nargs="+")

parser.add_argument("--indent", type=int, default=2, required=False)

parser.add_argument("--onehot", action="store_true", default=False)

args = parser.parse_args()

outer_indent = " " * args.indent
inner_indent = " " * args.indent * 2
longest_value = 0

for value in args.values:
    if len(value) > longest_value:
        longest_value = len(value)

enum_width = math.ceil(math.log2(len(args.values)))
if args.onehot:
    enum_width = len(args.values)

enum_msb = enum_width - 1

ret_arr = []
ret_arr.append(f"{outer_indent}typedef enum logic [{enum_msb}:0] {{")
for index, value in enumerate(args.values):

    # Add spaces for extra padding to make the = character line up on each line
    space_padding = " " * (longest_value - len(value))

    # Add trailing comma for all but the last value
    comma = ""
    if index != len(args.values) - 1:
        comma = ","

    # Render encoded or onehot values
    rendered_value = f"{enum_width}'d{index}"
    if args.onehot:
        rendered_value = f"{enum_width}'d{1 << index}"
    ret_arr.append(f"{inner_indent}{value}{space_padding} = {rendered_value}{comma}")

ret_arr.append(f"{outer_indent}}} {args.enum};")
print("\n".join(ret_arr))
