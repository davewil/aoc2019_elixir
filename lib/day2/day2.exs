opts = [
  headers: [
    {"cookie",
     "session=53616c7465645f5f20b4096548feec36fa6a397ef1b86cb95cfa377c0a31e39e029e89be0e732c32f9d34793f63613e80ad8e43cb97c0d62a7be893250033995"}
  ]
]

input = Req.get!("https://adventofcode.com/2019/day/2/input", opts).body

IO.puts(Day2.part1(input))
# IO.puts(Day2.part2(input))
