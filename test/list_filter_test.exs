defmodule ListFilterTest do
  use ExUnit.Case

  describe "ListFilter.call/1" do
    test "when given an empty list" do
      empty_list = []

      response = ListFilter.call(empty_list)

      assert response == 0
    end

    test "when given a list with numbers" do
      numbers_list = [1, 2, 3, 4, 6]

      response = ListFilter.call(numbers_list)

      assert response == 2
    end

    test "when given a list with negative numbers" do
      negative_list = [-1, -2, -3, -4, 6]

      response = ListFilter.call(negative_list)

      assert response == 2
    end

    test "when given a list with strings" do
      strings_list = ["1", "2", "3", "4", "6"]

      response = ListFilter.call(strings_list)

      assert response == 2
    end

    test "when given a list with numbers and strings" do
      mixed_list = ["1", "2", 3, "4", "6", "a", "b", "c"]

      response = ListFilter.call(mixed_list)

      assert response == 2
    end
  end
end

# Filtre todos os elementos numéricos da lista e retorne quantos números ímpares
# existem nessa lista.

# ListFilter.call(["1", "3", "6", "43", "banana", "6", "abc"])
# > 3

# Enum.count([1,2,3, "3", "5"], fn x -> Integer.is_odd(String.to_integer(x))  end)
