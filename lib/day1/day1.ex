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
    do_calculate_fuel(mass, 0)
  end

  def do_calculate_fuel(extra_fuel, fuel) do
    new_fuel = div(extra_fuel, 3) - 2

    if new_fuel >= 0 do
      do_calculate_fuel(new_fuel, fuel + new_fuel)
    else
      fuel
    end
  end
end
