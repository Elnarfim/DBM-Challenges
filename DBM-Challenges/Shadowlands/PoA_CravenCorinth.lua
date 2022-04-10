local mod	= DBM:NewMod("CravenCorinth", "DBM-Challenges", 1)
--L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(172412)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
--	"SPELL_CAST_START",
--	"SPELL_AURA_APPLIED",
--	"SPELL_AURA_APPLIED_DOSE",
--	"SPELL_AURA_REMOVED",
--	"UNIT_DIED"
	"UNIT_SPELLCAST_SUCCEEDED"
)

local berserkTimer								= mod:NewBerserkTimer(480)

function mod:OnCombatStart(delay)
	berserkTimer:Start(80-delay)
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 333198 then--[DNT] Set World State: Win Encounter-
		DBM:EndCombat(self)
	end
end
