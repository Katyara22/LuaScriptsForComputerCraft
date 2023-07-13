os.lodaAPI("config.lua")

rednet.open(config.modemSide)
id, data = rednet.receive()

if id == config.serverId then
    if data.isStartCoalGenerator == true then
        redstone.setOutput(config.redstoneActiveSideCoalGenerator, true);
    elseif data.isStartCoalGenerator == false then
        redstone.setOutput(config.redstoneActiveSideCoalGenerator, false);
    end

    if data.isStartCoinGenerator == true then
        redstone.setOutput(config.redstoneActiveSideCoinGenerator, true);
    elseif data.isStartCoinGenerator == false then
        redstone.setOutput(config.redstoneActiveSideCoinGenerator, false);
    end

    if data.isReboot == true then
        shell.run("reboot")
    end
end
