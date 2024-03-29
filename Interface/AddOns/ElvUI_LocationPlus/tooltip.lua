local E, L, V, P, G = unpack(ElvUI);
local LP = E:GetModule('LocationPlus')
--local T = LibStub('LibTourist-3.0');

local format, tonumber, pairs, tinsert = string.format, tonumber, pairs, table.insert

local GetBindLocation = GetBindLocation
local C_Map_GetBestMapForUnit = C_Map.GetBestMapForUnit
local GetCurrencyInfo, GetCurrencyListSize = GetCurrencyInfo, GetCurrencyListSize
local GetProfessionInfo, GetProfessions = GetProfessionInfo, GetProfessions
local UnitLevel = UnitLevel
local GameTooltip = _G['GameTooltip']

local PLAYER, UNKNOWN, TRADE_SKILLS, TOKENS, DUNGEONS = PLAYER, UNKNOWN, TRADE_SKILLS, TOKENS, DUNGEONS
local PROFESSIONS_FISHING, LEVEL_RANGE, STATUS, HOME, CONTINENT, PVP, RAID = PROFESSIONS_FISHING, LEVEL_RANGE, STATUS, HOME, CONTINENT, PVP, RAID

-- GLOBALS: selectioncolor, continent, continentID

-- Icons on Location Panel
local FISH_ICON = "|TInterface\\AddOns\\ElvUI_LocPlus\\media\\fish.tga:14:14|t"
local PET_ICON = "|TInterface\\AddOns\\ElvUI_LocPlus\\media\\pet.tga:14:14|t"
local LEVEL_ICON = "|TInterface\\AddOns\\ElvUI_LocPlus\\media\\levelup.tga:14:14|t"

--------------------
-- Currency Table --
--------------------
-- Add below the currency id you wish to track. 
-- Find the currency ids: http://www.wowhead.com/currencies .
-- Click on the wanted currency and in the address you will see the id.
-- e.g. for Bloody Coin, you will see http://www.wowhead.com/currency=789 . 789 is the id.
-- So, on this case, add 789, (don't forget the comma).
-- If there are 0 earned points, the currency will be filtered out.

local currency = {
	--395,	-- Justice Points
	--396,	-- Valor Points
	--777,	-- Timeless Coins
	--697,	-- Elder Charm of Good Fortune
	--738,	-- Lesser Charm of Good Fortune
	--390,	-- Conquest Points
	--392,	-- Honor Points
	--515,	-- Darkmoon Prize Ticket
	--402,	-- Ironpaw Token
	--776,	-- Warforged Seal
	
	-- WoD
	--824,	-- Garrison Resources
	--823,	-- Apexis Crystal (for gear, like the valors)
	--994,	-- Seal of Tempered Fate (Raid loot roll)
	--980,	-- Dingy Iron Coins (rogue only, from pickpocketing)
	--944,	-- Artifact Fragment (PvP)
	--1101,	-- Oil
	--1129,	-- Seal of Inevitable Fate
	--821,	-- Draenor Clans Archaeology Fragment
	--828,	-- Ogre Archaeology Fragment
	--829,	-- Arakkoa Archaeology Fragment
	--1166, -- Timewarped Badge (6.22)
	--1191,	-- Valor Points (6.23)
	
	-- Legion
	--1226,	-- Nethershard (Invasion scenarios)
	--1172,	-- Highborne Archaeology Fragment
	--1173,	-- Highmountain Tauren Archaeology Fragment
	--1155,	-- Ancient Mana
	--1220,	-- Order Resources
	--1275,	-- Curious Coin (Buy stuff :P)
	--1226,	-- Nethershard (Invasion scenarios)
	--1273,	-- Seal of Broken Fate (Raid)
	--1154,	-- Shadowy Coins
	--1149,	-- Sightless Eye (PvP)
	--1268,	-- Timeworn Artifact (Honor Points?)
	--1299,	-- Brawler's Gold
	--1314,	-- Lingering Soul Fragment (Good luck with this one :D)
	--1342,	-- Legionfall War Supplies (Construction at the Broken Shore)
	--1355,	-- Felessence (Craft Legentary items)
	--1356,	-- Echoes of Battle (PvP Gear)
	--1357,	-- Echoes of Domination (Elite PvP Gear)
	--1416,	-- Coins of Air
	--1506,	-- Argus Waystone
	--1508,	-- Veiled Argunite
	--1533,	-- Wakening Essence

	-- BfA
	1560, 	-- War Resources
	1565,	-- Rich Azerite Fragment
	1580,	-- Seal of Wartorn Fate
	1587,	-- War Supplies
	1710,	-- Seafarer's Dubloon
	1718,	-- Titan Residuum
	1721,	-- Prismatic Manapearl
}

if E.myfaction == 'Alliance' then
	tinsert(currency, 1717)
elseif E.myfaction == 'Horde' then
	tinsert(currency, 1716)
end

-----------------------
-- Tooltip functions --
-----------------------

-- Dungeon coords
local function GetDungeonCoords(zone)
	local z, x, y = "", 0, 0;
	local dcoords
	
	if T:IsInstance(zone) then
		z, x, y = T:GetEntrancePortalLocation(zone);
	end
	
	if z == nil then
		dcoords = ""
	elseif E.db.locplus.ttcoords then
		x = tonumber(E:Round(x*100, 0))
		y = tonumber(E:Round(y*100, 0))		
		dcoords = format(" |cffffffff(%d, %d)|r", x, y)
	else 
		dcoords = ""
	end

	return dcoords
end

-- PvP/Raid filter
 local function PvPorRaidFilter(zone)
	local isPvP, isRaid;

	isPvP = nil;
	isRaid = nil;

	if(T:IsArena(zone) or T:IsBattleground(zone)) then
		if E.db.locplus.tthidepvp then
			return;
		end
		isPvP = true;
	end

	if(not isPvP and T:GetInstanceGroupSize(zone) >= 10) then
		if E.db.locplus.tthideraid then
			return
		end
		isRaid = true;
	end

	return (isPvP and "|cffff0000 "..PVP.."|r" or "")..(isRaid and "|cffff4400 "..RAID.."|r" or "")
end

-- Recommended zones
local function GetRecomZones(zone)
	local low, high = T:GetLevel(zone)
	local r, g, b = T:GetLevelColor(zone)
	local zContinent = T:GetContinent(zone)

	if PvPorRaidFilter(zone) == nil then return end

	GameTooltip:AddDoubleLine(
	"|cffffffff"..zone
	..PvPorRaidFilter(zone) or "",
	format("|cff%02xff00%s|r", continent == zContinent and 0 or 255, zContinent)
	..(" |cff%02x%02x%02x%s|r"):format(r *255, g *255, b *255,(low == high and low or ("%d-%d"):format(low, high))));
end

-- Dungeons in the zone
local function GetZoneDungeons(dungeon)
	local low, high = T:GetLevel(dungeon)
	local r, g, b = T:GetLevelColor(dungeon)
	local groupSize = T:GetInstanceGroupSize(dungeon)
	local altGroupSize = T:GetInstanceAltGroupSize(dungeon)
	local groupSizeStyle = (groupSize > 0 and format("|cFFFFFF00|r (%d", groupSize) or "")
	local altGroupSizeStyle = (altGroupSize > 0 and format("|cFFFFFF00|r/%d", altGroupSize) or "")
	local name = dungeon

	if PvPorRaidFilter(dungeon) == nil then return end

	GameTooltip:AddDoubleLine(
	"|cffffffff"..name
	..(groupSizeStyle or "")
	..(altGroupSizeStyle or "").."-"..PLAYER..") "
	..GetDungeonCoords(dungeon)
	..PvPorRaidFilter(dungeon) or "",
	("|cff%02x%02x%02x%s|r"):format(r *255, g *255, b *255,(low == high and low or ("%d-%d"):format(low, high))))
end

-- Recommended Dungeons
local function GetRecomDungeons(dungeon)
	local low, high = T:GetLevel(dungeon);	
	local r, g, b = T:GetLevelColor(dungeon);
	local instZone = T:GetInstanceZone(dungeon);
	local name = dungeon

	if PvPorRaidFilter(dungeon) == nil then return end

	if instZone == nil then
		instZone = ""
	else
		instZone = "|cFFFFA500 ("..instZone..")"
	end

	GameTooltip:AddDoubleLine(
	"|cffffffff"..name
	..instZone
	..GetDungeonCoords(dungeon)
	..PvPorRaidFilter(dungeon) or "",
	("|cff%02x%02x%02x%s|r"):format(r *255, g *255, b *255,(low == high and low or ("%d-%d"):format(low, high))))
end

-- Status
function LP:GetStatus(color)
	local status = ""
	local statusText
	local r, g, b = 1, 1, 0
	local pvpType = GetZonePVPInfo()
	local inInstance, _ = IsInInstance()

	if (pvpType == "sanctuary") then
		status = SANCTUARY_TERRITORY
		r, g, b = 0.41, 0.8, 0.94
	elseif(pvpType == "arena") then
		status = ARENA
		r, g, b = 1, 0.1, 0.1
	elseif(pvpType == "friendly") then
		status = FRIENDLY
		r, g, b = 0.1, 1, 0.1
	elseif(pvpType == "hostile") then
		status = HOSTILE
		r, g, b = 1, 0.1, 0.1
	elseif(pvpType == "contested") then
		status = CONTESTED_TERRITORY
		r, g, b = 1, 0.7, 0.10
	elseif(pvpType == "combat" ) then
		status = COMBAT
		r, g, b = 1, 0.1, 0.1
	elseif inInstance then
		status = AGGRO_WARNING_IN_INSTANCE
		r, g, b = 1, 0.1, 0.1
	else
		status = CONTESTED_TERRITORY
	end

	statusText = format("|cff%02x%02x%02x%s|r", r*255, g*255, b*255, status)

	if color then
		return r, g, b
	else
		return statusText
	end
end

-- Get Fishing Level
function LP:GetFishingLvl(minFish, ontt)
	local mapID = C_Map_GetBestMapForUnit("player")
	local zoneText = T:GetMapNameByIDAlt(mapID) or UNKNOWN;
	local uniqueZone = T:GetUniqueZoneNameForLookup(zoneText, continentID)
	local minFish = T:GetFishingLevel(uniqueZone)
	local _, _, _, fishing = GetProfessions()
	local r, g, b = 1, 0, 0
	local r1, g1, b1 = 1, 0, 0
	local dfish
	
	if minFish then
		if fishing ~= nil then
			local _, _, rank = GetProfessionInfo(fishing)
			if minFish < rank then
				r, g, b = 0, 1, 0
				r1, g1, b1 = 0, 1, 0
			elseif minFish == rank then
				r, g, b = 1, 1, 0
				r1, g1, b1 = 1, 1, 0
			end
		end
		
		dfish = format("|cff%02x%02x%02x%d|r", r*255, g*255, b*255, minFish)
		if ontt then
			return dfish
		else
			if E.db.locplus.showicon then
				return format(" (%s) ", dfish)..FISH_ICON
			else
				return format(" (%s) ", dfish)
			end
		end
	else
		return ""
	end
end

-- Zone level range
function LP:GetLevelRange(zoneText, ontt)
	local mapID = C_Map_GetBestMapForUnit("player")
	local zoneText = T:GetMapNameByIDAlt(mapID) or UNKNOWN;	
	local low, high = T:GetLevel(zoneText)
	local dlevel
	if low > 0 and high > 0 then
		local r, g, b = T:GetLevelColor(zoneText)
		if low ~= high then
			dlevel = format("|cff%02x%02x%02x%d-%d|r", r*255, g*255, b*255, low, high) or ""
		else
			dlevel = format("|cff%02x%02x%02x%d|r", r*255, g*255, b*255, high) or ""
		end

		if ontt then
			return dlevel
		else
			if E.db.locplus.showicon then
				dlevel = format(" (%s) ", dlevel)..LEVEL_ICON
			else
				dlevel = format(" (%s) ", dlevel)
			end
		end
	end

	return dlevel or ""
end

function LP:UpdateTooltip()
	local mapID = C_Map_GetBestMapForUnit("player")
	local zoneText = T:GetMapNameByIDAlt(mapID) or UNKNOWN;
	local curPos = (zoneText.." ") or "";

	GameTooltip:ClearLines()

	-- Zone
	GameTooltip:AddDoubleLine(L["Zone : "], zoneText, 1, 1, 1, selectioncolor)

	-- Continent
	GameTooltip:AddDoubleLine(CONTINENT.." : ", T:GetContinent(zoneText), 1, 1, 1, selectioncolor)

	-- Home
	GameTooltip:AddDoubleLine(HOME.." :", GetBindLocation(), 1, 1, 1, 0.41, 0.8, 0.94)

	-- Status
	if E.db.locplus.ttst then
		GameTooltip:AddDoubleLine(STATUS.." :", LP:GetStatus(false), 1, 1, 1)
	end

    -- Zone level range
	if E.db.locplus.ttlvl then
		local checklvl = LP:GetLevelRange(zoneText, true)
		if checklvl ~= "" then
			GameTooltip:AddDoubleLine(LEVEL_RANGE.." : ", checklvl, 1, 1, 1)
		end
	end

	-- Fishing
	if E.db.locplus.fish then
		local checkfish = LP:GetFishingLvl(true, true)
		if checkfish ~= "" then
			GameTooltip:AddDoubleLine(PROFESSIONS_FISHING.." : ", checkfish, 1, 1, 1)
		end
	end

	-- Recommended zones
	if E.db.locplus.ttreczones then
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["Recommended Zones :"], selectioncolor)
	
		for zone in T:IterateRecommendedZones() do
			GetRecomZones(zone);
		end		
	end

	-- Instances in the zone
	if E.db.locplus.ttinst and T:DoesZoneHaveInstances(zoneText) then 
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(curPos..DUNGEONS.." :", selectioncolor)
			
		for dungeon in T:IterateZoneInstances(zoneText) do
			GetZoneDungeons(dungeon);
		end	
	end

	-- Recommended Instances
	local level = UnitLevel('player')
	if E.db.locplus.ttrecinst and T:HasRecommendedInstances() and level >= 15 then
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["Recommended Dungeons :"], selectioncolor)
			
		for dungeon in T:IterateRecommendedInstances() do
			GetRecomDungeons(dungeon);
		end
	end

	-- Currency
	local numEntries = GetCurrencyListSize() -- Check for entries to disable the tooltip title when no currency
	if E.db.locplus.curr and numEntries > 0 then
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(TOKENS.." :", selectioncolor)

		for _, id in pairs(currency) do
			local name, amount, icon, _, _, totalMax = GetCurrencyInfo(id)

			if(name and amount > 0) then
				icon = ("|T%s:12:12:1:0|t"):format(icon)
				if totalMax == 0 then
					GameTooltip:AddDoubleLine(icon..format(" %s : ", name), format("%s", amount ), 1, 1, 1, selectioncolor)
				else
					GameTooltip:AddDoubleLine(icon..format(" %s : ", name), format("%s / %s", amount, totalMax ), 1, 1, 1, selectioncolor)
				end
			end
		end
	end

	-- Professions
	local prof1, prof2, archy, fishing, cooking, firstAid = GetProfessions()
	if E.db.locplus.prof and (prof1 or prof2 or archy or fishing or cooking or firstAid) then	
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(TRADE_SKILLS.." :", selectioncolor)
		
		local proftable = { GetProfessions() }
		for _, id in pairs(proftable) do
			local name, icon, rank, maxRank, _, _, _, rankModifier = GetProfessionInfo(id)

			if rank < maxRank or (not E.db.locplus.profcap) then
				icon = ("|T%s:12:12:1:0|t"):format(icon)
				if (rankModifier and rankModifier > 0) then
					GameTooltip:AddDoubleLine(format("%s %s :", icon, name), (format("%s |cFF6b8df4+ %s|r / %s", rank, rankModifier, maxRank)), 1, 1, 1, selectioncolor)				
				else
					GameTooltip:AddDoubleLine(format("%s %s :", icon, name), (format("%s / %s", rank, maxRank)), 1, 1, 1, selectioncolor)
				end
			end
		end
	end

	-- Hints
	if E.db.locplus.tt then
		if E.db.locplus.tthint then
			GameTooltip:AddLine(" ")
			GameTooltip:AddDoubleLine(L["Click : "], L["Toggle WorldMap"], 0.7, 0.7, 1, 0.7, 0.7, 1)
			GameTooltip:AddDoubleLine(L["RightClick : "], L["Toggle Configuration"],0.7, 0.7, 1, 0.7, 0.7, 1)
			GameTooltip:AddDoubleLine(L["ShiftClick : "], L["Send position to chat"],0.7, 0.7, 1, 0.7, 0.7, 1)
			GameTooltip:AddDoubleLine(L["CtrlClick : "], L["Toggle Datatexts"],0.7, 0.7, 1, 0.7, 0.7, 1)
		end
		GameTooltip:Show()
	else
		GameTooltip:Hide()
	end
end