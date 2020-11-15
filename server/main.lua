ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("gasmask", function(source) 
    TriggerClientEvent("esx_gasmask:useItem", source)
end)

