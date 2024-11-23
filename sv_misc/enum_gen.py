"""
Generate SystemVerilog enums and print to stdout.
"""

import argparse
import math

parser = argparse.ArgumentParser()
parser.add_argument("--enum",
                    type=str)
parser.add_argument("--values",
                    type=str,
                    nargs="+")
parser.add_argument("--indent",
                    type=int,
                    default=2,
                    required=False)
args = parser.parse_args()

outer_indent = " " * args.indent
inner_indent = " " * args.indent * 2
longest_value = 0

for value in args.values:
    if len(value) > longest_value:
        longest_value = len(value)

enum_width = math.ceil(math.log2(len(args.values)))
enum_msb = enum_width - 1

ret_arr = []
ret_arr.append(f'{outer_indent}typedef enum logic [{enum_msb}:0] {{')
for index, value in enumerate(args.values):
    space_padding = " " * (longest_value - len(value))
    comma = ""
    if (index != len(args.values) - 1):
        comma = ","
    ret_arr.append(f'{inner_indent}{value}{space_padding} = {enum_width}\'d{index}{comma}')
ret_arr.append(f'{outer_indent}}} {args.enum};')
print('\n'.join(ret_arr))
