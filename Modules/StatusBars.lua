local function ExperienceBarHide()
    MainMenuExpBar:Hide()
    MainMenuExpBar:SetAlpha(0)
    MainMenuXPBarTexture0:Hide()
    MainMenuXPBarTexture1:Hide()
    MainMenuXPBarTexture2:Hide()
    MainMenuXPBarTexture3:Hide()
end

MainMenuExpBar:HookScript("OnShow", ExperienceBarHide)

local ExperienceBarEvents = CreateFrame("Frame")
ExperienceBarEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
ExperienceBarEvents:RegisterEvent("PLAYER_LEVEL_UP")
ExperienceBarEvents:RegisterEvent("PLAYER_XP_UPDATE")
ExperienceBarEvents:RegisterEvent("UPDATE_EXHAUSTION")
ExperienceBarEvents:SetScript("OnEvent", ExperienceBarHide)




local function ReputationBarHide()
    ReputationWatchBar.StatusBar:Hide()
    ReputationWatchBar.OverlayFrame:Hide()
    ReputationWatchBar.StatusBar.WatchBarTexture0:Hide()
    ReputationWatchBar.StatusBar.WatchBarTexture1:Hide()
    ReputationWatchBar.StatusBar.WatchBarTexture2:Hide()
    ReputationWatchBar.StatusBar.WatchBarTexture3:Hide()
end

ReputationWatchBar.StatusBar:HookScript("OnShow", ReputationBarHide)

local ReputationBarEvents = CreateFrame("Frame")
ReputationBarEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
ReputationBarEvents:RegisterEvent("UPDATE_FACTION")
ReputationBarEvents:SetScript("OnEvent", ReputationBarHide)