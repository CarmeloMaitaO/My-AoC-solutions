import std/[
  httpclient,
  syncio
]
const
  baseURL: string = "https://adventofcode.com/2024/day"
  textURL: string = baseURL & "/2"
  inputURL: string = textURL & "/input"
  msg: string = "Please, enter your AoC session token " &
    "(Leave empty to use the existing input.txt file):"
  sessionFile: string = "session.token"
  sessionCookie: string = "session="
  inputFile: string = "input.txt"
  textFile: string = "text.txt"


proc getSession*(): string =
  var file: File
  let session: string = if file.open(sessionFile) and (readFile(sessionFile) != sessionCookie):
      readFile(sessionFile)
    else:
      echo msg
      writeFile(sessionFile, sessionCookie & readLine(stdin))
      readFile(sessionFile)
  return session

proc fetchText*(session: string = sessionCookie): bool =
  var file: File
  if file.open(textFile) and (readFile(textFile) != ""):
    return true
  elif (session != sessionCookie):
    writeFile(textFile,
      newHttpClient(headers = newHttpHeaders({ "Cookie": session })).getContent(textURL)
    )
    return true
  else:
    return false
  
proc fetchInput*(session: string = sessionCookie): bool =
  var file: File
  if file.open(inputFile) and (readFile(inputFile) != ""):
    return true
  elif (session != sessionCookie):
    writeFile(inputFile,
      newHttpClient(headers = newHttpHeaders({ "Cookie": session })).getContent(inputURL)
    )
    return true
  else:
    return false
