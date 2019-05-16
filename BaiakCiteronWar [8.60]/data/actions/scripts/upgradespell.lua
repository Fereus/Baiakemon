function onUse(cid, item)
if getPlayerStorageValue(cid, 32150) < 0 then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Agora seu exori está evoluído.")
setPlayerStorageValue(cid, 32150,1)
doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Voce ja evoluiu seu exori.")
end
return TRUE

end