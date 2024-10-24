-- Enable saved variable for addon

ClassicBentoUX = ClassicBentoUX or {}




-- Update graphics, world text scale and max camera distance configurations

local function ConfigUpdate()
    SetCVar("ffxGlow", 0)
    SetCVar("ffxDeath", 0)
    SetCVar("ffxNether", 0)

    SetCVar("WorldTextScale", 1.5)
    SetCVar("cameraDistanceMaxZoomFactor", 3)

    SetCVar("rawMouseEnable", 1)
end

local ConfigEvents = CreateFrame("Frame")
ConfigEvents:RegisterEvent("PLAYER_LOGIN")
ConfigEvents:SetScript("OnEvent", ConfigUpdate)




-- Update position of framerate display

local function FramerateUpdate()
    FramerateLabel:SetAlpha(0)
    FramerateText:ClearAllPoints()
    FramerateText:SetPoint("LEFT", MainMenuMicroButton, "RIGHT", 8, -8)
end

local FramerateEvents = CreateFrame("Frame")
FramerateEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
FramerateEvents:SetScript("OnEvent", FramerateUpdate)