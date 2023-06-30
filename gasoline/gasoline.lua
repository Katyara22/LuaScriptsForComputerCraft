os.loadAPI("api/button.lua");

local monitor = peripheral.wrap("left");

button.setMonitor(monitor);

local runnig = true;

local hasWorkBtn = {
    gasoline = false;
    plus = false;
    minus = false;
}

local Buttons = {
    gasolineBtn = button.create("Craft gasoline");
    minusBtn = button.create("<");
    plusTimeBtn = button.create(">");
}

local timeoutMinutes = 0;

local function calcTime(minutes)
    if minutes <= 60 then
        if minutes == 0 then
            return nil;
        elseif minutes == 1 then
            return 60;
        else
            return 60 * minutes;
        end;
    end;

    return nil;
end;

Buttons.gasolineBtn.setPos(2, 2);
Buttons.minusBtn.setPos(2, 4);
Buttons.plusTimeBtn.setPos(8, 4);

Buttons.gasolineBtn.setColor(colors.red);
Buttons.minusBtn.setColor(colors.black);
Buttons.plusTimeBtn.setColor(colors.black);

Buttons.minusBtn.setTextColor(colors.white);
Buttons.plusTimeBtn.setTextColor(colors.white);

Buttons.gasolineBtn.onClick(function()
    if hasWorkBtn.gasoline == true then
        hasWorkBtn.gasoline = false;
        Buttons.gasolineBtn.setColor(colors.red);

        local time = calcTime(timeoutMinutes);
        
        if time ~= nil then
            Buttons.gasolineBtn.setColor(colors.green);
            redstone.setOutput("back", true);
            print("start");
            
            print(time);

            sleep(time);

            print("end");
            redstone.setOutput("back", false);
            Buttons.gasolineBtn.setColor(colors.red);
        end;

    elseif hasWorkBtn.gasoline == false then
        hasWorkBtn.gasoline = true;
        Buttons.gasolineBtn.setColor(colors.green);
    end;
end);

Buttons.minusBtn.onClick(function()
    if hasWorkBtn.gasoline == false then
        if timeoutMinutes > 0 then
            timeoutMinutes = timeoutMinutes - 1;
        end;
    elseif hasWorkBtn.gasoline == true then
        print("craft gasoline");
    end;
end);

Buttons.plusTimeBtn.onClick(function()
    if hasWorkBtn.gasoline == false then
        timeoutMinutes =  timeoutMinutes + 1;
    elseif hasWorkBtn.gasoline == true then
        print("craft gasoline");
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

    button.await(
        Buttons.gasolineBtn,
        Buttons.minusBtn,
        Buttons.plusTimeBtn
    );
end;
