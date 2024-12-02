import "fetch.nim"
import "parse.nim"
import std/[
  httpclient,
  strutils,
  algorithm,
  sequtils
]

let s = getSession()
echo "Session: ", s
echo "Text: ", fetchText(s)
echo "Input: ", fetchInput(s)
echo parseText()
