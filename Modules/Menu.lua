-- Update position and appearance of the MicroMenu buttons

local MicroMenuButtons = {
    CharacterMicroButton, 
    SpellbookMicroButton,
    TalentMicroButton, 
    QuestLogMicroButton, 
    GuildMicroButton,
    WorldMapMicroButton, 
    MainMenuMicroButton,
    HelpMicroButton
}

if SocialsMicroButton then
    table.insert(MicroMenuButtons, SocialsMicroButton)
end

local function ButtonsShow()
    for _, ButtonElement in ipairs(MicroMenuButtons) do
        UIFrameFadeIn(ButtonElement, 0.1, ButtonElement:GetAlpha(), 1)
    end
end

local function ButtonsHide()
    for _, ButtonElement in ipairs(MicroMenuButtons) do
        UIFrameFadeOut(ButtonElement, 0.1, ButtonElement:GetAlpha(), 0.5)
    end
end

local function ButtonUpdate()
    for _, ButtonElement in ipairs(MicroMenuButtons) do
        ButtonElement:SetAlpha(0.5)
        ButtonElement:SetScale(0.8)

        ButtonElement:SetScript("OnEnter", ButtonsShow)
        ButtonElement:SetScript("OnLeave", ButtonsHide)
    end

    if SocialsMicroButton then
        SocialsMicroButton:SetAlpha(0.5)
    end

    if GuildMicroButton then
        GuildMicroButton:SetAlpha(0.5)
    end

    CharacterMicroButton:ClearAllPoints()
    CharacterMicroButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, 0)
end

local MicroMenuEvents = CreateFrame("Frame")
MicroMenuEvents:RegisterEvent("PLAYER_LOGIN")
MicroMenuEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
MicroMenuEvents:SetScript("OnEvent", ButtonUpdate)