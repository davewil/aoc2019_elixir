defmodule Day2 do
  def part1(input) do
    input
      |> parse_input
      |> IO.inspect
      |> run_programme
  end

  # def part1(input) do
  #   input
  #   |> String.split()
  #   |> Enum.map(&String.to_integer/1)
  #   |> Enum.map(&(div(&1, 3) - 2))
  #   |> Enum.sum()
  # end

  # def part2(input) do
  #   input
  #   |> String.split()
  #   |> Enum.map(&String.to_integer/1)
  #   |> Enum.map(&calculate_fuel/1)
  #   |> Enum.sum()
  # end

  defp parse_input(input) do
    input ## "1,0,0,3"]
      |> String.replace("\n", "")
      |> String.split(",", trim: true) ## ["1", "0", "0", "3"]
      |> Enum.map(&String.to_integer/1) ## [1, 0, 0, 3]
      |> Enum.with_index(&({&2, &1})) ## [{0, 1}, {1, 0}, {2, 0}, {3, 3}]
      |> Map.new ## %{0 => 1, 1 => 0, 2 => 0, 3 => 3} -- this is a map???
  end

  defp run_programme(programme, pointer\\0) do
    case Map.fetch!(programme, pointer) do
      1 ->
        val_1 = Map.fetch!(programme, Map.fetch!(programme, pointer + 1))
        val_2 = Map.fetch!(programme, Map.fetch!(programme, pointer + 2))
        output = Map.fetch!(programme, pointer + 3)
        result = val_1 + val_2
        IO.inspect(result)
        Map.put(programme, output, val_1 + val_2)
          |> run_programme(pointer + 4)
      2 ->
        val_1 = Map.fetch!(programme, Map.fetch!(programme, pointer + 1))
        val_2 = Map.fetch!(programme, Map.fetch!(programme, pointer + 2))
        output = Map.fetch!(programme, pointer + 3)
        result = val_1 * val_2
        IO.inspect(result)
        Map.put(programme, output, val_1 * val_2)
          |> run_programme(pointer + 4)
      99 ->
        Map.fetch!(programme, 0)
    end
  end

  # defp calculate_fuel(mass) do
  #   fuel = div(mass, 3) - 2

  #   if fuel >= 0 do
  #     fuel + calculate_fuel(fuel)
  #   else
  #     0
  #   end
  # end
end
