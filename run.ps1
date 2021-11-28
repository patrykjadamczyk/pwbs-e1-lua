$PathToCd = Join-Path $PSScriptRoot "src"
cd "$PathToCd"
pwd
#$ScriptPath = Join-Path $PSScriptRoot "src/app.lua"
#echo $ScriptPath

lua "app.lua" test test2 test3