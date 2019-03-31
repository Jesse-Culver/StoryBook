-- Prints a message to player chat

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:AcceptInput(name,activator,caller,message)
  if name == "PrintMessage" then
    PrintMessage(HUD_PRINTTALK,message)
  end
end