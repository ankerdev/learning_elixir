# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Pattern matching
#
# - The = operator is a match operator, comparable to the equals sign in algebra
# - If a match succeeds it returns the value of the equation, otherwise it throws an error
# - If you pass a variable(s) to the left hand side of the operation, they will be assigned to the matched values
#

# Variables
x = 1
1 = x

# Lists
list = [1, 2, 3]
[1, 2, 3] = list
[1 | tail] = list
[one, two, three] = list

# Tuples
{:ok, message} = {:ok, "Success"}

#
# Pin operator
#
# - With the ^ operator, we match on the existing value rather than rebinding it
#

^x = 1
{x, ^x} = {2, 1}

key = :hello
%{^key => value} = %{:hello => "world"}

# Below, the reassignment of `greeting` only happens within the function
greeting = "Hello"

greet = fn
  ^greeting, name -> "#{greeting}, #{name}!"
  greeting, name -> "#{greeting}, #{name}..."
end

greet.("Hello", "Jonas")
greet.(:Hei, "Jonas")
IO.puts(greeting)
