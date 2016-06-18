-- Execute a local command and read a single line of the output. Return this single line.
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

-- Define commands to extract information regarding the current git repositry.
local command_git_branch = "git rev-parse --abbrev-ref HEAD"
local command_git_hash = "git rev-parse HEAD"
local command_git_number = "git rev-list HEAD --count"
local command_git_short_hash = "git rev-parse --short HEAD"

-- Export the result fo these commands to global lua variables.
git_branch = execute_get_output(command_git_branch)
git_hash = execute_get_output(command_git_hash)
git_number = execute_get_output(command_git_number)
git_short_hash = execute_get_output(command_git_short_hash)
