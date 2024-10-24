-- Speed up auto looting and hide the LootFrame during the process

local function FasterLooting()
    if GetCVarBool("autoLootDefault") ~= IsModifiedClick("AUTOLOOTTOGGLE") then
        local ItemsTotal = GetNumLootItems()
        if ItemsTotal > 0 then
            LootFrame:Hide()
            for ItemCount = 1, ItemsTotal do
                LootSlot(ItemCount)
            end
        end
        C_Timer.After(0, function()
            LootFrame:Hide()
        end)
    end
end

local LootEvents = CreateFrame("Frame")
LootEvents:RegisterEvent("LOOT_READY")
LootEvents:SetScript("OnEvent", FasterLooting)