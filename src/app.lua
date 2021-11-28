-- This just makes this app work similarly to GoLang/C++ and others for simplicity
--print(arg[0])
--local base_path = string.match(arg[0], '^(.-)[^/\\]*$')
--local lib_path = base_path.."lib\\"
--package.path = string.format("%s;%s?.lua;%s?.lua", package.path, base_path, lib_path)
package.path = string.format("%s;%s?.lua;%s?.lua;%s?.lua", package.path, "./", "./lib/", "./lib/lunajson/")
dofile("./lib/dependencies.lua")
dofile("./main.lua")

main(arg)