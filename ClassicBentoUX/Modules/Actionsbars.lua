-- Update appearance and position of action bars and buttons

local function ActionBarUpdate()
    MainMenuBar:SetWidth(512)
    MainMenuBar:ClearAllPoints()
    MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", -2, 88)
    MainMenuBar:SetMovable(true)
    MainMenuBar:SetUserPlaced(true)

    MultiBarBottomLeft:Show()
    MultiBarBottomLeft:ClearAllPoints()
    MultiBarBottomLeft:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 136)
    MultiBarBottomLeft:SetMovable(true)
    MultiBarBottomLeft:SetUserPlaced(true)

    MultiBarBottomRight:Show()
    MultiBarBottomRight:ClearAllPoints()
    MultiBarBottomRight:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 24)
    MultiBarBottomRight:SetMovable(true)
    MultiBarBottomRight:SetUserPlaced(true)
    MultiBarBottomRight:SetScale(0.8)

    MultiBarRight:ClearAllPoints()
    MultiBarRight:SetPoint("RIGHT", UIParent, "RIGHT", -16, 0)
    MultiBarRight:SetMovable(true)
    MultiBarRight:SetUserPlaced(true)

    MultiBarLeft:ClearAllPoints()
    MultiBarLeft:SetPoint("RIGHT", MultiBarRight, "LEFT", -2, 0)
    MultiBarLeft:SetMovable(true)
    MultiBarLeft:SetUserPlaced(true)

    MainMenuBarLeftEndCap:Hide()
    MainMenuBarRightEndCap:Hide()
    MainMenuBarPageNumber:Hide()
    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarTexture0:Hide()
    MainMenuBarTexture1:Hide()
    MainMenuBarTexture2:Hide()
    MainMenuBarTexture3:Hide()
    MainMenuMaxLevelBar0:Hide()
    MainMenuMaxLevelBar1:Hide()
    MainMenuMaxLevelBar2:Hide()
    MainMenuMaxLevelBar3:Hide()
    MainMenuBarMaxLevelBar:Hide()
    MainMenuBarOverlayFrame:Hide()
    SlidingActionBarTexture0:Hide()
    SlidingActionBarTexture0.Show = SlidingActionBarTexture0.Hide
    SlidingActionBarTexture1:Hide()
    SlidingActionBarTexture1.Show = SlidingActionBarTexture1.Hide
    MainMenuBarPerformanceBarFrame:Hide()
    MainMenuBarPerformanceBar:Hide()
end

local ActionBarEvents = CreateFrame("Frame")
ActionBarEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
ActionBarEvents:SetScript("OnEvent", ActionBarUpdate)




-- Update button color based on range and usability

function ActionButtonUpdate(self)
    if self.action then
        local ActionRange = IsActionInRange(self.action)
        local ActionUsability = IsUsableAction(self.action)
        
        if not ActionUsability or ActionRange == false then
            self.icon:SetVertexColor(0.25, 0.25, 0.25, 1)
        else
            self.icon:SetVertexColor(1, 1, 1, 1)
        end
    end
end

hooksecurefunc("ActionButton_OnUpdate", ActionButtonUpdate)




-- Update appearance and position of pet bar

local function PetBarUpdate()
    local PreviousPetButton

    for i = 1, 10 do
        local PetButton = _G["PetActionButton" .. i]
        PetButton:ClearAllPoints()

        if not PreviousPetButton then
            PetButton:SetPoint("BOTTOMLEFT", MultiBarBottomLeft, "TOPLEFT", 0, 8)
        else
            PetButton:SetPoint("LEFT", PreviousPetButton, "RIGHT", 4, 0)
        end

        PetButton:SetScale(0.8)
        PetButton:SetAlpha(0.5)
        PetButton:Show()

        PreviousPetButton = PetButton
    end
end

local PetBarEvents = CreateFrame("Frame")
PetBarEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
PetBarEvents:RegisterEvent("UNIT_PET")
PetBarEvents:RegisterEvent("PET_BAR_UPDATE")
PetBarEvents:SetScript("OnEvent", PetBarUpdate)




-- Update appearance and position of class bar

local function ClassBarUpdate()
    local PreviousClassButton

    for i = 1, NUM_STANCE_SLOTS do
        local ClassButton = _G["StanceButton" .. i]
        
        ClassButton:ClearAllPoints()

        if not PreviousClassButton then
            ClassButton:SetPoint("BOTTOMLEFT", MultiBarBottomLeft, "TOPLEFT", 0, 8)
        else
            ClassButton:SetPoint("LEFT", PreviousClassButton, "RIGHT", 4, 0)
        end

        ClassButton:SetScale(0.8)
        ClassButton:SetAlpha(0.5)

        PreviousClassButton = ClassButton
    end

    PossessBarFrame:UnregisterAllEvents()
end

local ClassBarEvents = CreateFrame("Frame")
ClassBarEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
ClassBarEvents:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
ClassBarEvents:RegisterEvent("UPDATE_SHAPESHIFT_USABLE")
ClassBarEvents:RegisterEvent("UPDATE_SHAPESHIFT_COOLDOWN")
ClassBarEvents:SetScript("OnEvent", ClassBarUpdate)



-- Update appearance and position of vehicle button

local function VehicleButtonUpdate()
    MainMenuBarVehicleLeaveButton:SetSize(32, 32)
    MainMenuBarVehicleLeaveButton:ClearAllPoints()
    MainMenuBarVehicleLeaveButton:SetPoint("BOTTOM", CastingBarFrame, "BOTTOM", 0, 0)
end

MainMenuBarVehicleLeaveButton:HookScript("OnShow", VehicleButtonUpdate)