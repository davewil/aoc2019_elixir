defmodule Day2 do
  def part1(input, set_crash_state \\ false) do
    programme =
      input
      |> parse_input

    if set_crash_state do
      programme
      |> Map.put(1, 12)
      |> Map.put(2, 2)
      |> run_programme
    else
      programme
      |> run_programme
    end
  end

  def part2(input) do
    programme = parse_input(input)

    for noun <- 0..99, verb <- 0..99 do
      ans =
        programme
        |> Map.put(1, noun)
        |> Map.put(2, verb)
        |> run_programme

      if ans == 19_690_720 do
        IO.inspect({noun, verb, 100 * noun + verb})
      end
    end
  end

  defp parse_input(input) do
    ## "1,0,0,3\n"
    input
    ## "1,0,0,3"
    |> String.replace("\n", "")
    ## ["1", "0", "0", "3"]
    |> String.split(",", trim: true)
    ## [1, 0, 0, 3]
    |> Enum.map(&String.to_integer/1)
    ## [{0, 1}, {1, 0}, {2, 0}, {3, 3}]
    |> Enum.with_index(&{&2, &1})
    ## %{0 => 1, 1 => 0, 2 => 0, 3 => 3} -- this is a map???
    |> Map.new()
  end

  defp run_programme(programme, pointer \\ 0) do
    case opcode(programme, pointer) do
      :add ->
        execute(:add, operands(programme, pointer), programme)
        |> run_programme(pointer + 4)

      :multiply ->
        execute(:multiply, operands(programme, pointer), programme)
        |> run_programme(pointer + 4)

      :halt ->
        execute(:halt, nil, programme)
    end
  end

  defp execute(:add, {val_1, val_2, output}, programme) do
    Map.put(programme, output, val_1 + val_2)
  end

  defp execute(:multiply, {val_1, val_2, output}, programme) do
    Map.put(programme, output, val_1 * val_2)
  end

  defp execute(:halt, _, programme) do
    Map.fetch!(programme, 0)
  end

  defp opcode(programme, pointer) do
    case Map.fetch!(programme, pointer) do
      1 -> :add
      2 -> :multiply
      99 -> :halt
    end
  end

  defp operands(programme, pointer) do
    {Map.fetch!(programme, Map.fetch!(programme, pointer + 1)),
     Map.fetch!(programme, Map.fetch!(programme, pointer + 2)),
     Map.fetch!(programme, pointer + 3)}
  end
end
