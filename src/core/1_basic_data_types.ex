# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Integers
#

int = 255
# Binary, octal and hex are prefixed with `0<prefix>`
binary = 0b0110
octal = 0o644
hex = 0x1F

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Floats
#

float = 3.14
float_with_exponent = 1.0e-10

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Booleans
#
# - Everything in Elixir is truthy, except for `false` and `nil`
#

truthy = true
falsy = false

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Atoms
#
# - A constant whose name is its value
# - `:true` and `:false` and are atoms for their respective values, e.g. `:true === true`
# - Names of modules are also atom: `MyApp.MyModule` is a valid atom, even if it hasn't been created yet, e.g. `is_atom(MyApp.MyModule) === true`
# - Atoms are also used to reference modules from Erland libraries, including built in ones, e.g. `:crypto.strong_rand_bytes 3`
#

atom = :atom
second_atom = :"a t o m"
third_atom = String.to_atom("ah-toh-m")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Strings
#
# - UTF-8 encoded and wrapped in double quotes
# - Supports line breaks and escape characters
#

string = "Hello\nworld!"
second_string = "Hello
world"
