$PathToCd = Join-Path $PSScriptRoot "src"
cd "$PathToCd"
lua "app.lua" test test2 test3