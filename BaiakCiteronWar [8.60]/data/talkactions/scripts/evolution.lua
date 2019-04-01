local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
--Charmander tank
[9] = { 200, 10, 395, 18},
[10] = { 500, 11, 439, 18},
--Charmander damage
[13] = { 200, 14, 395, 18},
[14] = { 500, 15, 439, 18},

--Squirtle tank
[17] = { 200, 18, 2181, 18},
[18] = { 500, 19, 2230, 18},

--Squirtle damage
[21] = { 200, 22, 2181, 18},
[22] = { 500, 23, 2230, 18},

--Abra
[25] = { 200, 26, 2382, 18},
[26] = { 500, 27, 3244, 18},

--Pichu
[29] = { 200, 30, 2234, 18},
[30] = { 500, 31, 2225, 18},

--Gastly
[33] = { 200, 34, 2240, 18},
[34] = { 500, 35, 3246, 18},

--Machop
[37] = { 200, 38, 2283, 18},
[38] = { 500, 39, 2291, 18},

--Bulbasaur
[41] = { 200, 42, 2199, 18},
[42] = { 500, 43, 2197, 18}
}
function onSay(cid, words, param, channel)
doPlayerSay(cid, "!evoluir")
local voc = config[getPlayerVocation(cid)]
if voc then
 if getPlayerLevel(cid) >= voc[1] then
  doPlayerSetVocation(cid, voc[2])
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você Evoluiu!")
  local outfit = {lookType = voc[3]}
  doCreatureChangeOutfit(cid, outfit)
  doSendMagicEffect(getCreaturePosition(cid), voc[4])
 else
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você precisa estar no level " .. voc[1] .. " para Evoluir.")
 end
else
 doPlayerSendCancel(cid, "Você não pode Evoluir!")
end
return true
end