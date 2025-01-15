defmodule Day2Test do
  use ExUnit.Case

  test "part 1" do
    assert Day2.part1("1,9,10,3,2,3,11,0,99,30,40,50\n") == 3500
    assert Day2.part1("1,0,0,0,99") == 2
    assert Day2.part1("2,3,0,3,99") == 2
    assert Day2.part1("2,4,4,5,99,0") == 2
    assert Day2.part1("1,1,1,4,99,5,6,0,99") == 30
  end

  # test "part 2" do
  #   assert Day1.part2("12
  #     14
  #     1969
  #     100756") == 51316
  # end
end
