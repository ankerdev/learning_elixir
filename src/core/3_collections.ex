# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Lists
#
# - Implemented as linked list
# - May include multiple types and non-unique values
#

list = [3.14, :pie, "Pie"]

# Accessing the length is in linear time (O(n)) and therefore it's faster to prepend than to append (concatenate)
prepending = ["π" | list]
appending = list ++ ["π"]

# Concatenation
concatenation = list ++ ["π"]

#
# List subtraction
#
# - It's safe to include missing values
# - If there are duplicate values in the list you're subtracting from, only the first occurrence gets removed
# - Uses strict comparison to match values
#

subtraction = list -- ["Pie", "π"]
list_with_duplicates = [:hello, :hello]
subtraction_truthy = list_with_duplicates -- [:hello, :hello] == []
subtraction_falsy = list_with_duplicates -- [:hello] == []
subtraction_strict_comparison_truthy = [2] -- [2]
subtraction_strict_comparison_falsy = [2] -- [2.0]

#
# Head / Tail
#
# - The head is the first element, tail is the rest of the elements
#

[head | tail] = list
head_truthy = head == hd(list)
tail_falsy = tail != tl(list)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Tuples
#
# - Stored contiguously in memory, which makes accessing length fast but modification expensive as the new tuple must be copied to memory
# - It's common for tuples to be used as a mechanism to return additional data from functions
#

tuple = {3.14, :pie, "Pie"}
truthy = File.read('nonexistent_file') == {:error, :enoent}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Keyword lists
#
# - A special list of two-element tuples whose first element is an atom; they share performance with lists.
# - Keys are atoms, ordered and do nothave to be unique
# - Mostly commonly used to pass options to functions
#

keyword_list = [foo: "bar", hello: "world"]
keyword_list_alternative_syntax = [{:foo, "bar"}, {:hello, "world"}]

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Maps
#
# - "Go-to" key-value store
# - Allows keys of any type and are unordered
# - Duplicates replace the former value
# - Updating a map returns a new map
#

whats_up = "what's up"

map = %{
  :foo => "bar",
  whats_up => :dawg,
  "hello" => "world",
  :object => %{"child_key" => :child_value},
  :amount => 10
}

map_with_only_atom_keys = %{
  primary_key: "id",
  type: :uuid,
  data: %{
    first_name: "Jonas",
    last_name: "Anker",
    age: 25
  }
}

# You can access an atom key through dot-notation
IO.puts(map_with_only_atom_keys.primary_key)
IO.puts(map_with_only_atom_keys.data.first_name)

# General update syntax for new and existing keys
map = Map.put(map, :foo, :bar)
map = Map.put(map, :baz, "baz")

# Update a value with a function
map = Map.update!(map, :amount, &(&1 - 5))
map = Map.update(map, :amount, 0, &(&1 * &1))

# Special update syntax when for existing keys
map = %{map | :foo => "bar", whats_up => "dawg"}
map_with_only_atom_keys = %{map_with_only_atom_keys | type: "uuid"}

# Update a value in a nested structure
map = put_in(map, [:object, "child_key"], "new_child_value")
map_with_only_atom_keys = put_in(map_with_only_atom_keys.data.last_name, "Jahr")

# Update a value with a function in a nested structure
map = update_in(map, [:object, "child_key"], &(&1 <> "_v2"))
map = update_in(map_with_only_atom_keys.data.age, &(&1 + 1))

# Get a value in a nested structure
map = nested_value = get_in(map_with_only_atom_keys, [:data, :first_name])
