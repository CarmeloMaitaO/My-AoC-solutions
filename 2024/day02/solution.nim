import "fetch.nim"
import "parse.nim"
import std/[
  httpclient,
  strutils,
  algorithm,
  sequtils
]

proc safety(row: seq[int]): bool =
  let sorted = row.isSorted(order = Ascending) or row.isSorted(order = Descending)
  var aux1: int
  var condition1: bool
  var aux2: int
  var condition2: bool
  for index, element in row:
    if index == 0:
      aux1 = abs(element - row[index+1])
      condition1 = (aux1 >= 1 and aux1 <= 3)
      if not condition1:
        return false
    elif index == row.len()-1:
      aux2 = abs(element - row[index-1])
      condition2 = (aux2 >= 1 and aux2 <= 3)
      if not condition2:
        return false
    else:
      aux1 = abs(element - row[index-1])
      condition1 = (aux1 >= 1 and aux1 <= 3)
      aux2 = abs(element - row[index+1])
      condition2 = (aux2 >= 1 and aux2 <= 3)
      if (not condition1) or (not condition2):
        return false
  return sorted

proc safety2(row: seq[int], element: int): bool =
  var aux: seq[int]
  if element == 0:
    aux = row[1..(row.len()-1)]
  elif element == (row.len()-1):
    aux = row[0..(row.len-2)]
  else:
    aux = concat(row[0..(element-1)], row[(element+1)..(row.len()-1)])
  return safety(aux)

echo parseText()
var session = getSession()
let input = parseInput()
var a1: int = 0
var a2: int = 0
for index, row in input:
  if safety(row):
    a1 += 1
  for i in 0 .. (row.len()-1):
   if safety2(row, i):
     a2 += 1
     break


echo "Part 1: ", a1
echo "Part 2: ", a2
