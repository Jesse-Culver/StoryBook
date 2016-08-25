//This entity is used by mappers to set some settings

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:KeyValue(key, value)
  if key == "startingArmor" and value != 0 then
    if tonumber(value) < 0 then
      value = 0
    end
    GAMEMODE.startingArmor = value
  elseif key == "respawnArmor" and value != 0 then
    if tonumber(value) < 0 then
      value = 0
    end
    GAMEMODE.respawnArmor = value
  elseif key == "startingHealth" and value != 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    GAMEMODE.startingHealth = value
  elseif key == "respawnHealth" and value != 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    GAMEMODE.respawnHealth = value
  elseif key == "maxHealth" and value != 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    GAMEMODE.maxHealth = value
  elseif key == "solidPlayer" then
    if value == 0 then
      GAMEMODE.solidPlayer = false
    else
      GAMEMODE.solidPlayer = true
    end
  elseif key == "canWalk" then
    if tonumber(value) == 0 then
      GAMEMODE.canWalk = false
    else
      GAMEMODE.canWalk = true
    end
  elseif key == "canSprint" then
    if tonumber(value) == 0 then
      GAMEMODE.canSprint = false
    else
      GAMEMODE.canSprint = true
    end
  elseif key == "canZoom" then
    if tonumber(value) == 0 then
      GAMEMODE.canZoom = false
    else
      GAMEMODE.canZoom = true
    end
  elseif key == "plyModel" and value != "" then
    if util.IsValidModel(value) then
      util.PrecacheModel(value)
      GAMEMODE.playermodel = value
    else
      print("INVALID PLAYER MODEL SET")
    end
  elseif key == "jumpPower" then
    GAMEMODE.jumpPower = value
--  elseif key == "npcTarget" and value != true then
--    GAMEMODE.npcTarget = value
  elseif key == "runSpeed" then
    GAMEMODE.runSpeed = value
  elseif key == "walkSpeed"  then
    GAMEMODE.walkSpeed = value
  elseif key == "flashlightAllowed" then
    if tonumber(value) == 0 then
      GAMEMODE.flashlightAllowed = false
    else
      GAMEMODE.flashlightAllowed = true
    end
  end
end
