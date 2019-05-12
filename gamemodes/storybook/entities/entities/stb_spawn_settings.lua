-- This entity is used by mappers to set some spawn settings

AddCSLuaFile()

ENT.Type = "point"
ENT.Base = "base_point"

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
    self:SetNWInt("startingArmor",value)
  elseif key == "respawnArmor" and value ~= 0 then
    if tonumber(value) < 0 then
      value = 0
    end
    self:SetNWInt("respawnArmor", value)
  elseif key == "startingHealth" and value ~= 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    self:SetNWInt("startingHealth",value)
  elseif key == "respawnHealth" and value ~= 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    self:SetNWInt("respawnHealth",value)
  elseif key == "maxHealth" and value ~= 100 then
    if tonumber(value) <= 0 then
      value = 1
    end
    self:SetNWInt("maxHealth",value)
  elseif key == "solidPlayer" then
    if value == 0 then
      self:SetNWBool("solidPlayer", false)
    else
      self:SetNWBool("solidPlayer", true)
    end
  elseif key == "canWalk" then
    if tonumber(value) == 0 then
      self:SetNWBool("canWalk",false)
    else
      self:SetNWBool("canWalk",true)
    end
  elseif key == "canSprint" then
    if tonumber(value) == 0 then
      self:SetNWBool("canSprint",false)
    else
      self:SetNWBool("canSprint",true)
    end
  elseif key == "canZoom" then
    if tonumber(value) == 0 then
      self:SetNWBool("canZoom",false)
    else
      self:SetNWBool("canZoom",true)
    end
  elseif key == "plyModel" and value ~= "" then
    if util.IsValidModel(value) then
      util.PrecacheModel(value)
      self:SetNWString("plyModel", value)
    else
      print("INVALID PLAYER MODEL SET")
    end
  elseif key == "jumpPower" then
    self:SetNWInt("jumpPower",value)
  elseif key == "runSpeed" then
    self:SetNWInt("runSpeed",value)
  elseif key == "walkSpeed"  then
    self:SetNWInt("walkSpeed",value)
  elseif key == "flashlightAllowed" then
    if tonumber(value) == 0 then
      self:SetNWBool("flashlightAllowed",false)
    else
      self:SetNWBool("flashlightAllowed",true)
    end
  end
end

function ENT:ApplySettings()
    GAMEMODE.startingArmor      = self:GetNWInt("startingArmor", 0)
    GAMEMODE.respawnArmor       = self:GetNWInt("respawnArmor", 0)
    GAMEMODE.startingHealth     = self:GetNWInt("startingHealth", 100)
    GAMEMODE.respawnHealth      = self:GetNWInt("respawnHealth", 100)
    GAMEMODE.maxHealth          = self:GetNWInt("maxHealth", 100)
    GAMEMODE.solidPlayer        = self:GetNWBool("solidPlayer", false)
    GAMEMODE.canWalk            = self:GetNWBool("canWalk", true)
    GAMEMODE.canSprint          = self:GetNWBool("canSprint", true)
    GAMEMODE.canZoom            = self:GetNWBool("canZoom", true)
    GAMEMODE.playermodel        = self:GetNWString("plyModel", "models/player/Group03/Male_05.mdl")
    GAMEMODE.jumpPower          = self:GetNWInt("jumpPower", 160)
    GAMEMODE.runSpeed           = self:GetNWInt("runSpeed", 400)
    GAMEMODE.walkSpeed          = self:GetNWInt("walkSpeed", 200)
    GAMEMODE.flashlightAllowed  = self:GetNWBool("flashlightAllowed", true)
end