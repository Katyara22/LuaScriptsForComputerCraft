# this script for mincarft mod [computerCraft](https://www.curseforge.com/minecraft/mc-mods/computercraft)

this script is for controlling the processing of gasoline with [buildCraft](https://www.curseforge.com/minecraft/mc-mods/buildcraft),
but you can use it for other mods

this script uses [ButtonAPI](https://github.com/Siarko/ButtonApi)

### mincraft version 1.12.2

```lua
os.loadAPI("api/button.lua"); -- load API button from path api/button
-- you can not create folder api thne switch "api/button.lua" to "button.lua"

term.clear(); -- clear console
term.setCursorPos(1, 1); -- set cursor position in console

button.setMonitor(peripheral.wrap("left"));  -- selecet monitor

local runnig = true; -- runnig program
local hasWork = false; -- is has work redstone
local gasolineBtn = button.create("Craft gasoline"); -- create a button

gasolineBtn.setPos(2, 2); -- set position button
gasolineBtn.setColor(colors.red); -- set start color button

gasolineBtn.onClick(function () -- add event to button
    if hasWork == true then
        hasWork = false; -- set redstone work false
        gasolineBtn.setColor(colors.red); -- set color red
    elseif false == false then
        hasWork = true; -- set redstone work true
        gasolineBtn.setColor(colors.green); -- set color green
    end;
end);

while runnig do
    if hasWork == true then
        redstone.setOutput("back", true); -- set output true
    elseif hasWork == false then
        redstone.setOutput("back", false); -- set output false
    end;

    button.await(gasolineBtn); -- add button to monitor
end;
```

term this a apis from computerCraft

## links for download

[ComputerCraft](https://www.curseforge.com/minecraft/mc-mods/computercraft)
[BuildCraft](https://www.curseforge.com/minecraft/mc-mods/buildcraft)
[ButtonAPI](https://github.com/Siarko/ButtonApi)
