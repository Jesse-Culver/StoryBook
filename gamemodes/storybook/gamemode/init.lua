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

local function UpdateDoorModel(originalDoorModel,currentInterval,target)
  if (originalDoorModel == "models/props_doors/doormainmetal01.mdl") then
    target:SetModel("models/props_doors/doormainmetal01_dm0"..currentInterval..".mdl")
  end
end

local function BreakDoorModel(originalDoorModel,currentInterval,target)
  if (originalDoorModel == "models/props_doors/doormainmetal01.mdl") then
    -- Spawn Gibs and remove
    target:Remove()
  end
end

function GM:EntityTakeDamage(target, dmg)
  if (target:GetNWBool("BreakableDoor", false)) then
    local currentHealth = target:GetNWInt("DoorCurrentHealth")
    local newHealth = currentHealth + dmg:GetDamage()
    local maxHealth = target:GetNWInt("DoorMaxHealth")
    local healthIntervals = target:GetNWInt("DoorHealthIntervals")
    local numberOfIntervals = target:GetNWInt("NumberOfIntervals")
    local currentInterval = target:GetNWInt("CurrentInterval")
    local doormodel = target:GetNWString("DoorModel")
    target:SetNWInt("DoorCurrentHealth", newHealth)
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
          BreakDoorModel(doormodel,currentInterval,target)
        else
          --update model
          UpdateDoorModel(doormodel,currentInterval,target)
        end
      else
        --no longer passing the threshold so break out
        notDone = false
      end
    end

  end
end

