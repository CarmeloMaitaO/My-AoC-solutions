import "fetch.nim"
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
