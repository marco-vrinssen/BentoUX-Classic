local function WorldMapUpdate()
    WorldMapFrame:ClearAllPoints()
    WorldMapFrame:SetScale(0.8)

    local WorldMapElements = {
        WorldMapFrame.BlackoutFrame,
        WorldMapTitleButton,
        WorldMapZoomOutButton,
        WorldMapZoneDropDown,
        WorldMapContinentDropDown,
        WorldMapZoneMinimapDropDown,
        WorldMapMagnifyingGlassButton
    }

    for _, WorldMapElement in ipairs(WorldMapElements) do
        WorldMapElement.Show = function()
            WorldMapElement:Hide()
        end
    end

    WorldMapFrame.ScrollContainer.GetCursorPosition = function()
        local Width, Height = MapCanvasScrollControllerMixin.GetCursorPosition()
        local Scale = WorldMapFrame:GetScale()
        return Width / Scale, Height / Scale
    end
end

local WorldMapEvents = CreateFrame("Frame")
WorldMapEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
WorldMapEvents:SetScript("OnEvent", WorldMapUpdate)