ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local gasMaskOn = false
local damageTime = 0


RegisterNetEvent("esx_gasmask:useItem")
AddEventHandler("esx_gasmask:useItem", function()
        local animdict = 'mp_masks@on_foot'
        local animname = 'put_on_mask'
        local playerped = PlayerPedId()
        ESX.Streaming.RequestAnimDict(animdict, function()
            TaskPlayAnim(playerped, animdict, animname, 8.0, -8.0, -1, 0, 0, false, false, false)
        end)
        Wait(260)
        if not gasMaskOn then
            TriggerEvent("skinchanger:getSkin", function(skin)
                skin.mask_1 = Config.GasMaskNumber
                skin.mask_2 = 0
                TriggerEvent("skinchanger:loadSkin", skin)
            end)
            gasMaskOn = true
            SetEntityProofs(playerped, false, false, false, false, false, false, true, true, false)

        else
            TriggerEvent("skinchanger:getSkin", function(skin)
                skin.mask_1 = 0
                skin.mask_2 = 0
                TriggerEvent("skinchanger:loadSkin", skin)
            end)
            gasMaskOn = false
            SetEntityProofs(playerped, false, false, false, false, false, false, false, false, false)
        end

    
end)
