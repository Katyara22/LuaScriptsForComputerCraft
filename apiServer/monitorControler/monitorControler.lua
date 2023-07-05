os.loadAPI("../monitorControler/api/button.lua")
os.loadAPI("../monitorControler/config.lua")

local monitor = peripheral.wrap(config.monitorSide)

button.setMonitor(monitor)

local runnig = true

local hasWork = {
    gasoline = false,
    coinGenerator = false,
    coalGenerator = false,

    rebootComputerGenerator = false,
    rebootComputerGasoline = false,

    startProgramGenerator = false,
    startProgramGasoline = false,
}

local buttons = {
    gasoline = button.create(config.buttonLabel.gasoline),
    coinGenerator = button.create(config.buttonLabel.coinGenerator),
    coalGenerator = button.create(config.buttonLabel.coalGenerator),

    rebootComputerGasoline = button.create(config.buttonLabel.rebootComputer),
    rebootComputerGenerator = button.create(config.buttonLabel.rebootComputer),

    startProgramGasoline = button.create(config.buttonLabel.startProgramGasoline),
    startProgramGenerator = button.create(config.buttonLabel.startProgramGenerator),
}

-- set pos
buttons.gasoline.setPos(2, 2)
buttons.coinGenerator.setPos(2, 4)
buttons.coalGenerator.setPos(2, 6)

buttons.rebootComputerGasoline.setPos(20, 2)
buttons.rebootComputerGenerator.setPos(20, 4)

buttons.startProgramGasoline.setPos(2, 8)
buttons.startProgramGenerator.setPos(2, 10)

-- set start colors
buttons.gasoline.setColor(colors.red)
buttons.coinGenerator.setColor(colors.red)
buttons.coalGenerator.setColor(colors.red)

buttons.rebootComputerGasoline.setColor(colors.red)
buttons.rebootComputerGenerator.setColor(colors.red)

buttons.startProgramGasoline.setColor(colors.red)
buttons.startProgramGenerator.setColor(colors.red)

-- add hendler
buttons.gasoline.onClick(function()
    if hasWork.gasoline == true then
        hasWork.gasoline = false

        buttonModel.gasoline.redstoneActive = false

        buttons.gasoline.setColor(colors.green)

        postGasolin(buttonModel.gasoline)
    elseif hasWork.gasoline == false then
        hasWork.gasoline = true

        buttonModel.gasoline.redstoneActive = true

        buttons.gasoline.setColor(colors.green)

        postGasolin(buttonModel.gasoline)
    end
end)

buttons.coinGenerator.onClick(function()
    if hasWork.coinGenerator == true then
        hasWork.coinGenerator = false

        buttonModel.generator.redstoneActiveCoinGenerator = false

        buttons.coinGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    elseif hasWork.coinGenerator == false then
        hasWork.coinGenerator = true

        buttonModel.generator.redstoneActiveCoinGenerator = true

        buttons.coinGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    end
end)

buttons.coalGenerator.onClick(function()
    if hasWork.coalGenerator == true then
        hasWork.coalGenerator = false

        buttonModel.generator.redstoneActiveCoalGenerator = false

        buttons.coalGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    elseif hasWork.coalGenerator == false then
        hasWork.coalGenerator = true

        buttonModel.generator.redstoneActiveCoalGenerator = true

        buttons.coalGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    end
end)

buttons.rebootComputerGasoline.onClick(function()
    if hasWork.rebootComputerGasoline == true then
        hasWork.rebootComputerGasoline = false

        buttonModel.gasoline.isReboot = false

        buttons.rebootComputerGasoline.setColor(colors.green)

        postGasolin(buttonModel.gasoline)
    elseif hasWork.rebootComputerGasoline == false then
        hasWork.rebootComputerGasoline = true

        buttonModel.gasoline.isReboot = true

        buttons.rebootComputerGasoline.setColor(colors.green)

        postGasolin(buttonModel.gasoline)
    end
end)

buttons.rebootComputerGenerator.onClick(function()
    if hasWork.rebootComputerGenerator == true then
        hasWork.rebootComputerGenerator = false

        buttonModel.generator.isReboot = false

        buttons.rebootComputerGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    elseif hasWork.rebootComputerGenerator == false then
        hasWork.rebootComputerGenerator = true

        buttonModel.generator.isReboot = true

        buttons.rebootComputerGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    end
end)

buttons.startProgramGasoline.onClick(function()
    if hasWork.startProgramGasoline == true then
        hasWork.startProgramGasoline = false

        buttonModel.gasoline.isStartProgram = false

        buttons.startProgramGasoline.setColor(colors.green)

        postGasolin(buttonModel.gasoline)
    elseif hasWork.startProgramGasoline == false then
        hasWork.startProgramGasoline = true

        buttonModel.gasoline.isStartProgram = true

        buttons.startProgramGasoline.setColor(colors.green)

        postGasolin(buttonModel.gasoline)
    end
end)

buttons.startProgramGenerator.onClick(function()
    if hasWork.startProgramGenerator == true then
        hasWork.startProgramGenerator = false

        buttonModel.generator.isStartProgram = false

        buttons.startProgramGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    elseif hasWork.startProgramGenerator == false then
        hasWork.startProgramGenerator = true

        buttonModel.generator.isStartProgram = true

        buttons.startProgramGenerator.setColor(colors.green)

        postGenerator(buttonModel.generator)
    end
end)


while runnig do
    button.await(
        buttons.gasoline,
        buttons.coinGenerator,
        buttons.coalGenerator,
        buttons.rebootComputerGasoline,
        buttons.rebootComputerGenerator,
        buttons.startProgramGasoline,
        buttons.startProgramGenerator
    )
end
