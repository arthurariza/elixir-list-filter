require String
require Integer

defmodule ListFilter do
  def call(list) do
    number_list = Enum.map(list, fn x -> convert_to_integer(x) end)
    Enum.count(number_list, fn x -> Integer.is_even(x) end)
  end

  defp convert_to_integer(my_string) do
    case Integer.parse(my_string) do
      {number, _} -> number
      :error -> 0
    end
  end
end
