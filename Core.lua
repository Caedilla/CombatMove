
local f = CreateFrame('Frame', nil, UIParent)

local function toggleCTM(self, event, ...)
	if event == 'PLAYER_ENTERING_WORLD' then
		if not InCombatLockdown() then
			SetCVar('autoInteract',1)
		else
			SetCVar('autoInteract', 0)
		end
	elseif event == 'PLAYER_REGEN_DISABLED' then
		SetCVar('autoInteract', 0)
	elseif event == 'PLAYER_REGEN_ENABLED' then
		SetCVar('autoInteract',1)
	end
end

f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:RegisterEvent('PLAYER_REGEN_ENABLED')
f:RegisterEvent('PLAYER_REGEN_DISABLED')
f:SetScript('OnEvent', toggleCTM)