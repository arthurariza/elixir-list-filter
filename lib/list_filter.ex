require String
require Integer

defmodule ListFilter do
  def call(list) do
    Enum.count(remove_strings(list))
  end

  defp remove_strings(list) do
    Enum.flat_map(list, fn x ->
      case Integer.parse(x) do
        {int, _rest} -> [int]
        :error -> []
      end
    end)
  end
end
