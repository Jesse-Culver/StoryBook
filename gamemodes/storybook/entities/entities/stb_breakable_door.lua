AddCSLuaFile()

ENT.Type = "point"
ENT.Base = "base_point"

-- Get passed in door entity to monitor
-- Attach network variables for being a breakable door and health
-- We actually probably want to have it do a reverse count on health by multiplying the interval by health interval
-- and if it is past that number but lower then the next then you know what interval you are on

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
  for k, v in pairs(ents.FindByName(self:GetDoor())) do
    v:SetNWBool("BreakableDoor", true)
    v:SetNWInt("DoorMaxHealth", self:GetDoorMaxHealth())
    v:SetNWInt("DoorCurrentHealth", 0)
    v:SetNWString("DoorModel", v:GetModel())
    v:SetNWInt("CurrentInterval",0)
    local doormodel = v:GetModel()
    if doormodel == "models/props_doors/doormainmetal01.mdl" then
      v:SetNWInt("NumberOfIntervals",8)
      v:SetNWInt("DoorHealthIntervals",math.floor(self:GetDoorMaxHealth()/8))
    end
  end
end