--This entity is used by mappers to make entities glow, very expensive using sparingly

AddCSLuaFile()

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:AcceptInput(name,activator,caller,message)
  if name == "TurnOn" then
    self:SetEntEnabled(true)
  elseif name == "TurnOff" then
    self:SetEntEnabled(false)
  end
end

function ENT:KeyValue(key, value)
  if SERVER then
    if key == "Entity1" and value ~= "" then
      self:SetEntity1(value)
    elseif key == "Entity2" and value ~= "" then
      self:SetEntity2(value)
    elseif key == "Entity3" and value ~= "" then
      self:SetEntity3(value)
    elseif key == "Entity4" and value ~= "" then
      self:SetEntity4(value)
    elseif key == "glowcolor" and value ~= "" then
      self:SetGlowColor(util.StringToType(value, "Vector"))
    elseif key == "BlurX" and value ~= "" then
      self:SetGlowBlurX(tonumber(value))
    elseif key == "BlurY" and value ~= "" then
      self:SetGlowBlurY(tonumber(value))
    elseif key == "IgnoreZ" and value ~= "" then
      if value == 0 then
        self:SetGlowIgnoreZ(false)
      else
        self:SetGlowIgnoreZ(true)
      end
    end
  end
end

function ENT:SetupDataTables()
  if SERVER then
    self:NetworkVar("String", 0,  "Entity1")
    self:NetworkVar("String", 1,  "Entity2")
    self:NetworkVar("String", 2,  "Entity3")
    self:NetworkVar("String", 3,  "Entity4")
    self:NetworkVar("Vector", 0,  "GlowColor")
    self:NetworkVar("Int",0,"GlowBlurX")
    self:NetworkVar("Int",1,"GlowBlurY")
    self:NetworkVar("Bool",0,"GlowIgnoreZ")
  end
end

function ENT:SetEntEnabled(value)
  if SERVER then
    if value == true then
      for k, v in pairs(ents.FindByName(self:GetEntity1())) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetGlowColor())
        v:SetNWInt("blurX", self:GetGlowBlurX())
        v:SetNWInt("blurY", self:GetGlowBlurY())
        v:SetNWBool("ignoreZ", self:GetGlowIgnoreZ())
      end
      for k, v in pairs(ents.FindByName(self:GetEntity2())) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetGlowColor())
        v:SetNWInt("blurX", self:GetGlowBlurX())
        v:SetNWInt("blurY", self:GetGlowBlurY())
        v:SetNWBool("ignoreZ", self:GetGlowIgnoreZ())
      end
      for k, v in pairs(ents.FindByName(self:GetEntity3())) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetGlowColor())
        v:SetNWInt("blurX", self:GetGlowBlurX())
        v:SetNWInt("blurY", self:GetGlowBlurY())
        v:SetNWBool("ignoreZ", self:GetGlowIgnoreZ())
      end
      for k, v in pairs(ents.FindByName(self:GetEntity4())) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetGlowColor())
        v:SetNWInt("blurX", self:GetGlowBlurX())
        v:SetNWInt("blurY", self:GetGlowBlurY())
        v:SetNWBool("ignoreZ", self:GetGlowIgnoreZ())
      end
    else
      for k, v in pairs(ents.FindByName(self:GetEntity1())) do
        v:SetNWBool("halo", false)
      end
      for k, v in pairs(ents.FindByName(self:GetEntity2())) do
        v:SetNWBool("halo", false)
      end
      for k, v in pairs(ents.FindByName(self:GetEntity3())) do
        v:SetNWBool("halo", false)
      end
      for k, v in pairs(ents.FindByName(self:GetEntity4())) do
        v:SetNWBool("halo", false)
      end
    end
  end
end

