local config = {
	loginMessage = getConfigValue('loginMessage')
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	registerCreatureEvent(cid, "SkullAmulet")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")
	
	registerCreatureEvent(cid, "killer")
	registerCreatureEvent(cid, "Idle")

	registerCreatureEvent(cid, "attackguild")	
	registerCreatureEvent(cid, "advance")
	registerCreatureEvent(cid, "FimVip")

	registerCreatureEvent(cid, "forever amulet")
	registerCreatureEvent(cid, "SkullCheck")
	registerCreatureEvent(cid, "ReportBug")

	registerCreatureEvent(cid, "VipReceive")
	registerCreatureEvent(cid, "PlayerKill")
    if (InitArenaScript ~= 0) then
    InitArenaScript = 1
    -- make arena rooms free
        for i = 42300, 42309 do
            setGlobalStorageValue(i, 0)
            setGlobalStorageValue(i+100, 0)
        end
    end
    -- if he did not make full arena 1 he must start from zero
    if getPlayerStorageValue(cid, 42309) < 1 then
        for i = 42300, 42309 do
            setPlayerStorageValue(cid, i, 0)
        end
    end
    -- if he did not make full arena 2 he must start from zero
    if getPlayerStorageValue(cid, 42319) < 1 then
        for i = 42310, 42319 do
            setPlayerStorageValue(cid, i, 0)
        end
    end
    -- if he did not make full arena 3 he must start from zero
    if getPlayerStorageValue(cid, 42329) < 1 then
        for i = 42320, 42329 do
            setPlayerStorageValue(cid, i, 0)
        end
    end
    if getPlayerStorageValue(cid, 42355) == -1 then
        setPlayerStorageValue(cid, 42355, 0) -- did not arena level
    end
    setPlayerStorageValue(cid, 42350, 0) -- time to kick 0
    setPlayerStorageValue(cid, 42352, 0) -- is not in arena

registerCreatureEvent(cid, "dodge")
if getPlayerStorageValue(cid, 48902) == -1 then
        setPlayerStorageValue(cid, 48902, 0) 
    end
-------------- TASK SYSTEM --------------
	registerCreatureEvent(cid,"tasksystem")
	if getPlayerStorageValue(cid, 95673) < 0 then
        setPlayerStorageValue(cid, 95673, 0) 
	end
	if getPlayerStorageValue(cid, 95674) < 0 then
        setPlayerStorageValue(cid, 95674, 0) 
	end
	-----------------------------------	
	--- CRITICAL SYSTEM ----
registerCreatureEvent(cid, "critical")
if getPlayerStorageValue(cid, 48913) == -1 then
        setPlayerStorageValue(cid, 48913, 0) 
    end 

onLogin2(cid)
    
return true
end

local config = {
[9] = 401, -- [ID DA VOCATION] = Numero do outfit
[13] = 401, -- charmander
[17] = 2177, --Squirtle
[21] = 2177, --Squirtle
[25] = 2424, --Abra
[29] = 2500, -- pichu
[33] = 2223, --gastly
[37] = 2288, --machop
[41] = 2200 --bulbasaur


}


function onLogin2(cid)
if (not config[getPlayerVocation(cid)]) then
return TRUE
end

if getPlayerAccess(cid) >= 3 then
return TRUE
end

doCreatureChangeOutfit(cid, {lookType = config[getPlayerVocation(cid)]})
return TRUE
end