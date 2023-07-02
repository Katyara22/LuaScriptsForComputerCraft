-- config
local config = {
    monitorSide = "left";
    gasolineBtnLabel = "Craft gasoline";
}

os.loadAPI("api/button.lua");

local monitor = peripheral.wrap(config.monitorSide);

button.setMonitor(monitor);

local runnig = true;

local hasWorkBtn = {
    gasoline = false;
}

gasolineBtn = button.create(config.gasolineBtnLabel);

gasolineBtn.setPos(2, 2);

gasolineBtn.setColor(colors.red);

gasolineBtn.onClick(function()
    if hasWorkBtn.gasoline == true then
        hasWorkBtn.gasoline = false;
        gasolineBtn.setColor(colors.red);
    elseif hasWorkBtn.gasoline == false then
        hasWorkBtn.gasoline = true;
        gasolineBtn.setColor(colors.green);
    end;
end);

while runnig do
    if hasWorkBtn.gasoline == true then
        redstone.setOutput("back", true);
    elseif hasWorkBtn.gasoline == false then
        redstone.setOutput("back", false);
    end;

    monitor.setCursorPos(4, 4);
    monitor.write(timeoutMinutes);

    button.await(gasolineBtn);
end;