-- Changes player model color

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:KeyValue(key, value)
  if SERVER then
    if key == "Color" and value ~= "" then
      self:SetNWVector("plyColor", Vector(value))
    end
  end
end

function ENT:AcceptInput(name,activator,caller,message)
  if SERVER then
    if name == "SetPlayerColor" then
      if activator:IsValid() == false then return end
      if activator:IsPlayer()then
        activator:SetPlayerColor(Vector(self:GetNWVector("plyColor", Vector(0,0,0))))
      end
    end
    if name == "SetAllPlayerColors" then
      for k, v in pairs(player.GetAll()) do
        v:SetPlayerColor(Vector(self:GetNWVector("plyColor", Vector(0,0,0))))
      end
    end
  end
end
