-- os.Args[1:] as function not needed in Lua here
function getProgramArguments(args)
    processed_args = {}
    if #args == 1 then
        return processed_args
    end
    for i=1, #args do
        processed_args[i-1] = args[i]
    end
    return processed_args
end

 -- Main function of program
function main(args)
    baner()
    local programArguments = getProgramArguments(args)
    pwbsMain(programArguments)
end
----------------------------------------------------------------
