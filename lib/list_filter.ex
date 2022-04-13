require String
require Integer

defmodule ListFilter do
  def call(list) do
    Enum.count(list, fn x -> Integer.is_odd(string_to_integer(x)) end)
  end

  def string_to_integer(int) when is_integer(int), do: int

  def string_to_integer(my_string) do
    case Integer.parse(my_string) do
      {number, _} -> number
      :error -> 0
    end
  end
end
