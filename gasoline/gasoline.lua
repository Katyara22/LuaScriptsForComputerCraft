os.lodaAPI("config.lua")

rednet.open(config.modemSide)
id, data = rednet.receive()

if id == config.serverId then
    if data.isStart == true then
        redstone.setOutput(config.redstoneActiveSide, true);
    else
        redstone.setOutput(config.redstoneActiveSide, false);
    end
end
