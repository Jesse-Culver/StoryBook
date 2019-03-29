AddCSLuaFile("cl_init.lua")
AddCSLuaFile("Shared.lua")
include("shared.lua")
include("player.lua")
function GM:Initialize()
  GAMEMODE.startingArmor = 0
  GAMEMODE.respawnArmor = 0
  GAMEMODE.startingHealth = 100
  GAMEMODE.respawnHealth = 100
  GAMEMODE.maxHealth = 100
  GAMEMODE.solidPlayer = false
  GAMEMODE.canWalk = true
  GAMEMODE.canSprint = true
  GAMEMODE.canZoom = true
  GAMEMODE.playermodel = "models/player/Group03/Male_05.mdl"
  GAMEMODE.jumpPower = 160
  GAMEMODE.runSpeed = 400
  GAMEMODE.walkSpeed = 200
  GAMEMODE.flashlightAllowed = true
end
