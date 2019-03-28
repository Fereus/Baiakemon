local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 46)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 14)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.2, 0, -1.3, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 46)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 14)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.2, 0, -1.3, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 46)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 14)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.2, 0, -1.3, 0)



local function onCastSpell1(parameters)
if isPlayer(parameters.cid) then
doCombat(parameters.cid, parameters.combat1, parameters.var)
end
end

local function onCastSpell2(parameters)
if isPlayer(parameters.cid) then
doCombat(parameters.cid, parameters.combat2, parameters.var)
end
end

local function onCastSpell3(parameters)
if isPlayer(parameters.cid) then
doCombat(parameters.cid, parameters.combat3, parameters.var)
end
end




function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 600, parameters)

end