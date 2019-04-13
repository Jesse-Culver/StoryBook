include("shared.lua")

hook.Add( "PreDrawHalos", "RenderHalos", function()
  -- The table should probalby be made in the entity so as to not cause us to do a O(N) on every single draw frame
  for k, v in pairs(ents.GetAll()) do
    if v:GetNWBool("halo") then
      halo.Add( {v}, v:GetNWVector("glowColor"):ToColor(), v:GetNWInt("blurX", 2),v:GetNWInt("blurY", 2), 2,true,v:GetNWBool("ignoreZ",true))
    end
  end
end )