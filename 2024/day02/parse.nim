import std/[
  syncio,
  xmltree,
  strtabs,
  os,
  strutils,
  sequtils,
  algorithm,
  htmlparser,
  sugar
]
const
  inputFile: string = "input.txt"
  textFile: string = "text.txt"
  instructionsFile: string = "instructions.md"

proc parseInput*(): seq[seq[int]] = 
  let file = readFile(inputFile).splitLines()
  let lines: seq[seq[int]] = block:
    var aux: seq[seq[int]]
    for index, row in file:
      aux.add(row.splitWhitespace().map(proc(x: string): int = x.parseInt()))
    aux.del(aux.len()-1)
    aux
  return lines

proc parseText*(): string =
  let
    html: XmlNode = loadHtml(textFile).findAll("article")[0]
    md: string = html.innerText()
  return $md
