import std/os
let nimbleDir = getHomeDir() & ".nimble/bin/"
let zigcc = nimbleDir & "zigcc"

switch("define", "ssl")
switch("path", nimbleDir)
switch("define", "release")
switch("cc", "clang")
switch("clang.exe", zigcc)
switch("clang.linkerexe", zigcc)
