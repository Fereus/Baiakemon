local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(condition, CONDITION_PARAM_TICKS, 86400000)
addOutfitCondition(condition, 0, 71, 0, 0, 0, 0)
setCombatCondition(combat, condition)



outfit = {lookType=280}
outfit1 = {lookType=120}
outfit2 = {lookType=110}
outfit3 = {lookType=134}

outfits = {lookType=280}
outfits1 = {lookType=120}
outfits2 = {lookType=401}
outfits3 = {lookType=334}

janemba6 = {lookType=414}


gotenksssj = {lookType=24}
gotenksssj3 = {lookType=6}


gotenksgtssj = {lookType=169}
gotenksgtssj3 = {lookType=170}

shenrons1 = {lookType=198}
shenrons2 = {lookType=232}
shenrons3 = {lookType=257}
shenrons4 = {lookType=265}
shenrons5 = {lookType=332}
shenrons6 = {lookType=333}

shenronrb = {lookType=434}
shenronrb1 = {lookType=435}

c16 = {lookType=336}
c162 = {lookType=337}
c163 = {lookType=338}
c164 = {lookType=340}
c165 = {lookType=341}
c166 = {lookType=342}
c166 = {lookType=343}

r1 = {lookType=354}
r2 = {lookType=355}
r3 = {lookType=356}

r4 = {lookType=355}
r5 = {lookType=357}
r6 = {lookType=358}
r7 = {lookType=359}

kame1 = {lookType=345}
kame2 = {lookType=346}
kame3 = {lookType=347}
kame4 = {lookType=348}

kame5 = {lookType=349}
kame6 = {lookType=350}
kame7 = {lookType=351}
kame8 = {lookType=352}

bulma1 = {lookType=416}
bulma2 = {lookType=417}
bulma3 = {lookType=418}
bulma4 = {lookType=419}

bulma5 = {lookType=425}
bulma6 = {lookType=426}
bulma7 = {lookType=420}
bulma8 = {lookType=421}
bulma9 = {lookType=422}
bulma10 = {lookType=423}

king1 = {lookType=405}
king2 = {lookType=406}
king3 = {lookType=407}
king4 = {lookType=408}

king5 = {lookType=410}
king6 = {lookType=46}
king7 = {lookType=411}
king8 = {lookType=412}
king9 = {lookType=413}

vegetto1 = {lookType=328}
vegetto2 = {lookType=329}

vegetto3 = {lookType=328}
vegetto4 = {lookType=329}
vegetto5 = {lookType=330}
vegetto6 = {lookType=331}

ext = 1000

---Janemba---
function trans(cid)
if getPlayerVocation(cid) == 304 then	
if getPlayerMana(cid) >= 0 then 
		doSendMagicEffect(getPlayerPosition(cid), 14)    
            addEvent(trans,ext,cid)

      end
   end
end

function trans(cid)
if getPlayerVocation(cid) == 377 then	
if getPlayerMana(cid) >= 0 then 
		doSendMagicEffect(getPlayerPosition(cid), 13)    
            addEvent(trans,ext,cid)

      end
   end
end

function trans(cid)
if getPlayerVocation(cid) == 392 then	
if getPlayerMana(cid) >= 0 then 
		doSendMagicEffect(getPlayerPosition(cid), 13)    
            addEvent(trans,ext,cid)

      end
   end
end

function trans1(cid)
if getPlayerVocation(cid) == 305 then	
if getPlayerMana(cid) >= 0 then	                  
            addEvent(trans1,ext,cid)
      end
   end
end

function trans1(cid)
if getPlayerVocation(cid) == 393 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 14)                      
            addEvent(trans1,ext,cid)
      end
   end
end

function trans1(cid)
if getPlayerVocation(cid) == 384 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 191)                      
            addEvent(trans1,ext,cid)
      end
   end
end

function trans2(cid)
if getPlayerVocation(cid) == 403 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 191)                      
            addEvent(trans2,ext,cid)
      end
   end
end


function trans2(cid)
if getPlayerVocation(cid) == 306 then	
if getPlayerMana(cid) >= 0 then	                  
            addEvent(trans1,ext,cid)

      end
   end
end

function trans2(cid)
if getPlayerVocation(cid) == 394 then	
if getPlayerMana(cid) >= 0 then
		doSendMagicEffect(getPlayerPosition(cid), 191)           	                  
            addEvent(trans2,ext,cid)

      end
   end
end

function trans3(cid)
if getPlayerVocation(cid) == 395 then	
if getPlayerMana(cid) >= 0 then
		doSendMagicEffect(getPlayerPosition(cid), 180)           	                  
            addEvent(trans3,ext,cid)

      end
   end
end


function trans3(cid)
if getPlayerVocation(cid) == 307 then	
if getPlayerMana(cid) >= 0 then	                   
            addEvent(trans1,ext,cid)

      end
   end
end


---End Janemba---






---Reborn Janemba---
function trans4(cid)
if getPlayerVocation(cid) == 309 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 13)     
            addEvent(trans4,ext,cid)
      end
   end
end



function trans5(cid)
if getPlayerVocation(cid) == 310 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 181)                   
            addEvent(trans5,ext,cid)
      end
   end
end


function trans6(cid)
if getPlayerVocation(cid) == 311 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 14)                       
            addEvent(trans6,ext,cid)
      end
   end
end


function trans7(cid)
if getPlayerVocation(cid) == 312 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 13)                     
            addEvent(trans7,ext,cid)

      end
   end
end

function trans7(cid)
if getPlayerVocation(cid) == 404 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 191)                     
            addEvent(trans7,ext,cid)

      end
   end
end
--- Reborn Janemba End ---


--- Gotenks ---
function fusion(cid)
if getPlayerVocation(cid) == 84 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 14)                    
            addEvent(fusion,ext,cid)
      end
   end
end

function fusion1(cid)
if getPlayerVocation(cid) == 85 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 234)                    
            addEvent(fusion1,ext,cid)
      end
   end
end

function fusionchibi(cid)
if getPlayerVocation(cid) == 317 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 14)                    
            addEvent(fusionchibi,ext,cid)
      end
   end
end

function fusionchibi2(cid)
if getPlayerVocation(cid) == 318 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 234)                    
            addEvent(fusionchibi2,ext,cid)
      end
   end
end



--- Gotenks End ---

--- Gotenks Reborn ---
function fusion2(cid)
if getPlayerVocation(cid) == 320 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 14)                    
            addEvent(fusion2,ext,cid)
      end
   end
end

function fusion3(cid)
if getPlayerVocation(cid) == 321 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 234)                    
            addEvent(fusion3,ext,cid)
      end
   end
end


function fusionchibigt(cid)
if getPlayerVocation(cid) == 323 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 14)                    
            addEvent(fusionchibigt,ext,cid)
      end
   end
end

function fusionchibigt1(cid)
if getPlayerVocation(cid) == 324 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 234)                    
            addEvent(fusionchibigt1,ext,cid)
      end
   end
end

--- Chibi Trunks Transform ---



--- Gotenks Reborn End ---

--- Shenron ---

function shenron(cid)
if getPlayerVocation(cid) == 330 then	
if getPlayerMana(cid) >= 0 then	                    
            addEvent(shenron,ext,cid)
      end
   end
end


function shenron2(cid)
if getPlayerVocation(cid) == 331 then	
if getPlayerMana(cid) >= 0 then	                     
            addEvent(shenron2,ext,cid)

      end
   end
end


function shenron3(cid)
if getPlayerVocation(cid) == 332 then	
if getPlayerMana(cid) >= 0 then	                     
            addEvent(shenron3,ext,cid)

      end
   end
end

function shenron4(cid)
if getPlayerVocation(cid) == 333 then	
if getPlayerMana(cid) >= 0 then	                     
            addEvent(shenron4,ext,cid)
      end
   end
end


function shenron5(cid)
if getPlayerVocation(cid) == 334 then	
if getPlayerMana(cid) >= 0 then	                 
            addEvent(shenron5,ext,cid)

      end
   end
end


function shenron6(cid)
if getPlayerVocation(cid) == 335 then	
if getPlayerMana(cid) >= 0 then	        
		doSendMagicEffect(getPlayerPosition(cid), 180)               
            addEvent(shenron6,ext,cid)

      end
   end
end
--- Shenron Reborn ---
function shenrongt(cid)
if getPlayerVocation(cid) == 337 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 14)                     
            addEvent(shenrongt,ext,cid)

      end
   end
end

function shenrongt1(cid)
if getPlayerVocation(cid) == 379 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 13)                     
            addEvent(shenrongt1,ext,cid)

      end
   end
end


function shenrongt2(cid)
if getPlayerVocation(cid) == 381 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 180)                     
            addEvent(shenrongt2,ext,cid)

      end
   end
end

function shenrongt3(cid)
if getPlayerVocation(cid) == 382 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 14)                     
            addEvent(shenrongt3,ext,cid)

      end
   end
end


function shenrongt4(cid)
if getPlayerVocation(cid) == 383 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 13)                     
            addEvent(shenrongt4,ext,cid)

      end
   end
end

function shenrongt(cid)
if getPlayerVocation(cid) == 384 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 191)                     
            addEvent(shenrongt,ext,cid)

      end
   end
end

function shenrongt1(cid)
if getPlayerVocation(cid) == 338 then	
if getPlayerMana(cid) >= 0 then	 
		doSendMagicEffect(getPlayerPosition(cid), 13)                     
            addEvent(shenrongt1,ext,cid)
      end
   end
end

function shenrongt1(cid)
if getPlayerVocation(cid) == 394 then	
if getPlayerMana(cid) >= 0 then	 
		doSendMagicEffect(getPlayerPosition(cid), 14)                     
            addEvent(shenrongt1,ext,cid)
      end
   end
end


function shenrongt2(cid)
if getPlayerVocation(cid) == 339 then	
if getPlayerMana(cid) >= 0 then	   
		doSendMagicEffect(getPlayerPosition(cid), 14)                   
            addEvent(shenrongt2,ext,cid)

      end
   end
end

function shenrongt2(cid)
if getPlayerVocation(cid) == 395 then	
if getPlayerMana(cid) >= 0 then	   
		doSendMagicEffect(getPlayerPosition(cid), 191)                   
            addEvent(shenrongt2,ext,cid)

      end
   end
end

function shenrongt2(cid)
if getPlayerVocation(cid) == 394 then	
if getPlayerMana(cid) >= 0 then	   
		doSendMagicEffect(getPlayerPosition(cid), 14)                   
            addEvent(shenrongt2,ext,cid)

      end
   end
end


function shenrongt3(cid)
if getPlayerVocation(cid) == 340 then	
if getPlayerMana(cid) >= 0 then	        
		doSendMagicEffect(getPlayerPosition(cid), 191)               
            addEvent(shenrongt3,ext,cid)

      end
   end
end

function shenrongt4(cid)
if getPlayerVocation(cid) == 371 then	
if getPlayerMana(cid) >= 0 then	        
		doSendMagicEffect(getPlayerPosition(cid), 180)               
            addEvent(shenrongt4,ext,cid)

      end
   end
end

--- Shenron End ---

--- c16 ---

function shenron(cid)
if getPlayerVocation(cid) == 345 then	
if getPlayerMana(cid) >= 0 then      
            addEvent(shenron,ext,cid)
      end
   end
end


function shenron2(cid)
if getPlayerVocation(cid) == 346 then	
if getPlayerMana(cid) >= 0 then	      
		doSendMagicEffect(getPlayerPosition(cid), 181)                
            addEvent(shenron2,ext,cid)

      end
   end
end


function shenron3(cid)
if getPlayerVocation(cid) == 347 then	
if getPlayerMana(cid) >= 0 then	  		           
            addEvent(shenron3,ext,cid)

      end
   end
end

--- c16 Reborn ---

function shenron(cid)
if getPlayerVocation(cid) == 349 then	
if getPlayerMana(cid) >= 0 then	         
		doSendMagicEffect(getPlayerPosition(cid), 14)             
            addEvent(shenron,ext,cid)
      end
   end
end


function shenron2(cid)
if getPlayerVocation(cid) == 350 then	
if getPlayerMana(cid) >= 0 then	      
		doSendMagicEffect(getPlayerPosition(cid), 14)                
            addEvent(shenron2,ext,cid)

      end
   end
end


function shenron3(cid)
if getPlayerVocation(cid) == 351 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 13)                     
            addEvent(shenron3,ext,cid)

      end
   end
end

function shenron4(cid)
if getPlayerVocation(cid) == 352 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 13)                     
            addEvent(shenron4,ext,cid)

      end
   end
end

--- c16 End ---

--- Kame ---

function shenron(cid)
if getPlayerVocation(cid) == 357 then	
if getPlayerMana(cid) >= 0 then	      
		doSendMagicEffect(getPlayerPosition(cid), 13)                
            addEvent(shenron,ext,cid)

      end
   end
end

--- Kame Reborn ---

function shenron2(cid)
if getPlayerVocation(cid) == 359 then	
if getPlayerMana(cid) >= 0 then	         
		doSendMagicEffect(getPlayerPosition(cid), 13)             
            addEvent(shenron2,ext,cid)
      end
   end
end


function shenron3(cid)
if getPlayerVocation(cid) == 361 then	
if getPlayerMana(cid) >= 0 then	      
		doSendMagicEffect(getPlayerPosition(cid), 180)                
            addEvent(shenron3,ext,cid)

      end
   end
end


function shenron4(cid)
if getPlayerVocation(cid) == 362 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 13)                     
            addEvent(shenron4,ext,cid)

      end
   end
end

--- Kame End ---

--- Raditz ---

function shenron(cid)
if getPlayerVocation(cid) == 365 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 234)                          
            addEvent(shenron,ext,cid)
      end
   end
end


function shenron2(cid)
if getPlayerVocation(cid) == 366 then	
if getPlayerMana(cid) >= 0 then	
		doSendMagicEffect(getPlayerPosition(cid), 14)                           
            addEvent(shenron2,ext,cid)

      end
   end
end

--- Raditz Reborn ---
function shenrongt(cid)
if getPlayerVocation(cid) == 368 then	
if getPlayerMana(cid) >= 0 then	  
		doSendMagicEffect(getPlayerPosition(cid), 234)                     
            addEvent(shenrongt,ext,cid)

      end
   end
end

function shenrongt1(cid)
if getPlayerVocation(cid) == 369 then	
if getPlayerMana(cid) >= 0 then	 
		doSendMagicEffect(getPlayerPosition(cid), 14)                     
            addEvent(shenrongt1,ext,cid)
      end
   end
end


function shenrongt2(cid)
if getPlayerVocation(cid) == 370 then	
if getPlayerMana(cid) >= 0 then	   
		doSendMagicEffect(getPlayerPosition(cid), 13)                   
            addEvent(shenrongt2,ext,cid)

      end
   end
end


function shenrongt3(cid)
if getPlayerVocation(cid) == 372 then	
if getPlayerMana(cid) >= 0 then	        
		doSendMagicEffect(getPlayerPosition(cid), 191)               
            addEvent(shenrongt3,ext,cid)

      end
   end
end
---Raditz End---

function onCastSpell(cid, var)

---Janemba---

if getPlayerVocation(cid) == 303 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,304)
         doSetCreatureOutfit(cid, outfit, -1)  
      addEvent(trans,ext,cid) 
	  	  		doSendMagicEffect(getPlayerPosition(cid), 233) 
else
doPlayerSendCancel(cid, "You need 50 level to first transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 304 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,305) 
      addEvent(trans1,ext,cid) 
	  	  	  	  		doSendMagicEffect(getPlayerPosition(cid), 33)
            doSetCreatureOutfit(cid, outfit1, -1)

else
doPlayerSendCancel(cid, "You need 100 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 305 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,306) 
      addEvent(trans2,ext,cid) 
	  		doSendMagicEffect(getPlayerPosition(cid), 18) 
            doSetCreatureOutfit(cid, outfit2, -1)

else
doPlayerSendCancel(cid, "You need 150 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end



elseif getPlayerVocation(cid) == 306 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,307) 
      addEvent(trans3,ext,cid) 
	  		doSendMagicEffect(getPlayerPosition(cid), 243)   
            doSetCreatureOutfit(cid, outfit3, -1)

else
doPlayerSendCancel(cid, "You need 200 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


--- Reborn ---

elseif getPlayerVocation(cid) == 308 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,309) 
      addEvent(trans4,ext,cid) 
	  	  		doSendMagicEffect(getPlayerPosition(cid), 7) 
            doSetCreatureOutfit(cid, outfits, -1)

else
doPlayerSendCancel(cid, "You need 50 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end



elseif getPlayerVocation(cid) == 309 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,310) 
      addEvent(trans5,ext,cid) 
	  	  	  		doSendMagicEffect(getPlayerPosition(cid), 33)   
            doSetCreatureOutfit(cid, outfits1, -1)

else
doPlayerSendCancel(cid, "You need 100 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 310 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,311) 
      addEvent(trans6,ext,cid) 
	  		doSendMagicEffect(getPlayerPosition(cid), 18) 
            doSetCreatureOutfit(cid, outfits2, -1)

else
doPlayerSendCancel(cid, "You need 150 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


elseif getPlayerVocation(cid) == 311 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,312) 
      addEvent(trans7,ext,cid) 
	  		doSendMagicEffect(getPlayerPosition(cid), 243)   
            doSetCreatureOutfit(cid, outfits3, -1)

else
doPlayerSendCancel(cid, "You need 200 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 312 then	
    if getPlayerLevel(cid) >= 400 then
      doPlayerSetVocation(cid,404) 
      addEvent(trans7,ext,cid) 
	  		doSendMagicEffect(getPlayerPosition(cid), 32)   
            doSetCreatureOutfit(cid, janemba6, -1)

else
doPlayerSendCancel(cid, "You need 400 level to next transform")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

---End Janemba? ---
--- Gotenks ---
elseif getPlayerVocation(cid) == 313 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,314) 
      addEvent(fusion,ext,cid) 
            doSetCreatureOutfit(cid, gotenksssj, -1)
     	setPlayerStorageValue(cid,20235,1)
		doSendMagicEffect(getPlayerPosition(cid), 63) 

else
doPlayerSendCancel(cid, "Gotenks! You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 314 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,315) 
      addEvent(fusion1,ext,cid) 
            doSetCreatureOutfit(cid, gotenksssj3, -1)
     	setPlayerStorageValue(cid,20235,2)
		doSendMagicEffect(getPlayerPosition(cid), 64) 

else
doPlayerSendCancel(cid, "Gotenks! You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Chibi ---

elseif getPlayerVocation(cid) == 316 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,317) 
      addEvent(fusionchibi,ext,cid) 
            doSetCreatureOutfit(cid, gotenksssj, -1)
     	setPlayerStorageValue(cid,20235,1)
		doSendMagicEffect(getPlayerPosition(cid), 63) 

else
doPlayerSendCancel(cid, "Gotenks! You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 317 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,318) 
      addEvent(fusionchibi2,ext,cid) 
            doSetCreatureOutfit(cid, gotenksssj3, -1)
     	setPlayerStorageValue(cid,20235,2)
		doSendMagicEffect(getPlayerPosition(cid), 64) 

else
doPlayerSendCancel(cid, "Gotenks! You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


--- Reborn ---
--- Goten ---

elseif getPlayerVocation(cid) == 319 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,320) 
      addEvent(fusion,ext,cid) 
            doSetCreatureOutfit(cid, gotenksgtssj, -1)
     	setPlayerStorageValue(cid,20236,3)
		doSendMagicEffect(getPlayerPosition(cid), 63) 

else
doPlayerSendCancel(cid, "Gotenks GT! You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 320 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,321) 
      addEvent(fusion1,ext,cid) 
            doSetCreatureOutfit(cid, gotenksgtssj3, -1)
     	setPlayerStorageValue(cid,20236,4)
		doSendMagicEffect(getPlayerPosition(cid), 64) 

else
doPlayerSendCancel(cid, "Gotenks GT! You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Chibi Trunks ---

elseif getPlayerVocation(cid) == 322 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,323) 
      addEvent(fusionchibigt,ext,cid) 
            doSetCreatureOutfit(cid, gotenksgtssj, -1)
     	setPlayerStorageValue(cid,20236,3)
		doSendMagicEffect(getPlayerPosition(cid), 63) 

else
doPlayerSendCancel(cid, "Gotenks GT! You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 323 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,324) 
      addEvent(fusionchibigt1,ext,cid) 
            doSetCreatureOutfit(cid, gotenksgtssj3, -1)
     	setPlayerStorageValue(cid,20236,4)
		doSendMagicEffect(getPlayerPosition(cid), 64) 

else
doPlayerSendCancel(cid, "Gotenks GT! You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end



---End Janemba and others---

--- Shenron ---

elseif getPlayerVocation(cid) == 329 then	
    if getPlayerLevel(cid) >= 30 then
      doPlayerSetVocation(cid,330) 
      addEvent(shenron,ext,cid) 
            doSetCreatureOutfit(cid, shenrons1, -1)
		doSendMagicEffect(getPlayerPosition(cid), 75) 

else
doPlayerSendCancel(cid, "Shenron, You need 30 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 330 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,331) 
      addEvent(shenron2,ext,cid) 
            doSetCreatureOutfit(cid, shenrons2, -1)
		doSendMagicEffect(getPlayerPosition(cid), 233) 

else
doPlayerSendCancel(cid, "Shenron, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 331 then	
    if getPlayerLevel(cid) >= 75 then
      doPlayerSetVocation(cid,332) 
      addEvent(shenron3,ext,cid) 
            doSetCreatureOutfit(cid, shenrons3, -1)
		doSendMagicEffect(getPlayerPosition(cid), 75) 

else
doPlayerSendCancel(cid, "Shenron, You need 75 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


elseif getPlayerVocation(cid) == 332 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,333) 
      addEvent(shenron4,ext,cid) 
            doSetCreatureOutfit(cid, shenrons4, -1)
		doSendMagicEffect(getPlayerPosition(cid), 75) 

else
doPlayerSendCancel(cid, "Shenron, You need 100 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 333 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,334) 
      addEvent(shenron5,ext,cid) 
            doSetCreatureOutfit(cid, shenrons5, -1)
		doSendMagicEffect(getPlayerPosition(cid), 233) 

else
doPlayerSendCancel(cid, "Shenron, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


--- Shenron Reborn ---

elseif getPlayerVocation(cid) == 336 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,337) 
      addEvent(shenrongt,ext,cid) 
            doSetCreatureOutfit(cid, shenronrb, -1)
		doSendMagicEffect(getPlayerPosition(cid), 75) 

else
doPlayerSendCancel(cid, "Shenron, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


elseif getPlayerVocation(cid) == 337 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,338) 
      addEvent(shenrongt1,ext,cid) 
            doSetCreatureOutfit(cid, shenronrb1, -1)
		doSendMagicEffect(getPlayerPosition(cid), 75) 

else
doPlayerSendCancel(cid, "Shenron, You need 100 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 338 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,339) 
      addEvent(shenrongt2,ext,cid) 
            doSetCreatureOutfit(cid, shenrons4, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 
doPlayerSendCancel(cid, "Success Transform.")
else
doPlayerSendCancel(cid, "Shenron, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


elseif getPlayerVocation(cid) == 339 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,340) 
      addEvent(shenrongt3,ext,cid) 
            doSetCreatureOutfit(cid, shenrons5, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Shenron, You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end


elseif getPlayerVocation(cid) == 340 then	
    if getPlayerLevel(cid) >= 400 then
      doPlayerSetVocation(cid,371) 
      addEvent(shenrongt4,ext,cid) 
            doSetCreatureOutfit(cid, shenrons6, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Shenron, You need 400 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end
--- Shenron End ---

--- c16 ---

elseif getPlayerVocation(cid) == 344 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,345) 
      addEvent(shenron,ext,cid) 
            doSetCreatureOutfit(cid, c16, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "C16, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 345 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,346) 
      addEvent(shenron2,ext,cid) 
            doSetCreatureOutfit(cid, c162, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "C16, You need 100 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 346 then	
    if getPlayerLevel(cid) >= 250 then
      doPlayerSetVocation(cid,347) 
      addEvent(shenron3,ext,cid) 
            doSetCreatureOutfit(cid, c163, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "C16, You need 250 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- c16 reborn ---

elseif getPlayerVocation(cid) == 348 then	
    if getPlayerLevel(cid) >= 75 then
      doPlayerSetVocation(cid,350) 
      addEvent(shenron,ext,cid) 
            doSetCreatureOutfit(cid, c164, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "C16, You need 75 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 350 then	
    if getPlayerLevel(cid) >= 250 then
      doPlayerSetVocation(cid,351) 
      addEvent(shenron2,ext,cid) 
            doSetCreatureOutfit(cid, c165, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "C16, You need 250 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 351 then	
    if getPlayerLevel(cid) >= 400 then
      doPlayerSetVocation(cid,352) 
      addEvent(shenron4,ext,cid) 
            doSetCreatureOutfit(cid, c166, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "C16, You need 400 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- c16 End ---

--- Raditz ---

elseif getPlayerVocation(cid) == 363 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,364) 
            doSetCreatureOutfit(cid, r1, -1)
		doSendMagicEffect(getPlayerPosition(cid), 17) 

else
doPlayerSendCancel(cid, "Raditz, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 364 then	
    if getPlayerLevel(cid) >= 120 then
      doPlayerSetVocation(cid,365) 
      addEvent(shenron,ext,cid) 
            doSetCreatureOutfit(cid, r2, -1)
		doSendMagicEffect(getPlayerPosition(cid), 45) 

else
doPlayerSendCancel(cid, "Raditz, You need 120 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 365 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,366) 
      addEvent(shenron2,ext,cid) 
            doSetCreatureOutfit(cid, r3, -1)
		doSendMagicEffect(getPlayerPosition(cid), 45) 

else
doPlayerSendCancel(cid, "Raditz, You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Raditz reborn ---

elseif getPlayerVocation(cid) == 367 then	
    if getPlayerLevel(cid) >= 75 then
      doPlayerSetVocation(cid,368) 
      addEvent(shenrongt,ext,cid)
            doSetCreatureOutfit(cid, r4, -1)
		doSendMagicEffect(getPlayerPosition(cid), 17) 

else
doPlayerSendCancel(cid, "Raditz, You need 75 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 368 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,369)
      addEvent(shenrongt1,ext,cid) 
            doSetCreatureOutfit(cid, r5, -1)
		doSendMagicEffect(getPlayerPosition(cid), 17) 

else
doPlayerSendCancel(cid, "Raditz, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 369 then	
    if getPlayerLevel(cid) >= 300 then
      doPlayerSetVocation(cid,370) 
      addEvent(shenrongt2,ext,cid) 
            doSetCreatureOutfit(cid, r6, -1)
		doSendMagicEffect(getPlayerPosition(cid), 233) 

else
doPlayerSendCancel(cid, "Raditz, You need 300 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 370 then	
    if getPlayerLevel(cid) >= 400 then
      doPlayerSetVocation(cid,372) 
      addEvent(shenrongt3,ext,cid) 
            doSetCreatureOutfit(cid, r7, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Raditz, You need 400 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Raditz End ---

--- Kame ---

elseif getPlayerVocation(cid) == 353 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,354) 
            doSetCreatureOutfit(cid, kame1, -1)
		doSendMagicEffect(getPlayerPosition(cid), 26) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 354 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,355) 
            doSetCreatureOutfit(cid, kame2, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 100 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 355 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,356) 
            doSetCreatureOutfit(cid, kame3, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 356 then	
    if getPlayerLevel(cid) >= 300 then
      doPlayerSetVocation(cid,357) 
      addEvent(shenron,ext,cid)
            doSetCreatureOutfit(cid, kame4, -1)
		doSendMagicEffect(getPlayerPosition(cid), 13) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 300 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Kame reborn ---

elseif getPlayerVocation(cid) == 358 then	
    if getPlayerLevel(cid) >= 70 then
      doPlayerSetVocation(cid,359) 
      addEvent(shenron2,ext,cid)
            doSetCreatureOutfit(cid, kame5, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 359 then	
    if getPlayerLevel(cid) >= 120 then
      doPlayerSetVocation(cid,360)
            doSetCreatureOutfit(cid, kame6, -1)
		doSendMagicEffect(getPlayerPosition(cid), 17) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 120 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 360 then	
    if getPlayerLevel(cid) >= 300 then
      doPlayerSetVocation(cid,361) 
      addEvent(shenron3,ext,cid) 
            doSetCreatureOutfit(cid, kame7, -1)
		doSendMagicEffect(getPlayerPosition(cid), 16) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 300 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 361 then	
    if getPlayerLevel(cid) >= 400 then
      doPlayerSetVocation(cid,362) 
      addEvent(shenron4,ext,cid) 
            doSetCreatureOutfit(cid, kame8, -1)
		doSendMagicEffect(getPlayerPosition(cid), 233) 

else
doPlayerSendCancel(cid, "Mestre Kame, You need 400 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Kame End ---


--- Bulma ---

elseif getPlayerVocation(cid) == 373 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,374) 
            doSetCreatureOutfit(cid, bulma1, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 374 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,375) 
            doSetCreatureOutfit(cid, bulma2, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 100 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 375 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,376) 
            doSetCreatureOutfit(cid, bulma3, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 376 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,377) 
      addEvent(trans,ext,cid) 
            doSetCreatureOutfit(cid, bulma4, -1)
		doSendMagicEffect(getPlayerPosition(cid), 13) 

else
doPlayerSendCancel(cid, "Bulma, You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Bulma reborn ---

elseif getPlayerVocation(cid) == 378 then	
    if getPlayerLevel(cid) >= 70 then
      doPlayerSetVocation(cid,379) 
      addEvent(shenrongt1,ext,cid)
            doSetCreatureOutfit(cid, bulma5, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 70 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 379 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,380)
            doSetCreatureOutfit(cid, bulma6, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 380 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,381) 
      addEvent(shenrongt2,ext,cid) 
            doSetCreatureOutfit(cid, bulma7, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 381 then	
    if getPlayerLevel(cid) >= 300 then
      doPlayerSetVocation(cid,382) 
      addEvent(shenrongt3,ext,cid) 
            doSetCreatureOutfit(cid, bulma8, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 300 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 382 then	
    if getPlayerLevel(cid) >= 400 then
      doPlayerSetVocation(cid,383) 
            doSetCreatureOutfit(cid, bulma9, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 400 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 383 then	
    if getPlayerLevel(cid) >= 500 then
      doPlayerSetVocation(cid,384) 
      addEvent(trans2,ext,cid) 
            doSetCreatureOutfit(cid, bulma10, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Bulma, You need 500 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Bulma End ---

--- Vegetto ---

elseif getPlayerVocation(cid) == 396 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,397) 
            doSetCreatureOutfit(cid, vegetto1, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Vegetto, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 397 then	
    if getPlayerLevel(cid) >= 120 then
      doPlayerSetVocation(cid,398) 
            doSetCreatureOutfit(cid, vegetto2, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Vegetto, You need 120 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Vegetto Reborn ---

elseif getPlayerVocation(cid) == 399 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,400) 
            doSetCreatureOutfit(cid, vegetto3, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Vegetto, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 400 then	
    if getPlayerLevel(cid) >= 120 then
      doPlayerSetVocation(cid,401) 
            doSetCreatureOutfit(cid, vegetto4, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Vegetto, You need 120 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 401 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,402) 
            doSetCreatureOutfit(cid, vegetto5, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Vegetto, You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 402 then	
    if getPlayerLevel(cid) >= 300 then
      doPlayerSetVocation(cid,403) 
     	 addEvent(trans1,ext,cid) 
            doSetCreatureOutfit(cid, vegetto6, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "Vegetto, You need 300 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Vegetto End ---

--- Vegeta King ---

elseif getPlayerVocation(cid) == 385 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,386) 
            doSetCreatureOutfit(cid, king1, -1)
		doSendMagicEffect(getPlayerPosition(cid), 77) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 386 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,387) 
            doSetCreatureOutfit(cid, king2, -1)
		doSendMagicEffect(getPlayerPosition(cid), 78) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 100 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 387 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,388) 
            doSetCreatureOutfit(cid, king3, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 388 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,389) 
            doSetCreatureOutfit(cid, king4, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Vegeta King Reborn ---

elseif getPlayerVocation(cid) == 390 then	
    if getPlayerLevel(cid) >= 50 then
      doPlayerSetVocation(cid,391) 
            doSetCreatureOutfit(cid, king5, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 50 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 391 then	
    if getPlayerLevel(cid) >= 100 then
      doPlayerSetVocation(cid,392) 
            doSetCreatureOutfit(cid, king6, -1)
		doSendMagicEffect(getPlayerPosition(cid), 233) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 100 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 392 then	
    if getPlayerLevel(cid) >= 150 then
      doPlayerSetVocation(cid,393) 
            doSetCreatureOutfit(cid, king7, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 150 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 393 then	
    if getPlayerLevel(cid) >= 200 then
      doPlayerSetVocation(cid,394)  
     	 addEvent(shenrongt1,ext,cid) 
            doSetCreatureOutfit(cid, king8, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 200 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

elseif getPlayerVocation(cid) == 394 then	
    if getPlayerLevel(cid) >= 400 then
      doPlayerSetVocation(cid,395) 
     	 addEvent(shenrongt2,ext,cid) 
            doSetCreatureOutfit(cid, king9, -1)
		doSendMagicEffect(getPlayerPosition(cid), 32) 

else
doPlayerSendCancel(cid, "King Vegeta, You need 400 level to transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end

--- Vegeta King End ---

else
doPlayerSendCancel(cid, "You cannot transform.")
		doSendMagicEffect(getPlayerPosition(cid), 2) 
end
end

