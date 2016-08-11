//This entity is used by mappers to set some settings

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:KeyValue(key, value)
  if key == "startingArmor" and value != 0 then
    if value < 0 then
      value = 0
    end
    GAMEMODE.startingArmor = value
  elseif key == "respawnArmor" and value != 0 then
    if value < 0 then
      value = 0
    end
    GAMEMODE.respawnArmor = value
  elseif key == "startingHealth" and value != 100 then
    if value <= 0 then
      value = 1
    end
    GAMEMODE.startingHealth = value
  elseif key == "respawnHealth" and value != 100 then
    if value <= 0 then
      value = 1
    end
    GAMEMODE.respawnHealth = value
  elseif key == "maxHealth" and value != 100 then
    if value <= 0 then
      value = 1
    end
    GAMEMODE.maxHealth = value
  elseif key == "solidPlayer" and value != false then
    GAMEMODE.solidPlayer = value
  elseif key == "canWalk" and value != true then
    GAMEMODE.canWalk = value
  elseif key == "canSprint" and value != true then
    GAMEMODE.canSprint = value
  elseif key == "canZoom" and value != true then
    GAMEMODE.canZoom = value
  elseif key == "crouchWalkModifier" and value != 0.3 then
    if value > 1 then
      value = 1
    end
    GAMEMODE.crouchWalkModifier = value
  elseif key == "plyModel" and value != "" then
    if util.IsValidModel(value) then
      util.PrecacheModel(value)
      GAMEMODE.playermodel = value
    else
      print("INVALID PLAYER MODEL SET")
    end
  elseif key == "plyHands" and value != "" then
    if util.IsValidModel(value) then
      util.PrecacheModel(value)
      GAMEMODE.handmodel = value
    else
      print("INVALID HAND MODEL SET")
    end
  elseif key == "jumpPower" and value != 200 then
    GAMEMODE.jumpPower = value
  elseif key == "npcTarget" and value != true then
    GAMEMODE.npcTarget = value
  elseif key == "runSpeed" and value != 600 then
    GAMEMODE.runSpeed = value
  elseif key == "walkSpeed" and value != 400 then
    GAMEMODE.walkSpeed = value
  elseif key == "flashlightALlowed" and value != true then
    GAMEMODE.flashlightALlowed = value
  end
end
