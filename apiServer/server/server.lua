os.loadAPI("../server/config.lua")

-- gasoline
function postGasolin(obj)
    rednet.send(computerId.gasolineId, { obj })
end

-- generator
function postGenerator(obj)
    rednet.send(computerId.generatorId, { obj })
end
