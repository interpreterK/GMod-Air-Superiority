local Aircraft_List = {
    "sw_f22",
    "lunasflightschool_bf109"
}

function SpawnRandom_Aircraft()
    net.Start("Spawn_Aircraft")
    net.WriteString(Aircraft_List[math.random(#Aircraft_List)])
    net.SendToServer()
end

function HUD()
    local Client = LocalPlayer()

    local sHeight = ScrH()
    local sWidth = ScrW()
    
    local frame = vgui.Create( "DFrame" )
    frame:SetSize( 300, 250 )
    frame:Center()
    frame:MakePopup()

    local DermaButton = vgui.Create( "DButton", frame )
    DermaButton:SetText( "Spawn Random Aircraft" )
    DermaButton:SetPos( 25, 50 )
    DermaButton:SetSize( 250, 30 )
    DermaButton.DoClick = SpawnRandom_Aircraft
end

function Hide_Default_Hud(Hud_Name)
    for _,v in next, {
        "CHudHealth",
        "CHudBattery",
        "CHudAmmo",
        "CHudSecondaryAmmo"
    } do
        if Hud_Name == v then
            return false
        end
    end
end

HUD()
hook.Add("HUDShouldDraw", "HideDefaultHud", Hide_Default_Hud)