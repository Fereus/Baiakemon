function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Thunder Punch")

return true
end