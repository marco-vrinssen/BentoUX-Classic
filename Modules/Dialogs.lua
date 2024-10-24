-- Automatic item related dialog handling

local function DialogUpdate(_, event, ...)
    if event == "CONFIRM_LOOT_ROLL" then
        ConfirmLootRoll(...)
    elseif event == "LOOT_BIND_CONFIRM" then
        ConfirmLootSlot(...)
    elseif event == "EQUIP_BIND_CONFIRM" then
        EquipPendingItem(...)
    elseif event == "MERCHANT_CONFIRM_TRADE_TIMER_REMOVAL" then
        SellCursorItem()
    end
end

local DialogEvents = CreateFrame("Frame")
DialogEvents:RegisterEvent("CONFIRM_LOOT_ROLL")
DialogEvents:RegisterEvent("LOOT_BIND_CONFIRM")
DialogEvents:RegisterEvent("EQUIP_BIND_CONFIRM")
DialogEvents:RegisterEvent("MERCHANT_CONFIRM_TRADE_TIMER_REMOVAL")
DialogEvents:SetScript("OnEvent", DialogUpdate)