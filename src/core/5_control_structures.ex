# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# if and unless
#
# - Defined as macros in the Kernel module (Elixir's default environment), not language constructs
# - As previously mentioned, only `false` and `nil` are falsy values
#

if String.valid?("Hello") do
  "Valid"
else
  "Invalid"
end

if "A string value" do
  "This value is always truthy"
end

# unless, same as `if !condition`
unless is_integer("hello") do
  "Not an int"
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# case
#
# - A switch statement with cases as pattern matching instances, where `_` is the default case
# - Supports guards with the use of `when`, more information about them can be found at https://hexdocs.pm/elixir/guards.html
#   • Chaining `when`s instead of `when condition or condition` can be useful, as failed guards
#

tuple = {:ok, "Hello world!"}

case tuple do
  {:ok, result} -> result
  {:error} -> "Oopsie"
  _ -> "Default"
end

pie = 3.14

case pie do
  ^pie -> "A number, not so tasty"
  pie -> "A #{pie}, tasty"
end

#
# Guards
#
#
#

case {1, 2, 3} do
  {1, x, 3} when x != 0 and x <= 2 ->
    "Will match"

  _ ->
    "Won't match"
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# cond
#
# - Used when needed to match conditions rather than values, similar to a `if` / `else if` structure in other languages
# - Unlike `case`, default condition for cond is `true`
#

cond do
  2 + 2 == 5 -> "This will be false"
  2 * 2 == 3 -> "This is also false"
  1 + 1 == 2 -> "This is true"
  true -> "If none of the above conditions were met, this would be returned"
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# with
#
# - Useful when you might use a `case` statement or situations that cannot 'cleanly' be piped together
# - Composed of the keywords, the generators and an expression
# - The expressions are executed sequentially
# - If an expression fails to match, the non-matching value will be returned
#

user = %{first_name: "Jonas", last_name: "Jahr"}

with {:ok, first} <- Map.fetch(user, :first_name),
     {:ok, last} <- Map.fetch(user, :last_name),
     do: "#{last}, #{first}"

# In this case, the expression does not match, and `:error` will be returned as that's the non-matching value return from `Map.fetch/2`
with {:ok, middle} <- Map.fetch(user, :middle_name),
     do: middle

# Here we have an example of using `with` with an `else` clause
# If an expression fails to match, the `else` clause executes
# The `else` clause provides a `case`-like pattern matching
with {:ok, first} <- Map.fetch(user, :first_name) do
  is_james_bond = fn name ->
    if name == "Jonas" do
      "Not James Bond"
    else
      "James Bond"
    end
  end

  is_james_bond.(first)
else
  :error -> "Who are you?"
  _ -> "No one"
end
