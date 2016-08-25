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
  elseif key == "canWalk" and value != true then
    if value == 0 then
      GAMEMODE.canWalk = false
    else
      GAMEMODE.canWalk = true
    end
  elseif key == "canSprint" and value != true then
    if value == 0 then
      GAMEMODE.canSprint = false
    else
      GAMEMODE.canSprint = true
    end
  elseif key == "canZoom" and value != true then
    if value == 0 then
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
  elseif key == "jumpPower" and value != 160 then
    GAMEMODE.jumpPower = value
--  elseif key == "npcTarget" and value != true then
--    GAMEMODE.npcTarget = value
  elseif key == "runSpeed" and value != 600 then
    GAMEMODE.runSpeed = value
  elseif key == "walkSpeed" and value != 400 then
    GAMEMODE.walkSpeed = value
  elseif key == "flashlightALlowed" and value != true then
    if value == 0 then
      GAMEMODE.flashlightALlowed = false
    else
      GAMEMODE.flashlightALlowed = true
    end
  end
end
