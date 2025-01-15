opts = [
  headers: [
    {"cookie",
     "session=53616c7465645f5f58c7b42ddd5d96d06f2ad2261d661e279f43cf9460cf5301553b90b749361cfec6b146b011d8afe966770cc2439b065c2e3954861f5a9ec3"}
  ]
]

input = Req.get!("https://adventofcode.com/2019/day/1/input", opts).body

IO.puts(Day1.part1(input))
