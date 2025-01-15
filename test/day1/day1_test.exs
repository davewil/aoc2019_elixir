defmodule Day1Test do
  use ExUnit.Case

  test "part 1" do
    assert Day1.part1("12
      14
      1969
      100756") == 34241
  end

  test "part 2" do
    assert Day1.part2("12
      14
      1969
      100756") == 51316
  end
end
