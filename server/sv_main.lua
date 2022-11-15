QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-fishing:server:RemoveBait', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if    Player.Functions.RemoveItem("fishingbait", 1) then
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishingbait'], 'remove', 1)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local random = math.random(100) -- Random number from 1 to 100
    local item

    if random >= 1 and random <= 20 then -- 20%
        item = 'fish'
    elseif random >= 20 and random <= 25 then -- 5%
        item = 'plastic'
    elseif random >= 25 and random <= 30 then -- 5%
        item = 'rubber'
    elseif random >= 25 and random <= 30 then -- 5%
        item = 'glass'
    elseif random >= 30 and random <= 35 then -- 5%
        item = 'fish2'
    elseif random >= 35 and random <= 50 then -- 15%
        item = 'goldfish'
    elseif random >= 50 and random <= 60 then -- 10%
        item = 'catfish'
    elseif random >= 60 and random <= 65 then -- 5%
        item = 'largemouthbass'
    elseif random >= 65 and random <= 70 then -- 5%
        item = 'redfish'
    elseif random >= 70 and random <= 75 then -- 5%
        item = 'salmon'
    elseif random >= 75 and random <= 80 then -- 5%
        item = 'stingray'
    elseif random >= 80 and random <= 85 then -- 5%
        item = 'stripedbass'
    elseif random >= 90 and random <= 92 then -- 2%
        item = 'whale'
    elseif random >= 92 and random <= 94 then -- 2%
        item = 'whale2'
    elseif random >= 94 and random <= 96 then -- 2%
        item = 'case_prisma2'
    elseif random >= 96 and random <= 100 then -- 4%
        item = 'case_breakout'
    end
    Player.Functions.SetMetaData("fishing", Player.PlayerData.metadata["fishing"]+1)
  --  if exports['qb-inventory']:AddItem(Player.PlayerData.source, item, 1, false) then
    if Player.Functions.AddItem(item, 1) then     
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)
    else
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'POCKETS FULL', 'error', 2500)
    end

end)


QBCore.Functions.CreateUseableItem('fishingrod', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.Functions.GetItemByName('fishingrod') then return end
    TriggerClientEvent('qb-fishing:client:FishingRod', src)
end)
