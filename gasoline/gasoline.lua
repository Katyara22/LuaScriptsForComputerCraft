os.loadAPI("api/button.lua");

term.clear();
term.setCursorPos(1, 1);

button.setMonitor(peripheral.wrap("left"));

local runnig = true;
local hasWork = false;
local gasolineBtn = button.create("Craft gasoline");

gasolineBtn.setPos(2, 2);
gasolineBtn.setColor(colors.red);

gasolineBtn.onClick(function ()
    if hasWork == true then
        hasWork = false;
        gasolineBtn.setColor(colors.red);
    elseif hasWork == false then
        hasWork = true;
        gasolineBtn.setColor(colors.green);
    end;
end);

while runnig do
    if hasWork == true then
        redstone.setOutput("back", true);
    elseif hasWork == false then
        redstone.setOutput("back", false);
    end;

    button.await(gasolineBtn);
end;
