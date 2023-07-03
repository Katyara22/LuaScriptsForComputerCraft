os.loadAPI("config.lua")

rednet.open(config.modemSide)
id, data = rednet.receive()

if id == config.serverId then
    if data.isStartProgram == true then
        shell.run("gasoline")
    elseif data.isReboot == true then
        shell.run("reboot")
    end
end
