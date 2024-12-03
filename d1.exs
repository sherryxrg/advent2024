defmodule Advent2024.Day1 do
  @spec solve(String.t()) :: integer()
  def solve(input) do
    # needs to be parsed into 2 lists

    [list1 | list2] =
      input
      |> File.stream!()
      |> Enum.to_list()
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.split(&1, "   "))
      |> Enum.zip_reduce([], fn elems, acc -> [elems | acc] end)

    [list2] = list2

    sorted1 = Enum.map(list1, fn li -> String.to_integer(li) end) |> Enum.sort()
    sorted2 = Enum.map(list2, fn li -> String.to_integer(li) end) |> Enum.sort()

    #
    [sorted1, sorted2]
    |> Enum.zip()
    |> Enum.reduce(0, fn {l1, l2}, acc ->
      acc + abs(l1 - l2)
    end)
  end
end
