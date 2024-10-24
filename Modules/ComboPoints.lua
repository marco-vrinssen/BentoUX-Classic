-- As default combo points are hidden, this is a custom combo points display for rogues and druids.

local _, ClassIdentifier = UnitClass("player")
if ClassIdentifier ~= "ROGUE" and ClassIdentifier ~= "DRUID" then
    return
end

local PointSize = 24
local PointMargin = 4
local PointFadeDuration = 0.5
local PointsTotalWidth = 5 * PointSize + 4 * PointMargin

local ComboPointsFrame = CreateFrame("Frame", "ComboPointsFrame", UIParent)
ComboPointsFrame:SetSize(PointsTotalWidth, PointSize)
ComboPointsFrame:SetPoint("BOTTOM", CastingBarFrame, "TOP", 0, 4)

local ComboPoints = {}

local function ComboPointTextures(ComboPoint, ActiveState)
    if ActiveState then
        ComboPoint.Texture:SetAlpha(1)
        ComboPoint.Texture:SetTexture("Interface/COMMON/Indicator-Red")
    else
        ComboPoint.Texture:SetAlpha(0.5)
        ComboPoint.Texture:SetTexture("Interface/COMMON/Indicator-Gray")
    end
end

for i = 1, 5 do
    local ComboPoint = CreateFrame("Frame", nil, ComboPointsFrame)
    ComboPoint:SetSize(PointSize, PointSize)

    ComboPoint.Texture = ComboPoint:CreateTexture(nil, "ARTWORK")
    ComboPoint.Texture:SetTexture("Interface/COMMON/Indicator-Gray")
    ComboPoint.Texture:SetPoint("CENTER")
    ComboPoint.Texture:SetSize(PointSize, PointSize)
    ComboPoint.Texture:SetAlpha(0.5)

    local ComboPointMask = ComboPoint:CreateMaskTexture()
    ComboPointMask:SetTexture("Interface/CHARACTERFRAME/TempPortraitAlphaMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    ComboPointMask:SetSize(PointSize * 0.7, PointSize * 0.7)
    ComboPointMask:SetPoint("CENTER")

    ComboPoint.Texture:AddMaskTexture(ComboPointMask)

    ComboPointTextures(ComboPoint, false)
    ComboPoints[i] = ComboPoint
end
ComboPointsFrame:SetWidth(PointSize * 5 + PointMargin * 4)
for i, ComboPoint in ipairs(ComboPoints) do
    ComboPoint:SetPoint("LEFT", ComboPointsFrame, "LEFT", PointSize * (i - 1) + PointMargin * (i - 1), 0)
end

local function ComboPointsUpdate()
    ComboFrame:UnregisterAllEvents()
    ComboFrame:Hide()

    local ComboPointsCount = GetComboPoints("player", "target") or 0
    if ComboPointsCount > 0 then
        for i = 1, 5 do
            ComboPointTextures(ComboPoints[i], i <= ComboPointsCount)
        end
        UIFrameFadeIn(ComboPointsFrame, PointFadeDuration, ComboPointsFrame:GetAlpha(), 1)
    else
        UIFrameFadeOut(ComboPointsFrame, PointFadeDuration, ComboPointsFrame:GetAlpha(), 0)
    end
end

local ComboPointsEvents = CreateFrame("Frame")
ComboPointsEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
ComboPointsEvents:RegisterEvent("PLAYER_TARGET_CHANGED")
ComboPointsEvents:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")
ComboPointsEvents:SetScript("OnEvent", ComboPointsUpdate)