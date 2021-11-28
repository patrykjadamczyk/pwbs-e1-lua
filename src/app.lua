-- This just makes this app work similarly to GoLang/C++ and others for simplicity
package.path = string.format("%s;%s?.lua;%s?.lua;%s?.lua", package.path, "./", "./lib/", "./lib/lunajson/")
dofile("./main.lua")

main(arg)