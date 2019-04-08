--This entity is used by mappers to set some spawn settings

AddCSLuaFile()

ENT.Type = "point"
ENT.Base = "base_point"

-- KeyValues
--local enabled = false

function ENT:AcceptInput(name,activator,caller,message)
  if name == "Apply" then
    self:ApplySettings()
  end
end

function ENT:KeyValue(key, value)
  if key == "startingArmor" and value ~= 0 then
    if tonumber(value) < 0 then
      value = 0
    end
    self:SetStartingArmor(value)
  elseif key == "respawnArmor" and value ~= 0 then
    if tonumber(value) < 0 then
      value = 0
    end
    self:SetRespawnArmor(value)
  elseif key == "startingHealth" and value ~= 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    self:SetStartingHealth(value)
  elseif key == "respawnHealth" and value ~= 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    self:SetRespawnHealth(value)
  elseif key == "maxHealth" and value ~= 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    self:SetPlyMaxHealth(value)
  elseif key == "solidPlayer" then
    if value == 0 then
      self:SetSolidPlayer(false)
    else
      self:SetSolidPlayer(true)
    end
  elseif key == "canWalk" then
    if tonumber(value) == 0 then
      self:SetPlyCanWalk(false)
    else
      self:SetPlyCanWalk(true)
    end
  elseif key == "canSprint" then
    if tonumber(value) == 0 then
      self:SetCanSprint(false)
    else
      self:SetCanSprint(true)
    end
  elseif key == "canZoom" then
    if tonumber(value) == 0 then
      self:SetPlyCanZoom(false)
    else
      self:SetPlyCanZoom(true)
    end
  elseif key == "plyModel" and value ~= "" then
    if util.IsValidModel(value) then
      util.PrecacheModel(value)
      self:SetPlyModel(value)
    else
      print("INVALID PLAYER MODEL SET")
    end
  elseif key == "jumpPower" then
    self:SetPlyJumpPower(value)
  elseif key == "runSpeed" then
    self:SetPlyRunSpeed(value)
  elseif key == "walkSpeed"  then
    self:SetPlyWalkSpeed(value)
  elseif key == "flashlightAllowed" then
    if tonumber(value) == 0 then
      self:SetFlashlightAllowed(false)
    else
      self:SetFlashlightAllowed(true)
    end
  end
end

function ENT:ApplySettings()
    GAMEMODE.startingArmor      = self:GetStartingArmor()
    GAMEMODE.respawnArmor       = self:GetRespawnArmor()
    GAMEMODE.startingHealth     = self:GetStartingHealth()
    GAMEMODE.respawnHealth      = self:GetRespawnHealth()
    GAMEMODE.maxHealth          = self:GetPlyMaxHealth()
    GAMEMODE.solidPlayer        = self:GetSolidPlayer()
    GAMEMODE.canWalk            = self:GetPlyCanWalk()
    GAMEMODE.canSprint          = self:GetCanSprint()
    GAMEMODE.canZoom            = self:GetPlyCanZoom()
    GAMEMODE.playermodel        = self:GetPlyModel()
    GAMEMODE.jumpPower          = self:GetPlyJumpPower()
    GAMEMODE.runSpeed           = self:GetPlyRunSpeed()
    GAMEMODE.walkSpeed          = self:GetPlyWalkSpeed()
    GAMEMODE.flashlightAllowed  = self:GetFlashlightAllowed()
end

function ENT:SetupDataTables()
  self:NetworkVar("Int", 0,     "StartingArmor")
  self:NetworkVar("Int", 1,     "RespawnArmor")
  self:NetworkVar("Int", 2,     "StartingHealth")
  self:NetworkVar("Int", 3,     "RespawnHealth")
  self:NetworkVar("Int", 4,     "PlyMaxHealth")
  self:NetworkVar("Int", 5,     "PlyJumpPower")
  self:NetworkVar("Int", 6,     "PlyRunSpeed")
  self:NetworkVar("Int", 7,     "PlyWalkSpeed")
  self:NetworkVar("Bool", 0,    "SolidPlayer")
  self:NetworkVar("Bool", 1,    "PlyCanWalk")
  self:NetworkVar("Bool", 2,    "CanSprint")
  self:NetworkVar("Bool", 3,    "PlyCanZoom")
  self:NetworkVar("Bool", 4,    "FlashlightAllowed")
  self:NetworkVar("String", 0,  "PlyModel")

  if SERVER then
    self:SetStartingArmor(0)
    self:SetRespawnArmor(0)
    self:SetStartingHealth(100)
    self:SetRespawnHealth(100)
    self:SetPlyMaxHealth(100)
    self:SetPlyJumpPower(160)
    self:SetPlyRunSpeed(400)
    self:SetPlyWalkSpeed(200)
    self:SetSolidPlayer(false)
    self:SetPlyCanWalk(true)
    self:SetCanSprint(true)
    self:SetPlyCanZoom(true)
    self:SetFlashlightAllowed(true)
    self:SetPlyModel("models/player/Group03/Male_05.mdl")
  end
end