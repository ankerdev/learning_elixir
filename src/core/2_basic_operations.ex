# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Arithmetic
#
# - Supports all basic operators [+, -, *, /]
# - Division with the `/` operator always returns a float, e.g. `10 / 5 === 2.0`
#

integer_division = div(10, 5)
# Also known as division remainder, hence the function name
modulo = rem(10, 3)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Boolean
#
# - Supports [||, &&, !]
# - Three additional operators where its first argument *must* be a boolean, e.g. Success: `true and 42`, `false or true` and `not false`, Error: `42 and true` and `not 42`
#

boolean = false || (true and not false and true)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Comparison
#
# - Elixir comes with all the comparison operators we’re used to [==, !=, ===, !==, <=, >=, <, >]
# - For strict comparison of integers and floats, use `===`, e.g. True: `2 == 2.0` False: `2 === 2.0`
# - *Any* two types can be compared in the following sort order: number < atom < reference < function < port < pid < tuple < map < list < bitstring
#

truthy_comparison = :foo > 999
falsy_comparison = {:bar, :baz} > [1, 2, 3]

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Strings
#

# Interpolation
name = "Jonas"
message = "Hello, #{name}!"

# Concatenation
message = "Hello, " <> name <> "!"
