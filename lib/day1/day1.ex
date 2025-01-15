defmodule Day1 do
  def part1(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&(div(&1, 3) - 2))
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate_fuel/1)
    |> Enum.sum()
  end

  defp calculate_fuel(mass) do
    fuel = div(mass, 3) - 2

    if fuel >= 0 do
      fuel + calculate_fuel(fuel)
    else
      0
    end
  end
end
