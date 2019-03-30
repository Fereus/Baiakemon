local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
[9] = { 30, 10, 400, 32},
[10] = { 40, 11, 261, 32},
[11] = { 50, 15, 261, 33},
[12] = { 75, 15, 261, 33},
[13] = { 100, 15, 261, 33},
[14] = { 150, 15, 261, 33},
[15] = { 180, 15, 261, 33},
[16] = { 200, 15, 261, 33},
[17] = { 40, 15, 261, 33},
[18] = { 40, 15, 261, 33},
[19] = { 40, 15, 261, 33},
[20] = { 40, 15, 261, 33},
[21] = { 40, 15, 261, 33},
[22] = { 40, 15, 261, 33},
[23] = { 40, 15, 261, 33}
}
function onSay(cid, words, param, channel)
doPlayerSay(cid, "!evoluir")
local voc = config[getPlayerVocation(cid)]
if voc then
 if getPlayerLevel(cid) >= voc[1] then
  doPlayerSetVocation(cid, voc[2])
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você Transformou!")
  local outfit = {lookType = voc[3]}
  doCreatureChangeOutfit(cid, outfit)
  doSendMagicEffect(getCreaturePosition(cid), voc[4])
 else
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você precisa estar no level " .. voc[1] .. " para transformar.")
 end
else
 doPlayerSendCancel(cid, "Você não pode se Transformar!")
end
return true
end