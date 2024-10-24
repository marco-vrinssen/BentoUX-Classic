-- Mute bow, gun and Mechastrider mount sounds

local function SoundUpdate()
    MuteSoundFile(555124) -- Mechastrider Loop
    MuteSoundFile(567677) -- Bow Pullback 1
    MuteSoundFile(567675) -- Bow Pullback 2
    MuteSoundFile(567676) -- Bow Pullback 3
    MuteSoundFile(567719) -- Gun Loading 1
    MuteSoundFile(567720) -- Gun Loading 2
    MuteSoundFile(567723) -- Gun Loading 3

    MuteSoundFile(548067) -- Core Hound Fire
end

local SoundEvents = CreateFrame("Frame")
SoundEvents:RegisterEvent("PLAYER_LOGIN")
SoundEvents:SetScript("OnEvent", SoundUpdate)