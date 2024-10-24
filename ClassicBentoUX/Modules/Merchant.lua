-- Automatically sells grey items and repairs gear when visiting a merchant

local function AutoSellRepair()
    local RepairCost, TotalSold = 0, 0
    local CanMerchantRepair, RepairAllItems, GetRepairAllCost = CanMerchantRepair, RepairAllItems, GetRepairAllCost
    local GetContainerNumSlots, GetContainerItemLink, UseContainerItem = C_Container.GetContainerNumSlots, C_Container.GetContainerItemLink, C_Container.UseContainerItem
    local GetItemInfo = GetItemInfo

    if CanMerchantRepair() then
        RepairCost = GetRepairAllCost()
        if RepairCost > 0 then
            RepairAllItems()
            print("|cFFFFFF00Gear repaired for:|r " .. GetCoinTextureString(RepairCost))
        end
    end

    for BagIndex = 0, 4 do
        for SlotIndex = 1, GetContainerNumSlots(BagIndex) do
            local ItemLink = GetContainerItemLink(BagIndex, SlotIndex)
            if ItemLink then
                local _, _, ItemRarity, _, _, _, _, _, _, _, ItemSellPrice = GetItemInfo(ItemLink)
                if ItemRarity == 0 and ItemSellPrice ~= 0 then
                    TotalSold = TotalSold + ItemSellPrice
                    UseContainerItem(BagIndex, SlotIndex)
                end
            end
        end
    end

    if TotalSold > 0 then
        print("|cFFFFFF00Grey items sold for:|r " .. GetCoinTextureString(TotalSold))
    end
end

local MerchantEvents = CreateFrame("Frame")
MerchantEvents:RegisterEvent("MERCHANT_SHOW")
MerchantEvents:SetScript("OnEvent", AutoSellRepair)