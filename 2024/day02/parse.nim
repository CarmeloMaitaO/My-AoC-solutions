import std/[
  syncio,
  xmltree,
  strtabs,
  os,
  strutils,
  sequtils,
  algorithm,
  htmlparser
]
const
  inputFile: string = "input.txt"
  textFile: string = "text.txt"
  instructionsFile: string = "instructions.md"

# proc parseInput*(): x = 

proc parseText*(): string =
  let
    html: XmlNode = loadHtml(textFile).findAll("article")[0]
    md: string = html.innerText()
  return $md
