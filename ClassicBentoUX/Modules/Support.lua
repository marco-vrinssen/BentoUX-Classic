-- Add Questie support

local function QuestieSupport()
    if IsAddOnLoaded("Questie") then
        Questie.db.profile.nameplateTargetFrameScale = 1.5
        Questie.db.profile.nameplateTargetFrameX = -180
        Questie.db.profile.nameplateTargetFrameY = 0

        Questie.db.profile.nameplateScale = 1.2
        Questie.db.profile.nameplateX = -24
        Questie.db.profile.nameplateY = 0
    end
end

local QuestieSupportEvents = CreateFrame("Frame")
QuestieSupportEvents:RegisterEvent("PLAYER_LOGIN")
QuestieSupportEvents:SetScript("OnEvent", QuestieSupport)