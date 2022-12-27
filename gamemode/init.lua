AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("Spawn_Aircraft")

net.Receive("Spawn_Aircraft", function(len, ply)
    local Aircraft = net.ReadString()

    local Ent = ents.Create(Aircraft)
    Ent:SetPos(Vector(-7140.747559 -10757.807617 -8319.464844))
    Ent:Spawn()
end)

function GM:PlayerSpawn(Plr)
    
end