ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('torchizm:getPed', function(source, cb, target)
	local identifier = GetPlayerIdentifiers(source)[1]
	
	MySQL.Async.fetchAll("SELECT pedtype,sex FROM users WHERE identifier=@identifier",{
		['@identifier'] = identifier}, 
    function(result)
		if result[1].pedtype ~= nil and result[1].pedtype ~= '' then
			cb(result[1].pedtype)
		else
			if result[1].sex == 'm' then
				cb('mp_m_freemode_01')
			else
				cb('mp_f_freemode_01')
			end
		end
    end)
end)