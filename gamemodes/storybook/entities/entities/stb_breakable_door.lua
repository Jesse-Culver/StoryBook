AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"

-- Takes given door entity and replaces it with this one
-- More or less it's a prop that is parented to an invisible door
-- Takes damage and changes model

-- Known Issues:
-- Does not physically interact with props
-- Always opens the same direction regardless of where the player is standing when it is opened

-- Things that need to be done:
-- Add support for additional models
-- Add gib support
-- Get rid of reliance on prop_door_rotating, this should be it's own door entity
-- Rework KeyValue to use SetNW instead of NetweorkVar

local function UpdateDoorModel(originalDoorModel,currentInterval,target)
  if (originalDoorModel == "models/props_doors/doormainmetal01.mdl") then
    target:SetModel("models/props_doors/doormainmetal01_dm0"..currentInterval..".mdl")
  end
end

local function BreakDoorModel(originalDoorModel,currentInterval,target)
  if (originalDoorModel == "models/props_doors/doormainmetal01.mdl") then
    -- Spawn Gibs and remove
    if IsValid(target:GetNWEntity("ActualDoor", NULL)) ~= true then return end
    target:GetNWEntity("ActualDoor", NULL):Remove()
    target:Remove()
  end
end

function ENT:KeyValue(key, value)
  if SERVER then
    if key == "Door" and value ~= "" then
      self:SetDoor(value)
    elseif key == "Health" and value ~= "" then
      self:SetDoorMaxHealth(tonumber(value))
    end
  end
end

function ENT:SetupDataTables()
  if SERVER then
    self:NetworkVar("String", 0,  "Door")
    self:NetworkVar("Int",    0,  "DoorMaxHealth")
  end
end

function ENT:Initialize()
  if SERVER then
    for k, v in pairs(ents.FindByName(self:GetDoor())) do
      v:SetNoDraw(true)
      v:SetNotSolid(true)

      self:SetPos(v:GetPos())
      self:SetAngles(v:GetAngles())
      self:SetModel(v:GetModel())
      self:SetCollisionGroup(COLLISION_GROUP_PUSHAWAY)
      self:SetMoveType(MOVETYPE_VPHYSICS)
      self:PhysicsInit(SOLID_VPHYSICS)
      self:SetParent(v)
      
      self:SetUseType( SIMPLE_USE )
      v:SetUseType( SIMPLE_USE )
      
      self:SetNWEntity("ActualDoor", v)
      self:SetNWBool("BreakableDoor", true)
      self:SetNWInt("DoorMaxHealth", self:GetDoorMaxHealth())
      self:SetNWInt("DoorCurrentHealth", 0)
      self:SetNWString("DoorModel", v:GetModel())
      self:SetNWInt("CurrentInterval",0)
      local doormodel = v:GetModel()
      if doormodel == "models/props_doors/doormainmetal01.mdl" then
        self:SetNWInt("NumberOfIntervals",8)
        self:SetNWInt("DoorHealthIntervals",math.floor(self:GetDoorMaxHealth()/8))
      end
    end
  end
end

function ENT:OnTakeDamage(dmg)
  if (self:GetNWBool("BreakableDoor", false)) then
    local currentHealth = self:GetNWInt("DoorCurrentHealth")
    local newHealth = currentHealth + dmg:GetDamage()
    local maxHealth = self:GetNWInt("DoorMaxHealth")
    local healthIntervals = self:GetNWInt("DoorHealthIntervals")
    local numberOfIntervals = self:GetNWInt("NumberOfIntervals")
    local currentInterval = self:GetNWInt("CurrentInterval")
    local doormodel = self:GetNWString("DoorModel")
    self:SetNWInt("DoorCurrentHealth", newHealth)
    local notDone = true
    local nextThreshold = (currentInterval+1)*healthIntervals
    --Change model and spawn gibs
    while (notDone == true) do
      if (newHealth > nextThreshold) then
        currentInterval = currentInterval + 1
        nextThreshold = (currentInterval+1)*healthIntervals
        if (currentInterval == numberOfIntervals) then
          --it's a broken door
          notDone = false
          BreakDoorModel(doormodel,currentInterval,self)
        else
          --update model
          UpdateDoorModel(doormodel,currentInterval,self)
        end
      else
        --no longer passing the threshold so break out
        notDone = false
      end
    end
  end
end

function ENT:Use(activator, caller)
  if (IsValid(activator) ~= true) or (IsValid(caller) ~= true) then return end
  if IsValid(self:GetNWEntity("ActualDoor", NULL)) ~= true then return end
  self:GetNWEntity("ActualDoor", NULL):Fire("Toggle")
end