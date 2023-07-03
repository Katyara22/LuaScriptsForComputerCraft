os.loadAPI("config.lua")

rednet.open(config.modemSide)
id, data = rednet.receive()

if id == config.serverId then
    if data.isStart == true then
        redstone.setOutput(config.redstoneActiveSide, true);
    elseif data.isStart == false then
        redstone.setOutput(config.redstoneActiveSide, false);
    elseif data.isReboot == true then
        shell.run("reboot")
    end
end