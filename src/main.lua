lunajson = require('lib.lunajson.lunajson')
var_export = require('lib.inspect')
-- Var Dump function based on print and inspect library
function var_dump (...)
    local arg = {...}
    local new_args = {}
    for i,v in ipairs(arg) do
        new_args[i] = var_export(v)
    end
    print(table.unpack(new_args))
end

local pwbs = {
    ["version"] = "0.9.1.0",
    ["edition"] = "E1 Lua",
    ["versionArray"] = {0, 9, 1, 0}
}


function baner()
    print("PAiP Web Build System "..pwbs["version"].." Edition "..pwbs["edition"])
end

function readJSON(filename)
    local dataFile = io.open(filename, "r")
    local data = dataFile:read("a")
    local jsonparse = lunajson.decode(data)
    --var_dump(jsonparse)
    return jsonparse
end

function execute(command)
    --print(command)
    --return ""
    return os.execute(command)
end

function pwbsMain(args)
    local JSONData = readJSON("../pwbs.json")
    for i=1, #args do
        local _arg = args[i]
        print("Executing task ".._arg)
        local command = JSONData["commands"][_arg]
        if type(command) == "string" then
            print("COMMAND:", execute(command))
        elseif type(command) == "table" then
            for j,sub_command in ipairs(command) do
                print("COMMAND:", execute(sub_command))
            end
        else
            print("Unsupported typeof task")
            print("Task type:", type(command))
            print("Task value: ", command)
        end
        print("Finished task \"".._arg.."\" ...")
    end
end

-- Main function of program
function main(args)
    baner()
    pwbsMain(args)
end