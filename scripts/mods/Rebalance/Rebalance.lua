local mod = get_mod("Rebalance")

--Create table for NewDamageProfileTemplates
NewDamageProfileTemplates = {}

--Include other files
--Weapons
mod:dofile("scripts/mods/FixMeta/rebalance/weapons.lua")

--Add the new templates to the DamageProfile templates
--Setup proper linkin in NetworkLookup
for key, _ in pairs(NewDamageProfileTemplates) do
    i = #NetworkLookup.damage_profiles + 1
    NetworkLookup.damage_profiles[i] = key
    NetworkLookup.damage_profiles[key] = i
end
--Merge the tables together
table.merge_recursive(DamageProfileTemplates, NewDamageProfileTemplates)