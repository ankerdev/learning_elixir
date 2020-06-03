# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Info

# - It's okay to rebind values (preferrably with a value of the same type)
# - Unused variables are prefixed with `_`
# - Functions and members have to be declared within a module
# - Private members are postfixed with `p`, e.g. `defp` and `defmacrop`
# - Functions that return a boolean are postfixed with `?` e.g. `def foo?()`
# - Functions that will handle an error by `raise`ing an error are postfixed with `!` e.g. `def bar!()`
#     • A function with the `!` symbol in its name will most likely have a counterpart that does not handle an an error by raising an error,
#       and the outcome of the function can therefore be handled with pattern matching
# - When using `if`, if you return below the clause without using else, that will always return even if the `if` statement was truthy
#     • See ex1

#
# Guards
#
# - Start with the `when` keyword followed by a boolean expression
# - Allowed in function clauses, anonymous functions (`fn`s) and `case`, `for`, `with`, `try/rescue/catch/else` and `match`
# - Custom guards can be defined with `defguard` and `defguardp`
# - If a function is used in a guard and would normally throw an exception, it will just fail the guard instead
#     • This is important to note if doing something like `def empty?(val) when map_size(val) == 0 or tuple_size(val) == 0, do: true`
#

#
# ex1
#

is_true? = fn condition ->
  if condition do
    true
  end

  # This will always return false
  false
end

is_true? = fn condition ->
  # Now works as expected
  if condition do
    true
  else
    false
  end
end

is_true? = fn condition ->
  # Using `case` is the "Elixir" way of handling it
  case condition do
    true -> true
    _ -> false
  end
end
