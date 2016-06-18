execute_get_output = function(command)    
    -- Execute the command in a way, where we can read the output.
    f = assert(io.popen(command))
    
    -- Read the output.
    local line = f:read()
    
    -- Close the handle.
    f:close()
    
    -- Return the output.
    return line
end

local command_git = "git rev-parse --abbrev-ref HEAD"
tex.sprint("\newcommand{\git-branch}{" ... execute_get_output(command_git) ... "}")
