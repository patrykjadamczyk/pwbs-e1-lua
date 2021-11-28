-- Imports
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

-- Information about Version
local pwbs = {
    ["version"] = "0.9.1.0",
    ["edition"] = "E1 Lua",
    ["versionArray"] = {0, 9, 1, 0}
}

-- Baner Function
function baner()
    print("PAiP Web Build System "..pwbs["version"].." Edition "..pwbs["edition"])
end

-- Function to Read JSON file into table
function readJSON(filename)
    local dataFile = io.open(filename, "r")
    local data = dataFile:read("a")
    local jsonparse = lunajson.decode(data)
    return jsonparse
end

-- Function to execute commands
function execute(command)
    return os.execute(command)
end

-- PWBS main function
function pwbsMain(args)
    -- Load data from config file
    local JSONData = readJSON("../pwbs.json")
    -- Loop through arguments of program
    for i=1, #args do
        local _arg = args[i]
        print("Executing task ".._arg)
        -- Get Data of what this task should do
        local command = JSONData["commands"][_arg]
        if type(command) == "string" then
            -- Single command tasks
            print("COMMAND:", execute(command))
        elseif type(command) == "table" then
            -- Multi command tasks
            for _,sub_command in ipairs(command) do
                print("COMMAND:", execute(sub_command))
            end
        else
            -- Other not correctly identified tasks or malformed ones
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