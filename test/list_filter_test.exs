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

  describe "ListFilter.string_to_integer/1" do
    test "returns int when given an int" do
      [value_1, value_2, value_3] = Enum.take_random(1..100, 3)

      response_1 = ListFilter.string_to_integer(value_1)
      response_2 = ListFilter.string_to_integer(value_2)
      response_3 = ListFilter.string_to_integer(value_3)

      assert [response_1, response_2, response_3] == [value_1, value_2, value_3]
    end

    test "returns an int when given a string with a number" do
      [value_1, value_2, value_3] = ["1", "2", "3"]

      response_1 = ListFilter.string_to_integer(value_1)
      response_2 = ListFilter.string_to_integer(value_2)
      response_3 = ListFilter.string_to_integer(value_3)

      assert [response_1, response_2, response_3] == [1, 2, 3]
    end

    test "returns 0 when given a string with letters/words" do
      [value_1, value_2, value_3] = ["abc", "a", "abcd"]

      response_1 = ListFilter.string_to_integer(value_1)
      response_2 = ListFilter.string_to_integer(value_2)
      response_3 = ListFilter.string_to_integer(value_3)

      assert [response_1, response_2, response_3] == [0, 0, 0]
    end
  end
end
