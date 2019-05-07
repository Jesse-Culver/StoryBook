--Player Functions

function GM:PlayerInitialSpawn(ply)
  ply:SetArmor(GAMEMODE.startingArmor)
  ply:SetHealth(GAMEMODE.startingHealth)

  ply:SetMaxHealth(GAMEMODE.maxHealth)
  ply:SetAvoidPlayers(GAMEMODE.solidPlayer)
  ply:SetCanWalk(GAMEMODE.canWalk)
  ply:SetRunSpeed(GAMEMODE.runSpeed)
  if(GAMEMODE.canSprint == false) then
    ply:SetRunSpeed(GAMEMODE.walkSpeed)
  end
  ply:SetCanZoom(GAMEMODE.canZoom)
  ply:SetModel(GAMEMODE.playermodel)
  ply:AllowFlashlight(GAMEMODE.flashlightAllowed)
  ply:SetJumpPower(GAMEMODE.jumpPower)
  ply:SetWalkSpeed(GAMEMODE.walkSpeed)
end

function GM:PlayerSpawn(ply)
  ply:SetArmor(GAMEMODE.respawnArmor)
  ply:SetHealth(GAMEMODE.respawnHealth)

  ply:SetMaxHealth(GAMEMODE.maxHealth)
  ply:SetAvoidPlayers(GAMEMODE.solidPlayer)
  ply:SetCanWalk(GAMEMODE.canWalk)
  ply:SetRunSpeed(GAMEMODE.runSpeed)
  if(GAMEMODE.canSprint == false) then
    ply:SetRunSpeed(GAMEMODE.walkSpeed)
  end
  ply:SetCanZoom(GAMEMODE.canZoom)
  ply:SetModel(GAMEMODE.playermodel)
  ply:AllowFlashlight(GAMEMODE.flashlightAllowed)
  ply:SetJumpPower(GAMEMODE.jumpPower)
  ply:SetWalkSpeed(GAMEMODE.walkSpeed)
  ply:SetupHands()
end
