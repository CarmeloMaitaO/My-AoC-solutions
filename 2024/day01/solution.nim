import std/[
  httpclient,
  strutils,
  algorithm,
  sequtils
]
const
  inputURL: string = "https://adventofcode.com/2024/day/1/input"
  message: string = "Please, enter your AoC session token (leave empty to use the existing input.txt file): "
  filename: string = "input.txt"

echo message

let
  session: string = "session=" & readLine(stdin)

if (session != "session="):
  writeFile(filename,
    newHttpClient(headers = newHttpHeaders({ "Cookie": session })).getContent(inputURL)
  )

var
  file = readFile(filename).splitLines()
  left = block:
    var aux: seq[int]
    for index, line in file:
      if line != "":
        aux.add(parseInt(line.split("   ")[0]))
    aux
  right = block:
    var aux: seq[int]
    for index, line in file:
      if line != "":
        aux.add(parseInt(line.split("   ")[1]))
    aux
  a1: int
  a2: int

left.sort()
right.sort()
for i in 0..(left.len()-1):
  a1 += abs(left[i] - right[i])
echo "First answer: ", a1

for i in 0..(left.len()-1):
  a2 += (left[i] * count(right, left[i]))

echo "Second answer: ", a2
