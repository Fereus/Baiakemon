local config = {
    positions = {
        ["Teleports"] = {x = 419, y = 164, z = 7 },
        ["Treiners"] = {x = 421, y = 164, z = 7 },
        ["Welcome"] = {x = 415, y = 162, z = 7 },
	    ["!forjas"] = {x = 414, y = 165, z = 8 },
        ["Templo"] = {x = 185, y = 239, z = 7 },
		["Defender"] = {x = 1349, y = 1486, z = 8 }	
     
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  