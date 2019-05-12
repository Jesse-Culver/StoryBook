-- This entity is used by mappers to enable/disable flashlight

AddCSLuaFile()

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:AcceptInput(name,activator,caller,message)
  if name == "DisablePlayersFlashlight" then
    activator:Flashlight(false)
    activator:AllowFlashlight(false)
  end
  if name == "DisableAllPlayerFlashlights" then
    for k, v in pairs(player.GetAll()) do
      v:Flashlight(false)
      v:AllowFlashlight(false)
      GAMEMODE.flashlightAllowed = false
    end
  end

  if name == "EnablePlayersFlashlight" then
    activator:Flashlight(true)
    activator:AllowFlashlight(true)
  end
  if name == "EnableAllPlayerFlashlights" then
    for k, v in pairs(player.GetAll()) do
      v:Flashlight(true)
      v:AllowFlashlight(true)
      GAMEMODE.flashlightAllowed = false
    end
  end

end