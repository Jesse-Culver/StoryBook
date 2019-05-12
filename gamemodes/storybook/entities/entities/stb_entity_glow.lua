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
      self:SetNWString("Entity1",value)
    elseif key == "Entity2" and value ~= "" then
      self:SetNWString("Entity2",value)
    elseif key == "Entity3" and value ~= "" then
      self:SetNWString("Entity3",value)
    elseif key == "Entity4" and value ~= "" then
      self:SetNWString("Entity4",value)
    elseif key == "glowcolor" and value ~= "" then
      self:SetNWVector("GlowColor",util.StringToType(value, "Vector"))
    elseif key == "BlurX" and value ~= "" then
      self:SetNWInt("GlowBlurX",tonumber(value))
    elseif key == "BlurY" and value ~= "" then
      self:SetNWInt("GlowBlurY",tonumber(value))
    elseif key == "IgnoreZ" and value ~= "" then
      if value == 0 then
        self:SetNWBool("GlowIgnoreZ",false)
      else
        self:SetNWBool("GlowIgnoreZ",true)
      end
    end
  end
end

function ENT:SetEntEnabled(value)
  if SERVER then
    if value == true then
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity1"))) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetNWVector("GlowColor"))
        v:SetNWInt("blurX", self:GetNWInt("GlowBlurX"))
        v:SetNWInt("blurY", self:GetNWInt("GlowBlurY"))
        v:SetNWBool("ignoreZ", self:GetNWBool("GlowIgnoreZ"))
      end
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity2"))) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetNWVector("GlowColor"))
        v:SetNWInt("blurX", self:GetNWInt("GlowBlurX"))
        v:SetNWInt("blurY", self:GetNWInt("GlowBlurY"))
        v:SetNWBool("ignoreZ", self:GetNWBool("GlowIgnoreZ"))
      end
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity3"))) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetNWVector("GlowColor"))
        v:SetNWInt("blurX", self:GetNWInt("GlowBlurX"))
        v:SetNWInt("blurY", self:GetNWInt("GlowBlurY"))
        v:SetNWBool("ignoreZ", self:GetNWBool("GlowIgnoreZ"))
      end
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity4"))) do
        v:SetNWBool("halo", true)
        v:SetNWVector("glowColor", self:GetNWVector("GlowColor"))
        v:SetNWInt("blurX", self:GetNWInt("GlowBlurX"))
        v:SetNWInt("blurY", self:GetNWInt("GlowBlurY"))
        v:SetNWBool("ignoreZ", self:GetNWBool("GlowIgnoreZ"))
      end
    else
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity1"))) do
        v:SetNWBool("halo", false)
      end
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity2"))) do
        v:SetNWBool("halo", false)
      end
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity3"))) do
        v:SetNWBool("halo", false)
      end
      for k, v in pairs(ents.FindByName(self:GetNWString("Entity4"))) do
        v:SetNWBool("halo", false)
      end
    end
  end
end

