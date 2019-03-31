-- Prints a message to player chat

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:AcceptInput(name,activator,caller,message)
  if name == "SetPlayerColor" then
    newColor = string.ToColor(message)
    if activator:IsValid() == false then
      return
    end
    if activator:IsPlayer()then
      activator:SetPlayerColor(Vector(newColor.r/255,newColor.g/255,newColor.b/255))
    end
  end
  if name == "SetAllPlayerColors" then
    newColor = string.ToColor(message)
    for k, v in pairs(player.GetAll()) do
      v:SetPlayerColor(Vector(newColor.r/255,newColor.g/255,newColor.b/255))
    end
  end
end
