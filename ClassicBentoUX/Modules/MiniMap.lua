-- Update position and appearance of the Minimap and its elements

local MinimapContainerBackdrop = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
MinimapContainerBackdrop:SetSize(144, 144)
MinimapContainerBackdrop:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -16, -16)
MinimapContainerBackdrop:SetBackdrop({edgeFile = "Interface/Tooltips/UI-Tooltip-Border", edgeSize = 12})
MinimapContainerBackdrop:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
MinimapContainerBackdrop:SetFrameLevel(Minimap:GetFrameLevel() + 1)

local function MinimapContainerUpdate()
    Minimap:SetClampedToScreen(false)
    Minimap:ClearAllPoints()
    Minimap:SetPoint("TOPLEFT", MinimapContainerBackdrop, "TOPLEFT", 2, -2)
    Minimap:SetPoint("BOTTOMRIGHT", MinimapContainerBackdrop, "BOTTOMRIGHT", -2, 2)
    Minimap:SetMaskTexture("Interface/ChatFrame/ChatFrameBackground")

    MinimapBorder:Hide()
    MinimapBorderTop:Hide()
    MinimapBackdrop:Hide()
    MinimapToggleButton:Hide()
    MinimapCompassTexture:SetTexture(nil)
    GameTimeFrame:Hide()
    MinimapZoneTextButton:Hide()
end

local MinimapContainerEvents = CreateFrame("Frame")
MinimapContainerEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
MinimapContainerEvents:RegisterEvent("ZONE_CHANGED")
MinimapContainerEvents:SetScript("OnEvent", MinimapContainerUpdate)




function GetMinimapShape()
    return "SQUARE"
end

local MinimapShapeEvents = CreateFrame("Frame")
MinimapShapeEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
MinimapShapeEvents:SetScript("OnEvent", GetMinimapShape)




local function MinimapScrollEnable(self, delta)
    if delta > 0 then
        Minimap_ZoomIn()
    else
        Minimap_ZoomOut()
    end
end

local MinimapZoomEvents = CreateFrame("Frame", nil, Minimap)
MinimapZoomEvents:SetAllPoints(Minimap)
MinimapZoomEvents:EnableMouseWheel(true)
MinimapZoomEvents:SetScript("OnMouseWheel", MinimapScrollEnable)




local MinimapTimeBackdrop = CreateFrame("Frame", nil, MinimapContainerBackdrop, "BackdropTemplate")
MinimapTimeBackdrop:SetSize(48, 24)
MinimapTimeBackdrop:SetPoint("CENTER", MinimapContainerBackdrop, "BOTTOM", 0, -2)
MinimapTimeBackdrop:SetBackdrop({
    bgFile = "Interface/ChatFrame/ChatFrameBackground",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = false, tileSize = 24, edgeSize = 12,
    insets = {left = 2, right = 2, top = 2, bottom = 2}
})
MinimapTimeBackdrop:SetBackdropColor(0, 0, 0, 1)
MinimapTimeBackdrop:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
MinimapTimeBackdrop:SetFrameLevel(MinimapContainerBackdrop:GetFrameLevel() + 1)

local function MinimapTimeUpdate()
    for _, ButtonRegion in pairs({TimeManagerClockButton:GetRegions()}) do
        if ButtonRegion:IsObjectType("Texture") then
            ButtonRegion:Hide()
        end
    end

    TimeManagerClockButton:SetParent(MinimapTimeBackdrop)
    TimeManagerClockButton:SetAllPoints(MinimapTimeBackdrop)

    TimeManagerClockTicker:SetPoint("CENTER", TimeManagerClockButton, "CENTER", 0, 0)
    TimeManagerClockTicker:SetFont(STANDARD_TEXT_FONT, 12)

    TimeManagerFrame:ClearAllPoints()
    TimeManagerFrame:SetPoint("TOPRIGHT", MinimapTimeBackdrop, "BOTTOMRIGHT", 0, -4)
end

local MinimapTimeEvents = CreateFrame("Frame")
MinimapTimeEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
MinimapTimeEvents:SetScript("OnEvent", MinimapTimeUpdate)




local MinimapMailBackdrop = CreateFrame("Frame", nil, MiniMapMailFrame, "BackdropTemplate")
MinimapMailBackdrop:SetPoint("TOPLEFT", MiniMapMailFrame, "TOPLEFT", -4, 4)
MinimapMailBackdrop:SetPoint("BOTTOMRIGHT", MiniMapMailFrame, "BOTTOMRIGHT", 4, -4)
MinimapMailBackdrop:SetBackdrop({
    bgFile = "Interface/ChatFrame/ChatFrameBackground",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = false, tileSize = 16, edgeSize = 12,
    insets = {left = 2, right = 2, top = 2, bottom = 2}
})
MinimapMailBackdrop:SetBackdropColor(0, 0, 0, 1)
MinimapMailBackdrop:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
MinimapMailBackdrop:SetFrameLevel(MinimapContainerBackdrop:GetFrameLevel() + 1)

local function MinimapMailUpdate()
    MiniMapMailBorder:Hide()
    MiniMapMailFrame:SetParent(MinimapContainerBackdrop)
    MiniMapMailFrame:ClearAllPoints()
    MiniMapMailFrame:SetSize(16, 16)
    MiniMapMailFrame:SetPoint("RIGHT", MinimapTimeBackdrop, "LEFT", -8, 0)

    MiniMapMailIcon:ClearAllPoints()
    MiniMapMailIcon:SetSize(17, 17)
    MiniMapMailIcon:SetPoint("CENTER", MiniMapMailFrame, "CENTER", 0, 0)
end

local MinimapMailEvents = CreateFrame("Frame")
MinimapMailEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
MinimapMailEvents:SetScript("OnEvent", MinimapMailUpdate)




local MinimapBFBackdrop = CreateFrame("Frame", nil, MiniMapBattlefieldFrame, "BackdropTemplate")
MinimapBFBackdrop:SetPoint("TOPLEFT", MiniMapBattlefieldFrame, "TOPLEFT", -4, 4)
MinimapBFBackdrop:SetPoint("BOTTOMRIGHT", MiniMapBattlefieldFrame, "BOTTOMRIGHT", 4, -4)
MinimapBFBackdrop:SetBackdrop({
    bgFile = "Interface/ChatFrame/ChatFrameBackground",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = false, tileSize = 16, edgeSize = 12,
    insets = {left = 2, right = 2, top = 2, bottom = 2}
})
MinimapBFBackdrop:SetBackdropColor(0, 0, 0, 1)
MinimapBFBackdrop:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
MinimapBFBackdrop:SetFrameLevel(MinimapContainerBackdrop:GetFrameLevel() + 1)

local function MinimapBFUpdate()
    MiniMapBattlefieldBorder:Hide()
    MiniMapBattlefieldFrame:SetParent(MinimapContainerBackdrop)
    MiniMapBattlefieldFrame:ClearAllPoints()
    MiniMapBattlefieldFrame:SetSize(16, 16)
    MiniMapBattlefieldFrame:SetPoint("LEFT", MinimapTimeBackdrop, "RIGHT", 8, 0)

    MiniMapBattlefieldIcon:ClearAllPoints()
    MiniMapBattlefieldIcon:SetSize(16,16)
    MiniMapBattlefieldIcon:SetPoint("CENTER", MiniMapBattlefieldFrame, "CENTER", 0, 0)
end

local MinimapBFEvents = CreateFrame("Frame")
MinimapBFEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
MinimapBFEvents:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
MinimapBFEvents:RegisterEvent("UPDATE_ACTIVE_BATTLEFIELD")
MinimapBFEvents:SetScript("OnEvent", MinimapBFUpdate)




local function MinimapTrackingUpdate()
    MiniMapTrackingBorder:Hide()

    MiniMapTracking:ClearAllPoints()
    MiniMapTracking:SetSize(16, 16)
    MiniMapTracking:SetPoint("TOPRIGHT", MinimapContainerBackdrop, "TOPRIGHT", -2, -2)

    MiniMapTrackingIcon:ClearAllPoints()
    MiniMapTrackingIcon:SetSize(16, 16)
    MiniMapTrackingIcon:SetPoint("TOPRIGHT", MinimapContainerBackdrop, "TOPRIGHT", -2, -2)
end

local function CheckAndUpdateMinimapTracking()
    if MiniMapTracking then
        MinimapTrackingUpdate()
    else
        C_Timer.After(1, CheckAndUpdateMinimapTracking)
    end
end

local MinimapTrackingEvents = CreateFrame("Frame")
MinimapTrackingEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
MinimapTrackingEvents:RegisterEvent("MINIMAP_UPDATE_TRACKING")
MinimapTrackingEvents:SetScript("OnEvent", CheckAndUpdateMinimapTracking)




local function AddonButtonUpdate()
    local LibDBIcon = LibStub("LibDBIcon-1.0", true)
    if not LibDBIcon then return end

    for name, AddonButton in pairs(LibDBIcon.objects) do
        if AddonButton:IsShown() then
            for i = 1, AddonButton:GetNumRegions() do
                local ButtonRegion = select(i, AddonButton:GetRegions())
                if ButtonRegion:IsObjectType("Texture") and ButtonRegion ~= AddonButton.icon then
                    ButtonRegion:Hide()
                end
            end

            AddonButton:SetSize(16, 16)
            AddonButton:SetParent(MinimapContainerBackdrop)
            AddonButton.icon:ClearAllPoints()
            AddonButton.icon:SetPoint("CENTER", AddonButton, "CENTER", 0, 0)
            AddonButton.icon:SetSize(14, 14)

            if not AddonButton.background then
                AddonButton.background = CreateFrame("Frame", nil, AddonButton, BackdropTemplateMixin and "BackdropTemplate")
                AddonButton.background:SetPoint("TOPLEFT", AddonButton, "TOPLEFT", -4, 4)
                AddonButton.background:SetPoint("BOTTOMRIGHT", AddonButton, "BOTTOMRIGHT", 4, -4)
                AddonButton.background:SetBackdrop({
                    bgFile = "Interface/ChatFrame/ChatFrameBackground",
                    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                    tile = false, tileSize = 16, edgeSize = 12,
                    insets = {left = 2, right = 2, top = 2, bottom = 2}
                })
                AddonButton.background:SetBackdropColor(0, 0, 0, 1)
                AddonButton.background:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
                AddonButton.background:SetFrameLevel(AddonButton:GetFrameLevel() - 1)
            end
        end
    end
end

local AddonButtonEvents = CreateFrame("Frame")
AddonButtonEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
AddonButtonEvents:RegisterEvent("ADDON_LOADED")
AddonButtonEvents:SetScript("OnEvent", function(self, event)
    if event == "ADDON_LOADED" then
        C_Timer.After(0.25, AddonButtonUpdate)
    elseif event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(0.25, AddonButtonUpdate)
    end
end)