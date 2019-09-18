-- debug, set debug level
-- 0: no debug, 1: minimal, 2: all
local debug = 0

-- Saved Variables
RebuffDB = {}

local AceGUI = LibStub("AceGUI-3.0")
Rebuff = LibStub("AceAddon-3.0"):NewAddon("Rebuff", "AceEvent-3.0")
local addonName, addon = ...
local ldb = LibStub("LibDataBroker-1.1")
local rebuffMinimapIcon = LibStub("LibDBIcon-1.0")
local db
local ttText = ""
local missingBuffs = {}


-- local LibClassicDurations = LibStub("LibClassicDurations")
-- LibClassicDurations:Register("Rebuff") -- tell library it's being used and should start working

-- hooksecurefunc("CompactUnitFrame_UtilSetBuff", function(buffFrame, unit, index, filter)
    -- local name, _, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitBuff(unit, index, filter);

    -- local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(unit, spellId, unitCaster)
    -- if duration == 0 and durationNew then
        -- duration = durationNew
        -- expirationTime = expirationTimeNew
    -- end

    -- local enabled = expirationTime and expirationTime ~= 0;
    -- if enabled then
        -- local startTime = expirationTime - duration;
        -- CooldownFrame_Set(buffFrame.cooldown, startTime, duration, true);
    -- else
        -- CooldownFrame_Clear(buffFrame.cooldown);
    -- end
-- end)



_G[addonName] = addon
addon.healthCheck = true

-- slash commands
SlashCmdList["Rebuff"] = function(inArgs)

	local wArgs = strtrim(inArgs)
	if wArgs == "" then
		--ShowUIPanel(rebuffFrame)
		print("usage: /Rebuff")
	elseif wArgs == "minimap 0" or wArgs == "minimap off" or wArgs == "minimap hide" then
		Rebuff:maptoggle("0")
	elseif wArgs == "minimap 1" or wArgs == "minimap on" or wArgs == "minimap show" then
		Rebuff:maptoggle("1")
	elseif wArgs == "config" then
		InterfaceOptionsFrame_OpenToCategory(rebuffPanel)
		InterfaceOptionsFrame_OpenToCategory(rebuffPanel)
	else
		print("usage: /Rebuff minimap 0|1|show|hide, config")
	end

end
SLASH_Rebuff1 = "/Rebuff"

-- Function to retrieve Saved Variables
function addon:getSV(category, variable)
	local vartbl = RebuffDB[category]
	
	if debug >= 1 then print("getSV:", category, variable) end
	
	if vartbl == nil then
		vartbl = {}
	end
	
	-- return the full table if no variable is given
	if variable == nil then
		return vartbl
	end
	
	if debug >= 1 then print("getSV:", vartbl[variable]) end
	
	-- return the requested variable
	if ( vartbl[variable] ~= nil ) then
		--print("getSV - " .. variable .. ": " .. vartbl[variable])
		return vartbl[variable]
	else
		return nil
	end
end

------------------
--- Main frame ---
------------------
rebuffConfig = CreateFrame("Frame", "rebuffFrame", UIParent)
rebuffConfig:SetMovable(true)
rebuffConfig:EnableMouse(true)
rebuffConfig:RegisterForDrag("LeftButton")
rebuffConfig:SetScript("OnDragStart", function(self) if IsShiftKeyDown() then self:StartMoving() end end)
--SetScript("OnDragStart", function(self) if IsShiftKeyDown() then self:StartMoving() end end)
rebuffConfig:SetScript("OnDragStop", rebuffConfig.StopMovingOrSizing)
-- SetPoint is done after ADDON_LOADED

rebuffFrame.texture = rebuffFrame:CreateTexture(nil, "BACKGROUND")
rebuffFrame.texture:SetAllPoints(rebuffFrame)
rebuffFrame:SetBackdrop({bgFile = [[Interface/Icons/Spell_Arcane_ArcaneResilience.blp]]})
--rebuffFrame:SetBackdropColor(0, 0, 0, 1)
rebuffFrame:SetSize(35, 35)
rebuffFrame:SetPoint("CENTER", UIParent, "CENTER", 200, 0)

rebuffFrame:SetScript("OnMouseUp", function (self, button)
    if button == "LeftButton" then
        
		-- If broadcast is enabled, spam the first 10 missing buffs to chat
		if addon:getSV("options", "broadcast") then 
			local channel = addon:getSV("options", "channel")
			
			addon:broadcastText("Missing Buffs:", channel)
			
			-- No missing buffs
			if #missingBuffs == 0 then
				addon:broadcastText("None!", channel)
			
			-- 10 or fewer missing buffs
			elseif #missingBuffs <= 10 then
				for i = 1, #missingBuffs do
					addon:broadcastText(missingBuffs[i], channel)
				end
			
			-- More than 10 buffs missing
			else
				for i = 1, 10 do
					addon:broadcastText(missingBuffs[i], channel)
				end
				--local more = "...and" .. #missingBuffs - 10 ..  "more"
				addon:broadcastText("...and " .. #missingBuffs - 10 ..  " more", channel)
			end
		end
    elseif button == "RightButton" then
		InterfaceOptionsFrame_OpenToCategory(rebuffPanel)
		InterfaceOptionsFrame_OpenToCategory(rebuffPanel)
	end
end)

-- rebuffFrame.tf = rebuffFrame:CreateFontString(nil, "OVERLAY")
-- rebuffFrame.tf:SetPoint("CENTER", rebuffFrame, "CENTER", 0, 0)
-- rebuffFrame.tf:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
-- rebuffFrame.tf:SetJustifyH("CENTER")
-- rebuffFrame.tf:SetShadowOffset(1, -1)
-- rebuffFrame.tf:SetTextColor(1, 1, 1)
-- rebuffFrame.tf:SetText("/Rebuff lock")

rebuffFrame:SetScript("OnEnter",function(self,motion)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("BOTTOM", rebuffFrame, "TOP", 10, 5)
	local pname, idx = "", 1
	local showOnlyOnce = Rebuff:getSV("options", "onlyOnce")
	local pname = ""
	missingBuffs = {}
	if GetNumGroupMembers() == 0 then
		idx = 0
	end
	
	-- Check each player in the group/raid
	for groupIndex = idx, GetNumGroupMembers(), 1 do
		local pbuffs, subgroup, online, isDead, missingBuffCount = {}, 0, true, false, 0
		
		-- Check if solo (though not very useful outside of testing)
		if groupIndex == 0 then
			pname = UnitName("player")
			subgroup = 1
		else
			pname = GetRaidRosterInfo(groupIndex)
			_, _, subgroup, _, _, _, _, online, isDead = GetRaidRosterInfo(groupIndex)
		end
		
		--print(pname)
		

		-- Check to see if this group is on the watchlist
		if addon:getSV("groups", "g" .. subgroup) then

			local _, pclass = UnitClass(pname)
			local _, _, _, pcolor = GetClassColor(pclass)
			if addon:getSV("tanks", pname) then
				if debug >= 1 then print(pname, "is a tank") end
				pclass = "TANK"
			end
			pbuffs = addon:getSV("classbuffs", pclass)
			
			-- for k,v in pairs(pbuffs) do
				-- print(v)
			-- end

			-- Do not check for buffs if the player is offline
			if online then
				if pbuffs ~= nil then
					local buffCheck, buffTimes, buffTable = {}, {}, {}
					buffCheck, buffTimes = addon:checkBuffs(pname, pbuffs)

					for i = 1, #buffCheck, 1 do
						if #missingBuffs == nil then
							idx = 1
						else
							idx = #missingBuffs + 1
						end

						-- # is just a separator character to use for string split later
						if showOnlyOnce then
							missingBuffs[idx] = buffCheck[i] .. "#|r    g" .. subgroup .. ":  |c" .. pcolor .. pname .. "|r"
						else
							missingBuffs[idx] = buffCheck[i] .. " - |c" .. pcolor .. pname .. "|r (g" .. subgroup .. ")"
						end
					end
				end
			else
				-- Flag as offline
				if #missingBuffs == nil then
					idx = 1
				else
					idx = #missingBuffs + 1
				end
						
				if showOnlyOnce then
					missingBuffs[idx] = "|cffff0000 Offline|r#|cffff0000   g" .. subgroup .. ":|r  |c" .. pcolor .. pname .. "|r"
				else
					missingBuffs[idx] = "|cffff6666 Offline|r" .. " - |c" .. pcolor .. pname .. "|r |cffff6666(g" .. subgroup .. ")|r"
				end
			end
		end
	end

	-- Compile missing buffs into a list to display
	if #missingBuffs <= 0 then
		GameTooltip:AddLine("|cff00ff00No missing buffs|r")
	else
		GameTooltip:AddLine("|cffff5521Missing Buffs:|r")
		table.sort(missingBuffs)
		
		-- Check if buff names should be shown only once or on every line
		if showOnlyOnce then
			local buffName, person = string.split("#", missingBuffs[1])
			GameTooltip:AddLine(buffName)
			local newBuffName = buffName

			for i = 1, #missingBuffs, 1 do
				newBuffName, person = string.split("#", missingBuffs[i])
				if newBuffName ~= buffName then
					GameTooltip:AddLine(newBuffName)
					buffName = newBuffName
				end
				GameTooltip:AddLine(person)
			end

		else
			local buffName = string.split("|", missingBuffs[1])
			for i = 1, #missingBuffs, 1 do
				local newBuffName = string.split("|", missingBuffs[i])
				if newBuffName ~= buffName then
					GameTooltip:AddLine(" ")
					buffName = newBuffName
				end
				GameTooltip:AddLine(missingBuffs[i])
			end
		end
	end
	GameTooltip:Show()
end)

rebuffFrame:SetScript("OnLeave",function(self,motion)
	GameTooltip:Hide()
end)



----------------------------
---        Events        ---
----------------------------
local function onevent(self, event, prefix, msg, channel, sender, ...)
	--print(event)
	
	-- Stuff to do after addon is loaded
	if(event == "ADDON_LOADED" and prefix == "Rebuff") then
		-- Get anchor position
		--local relativePoint, xPos, yPos = addon:getAnchorPosition("position")
		--rebuffConfig:SetSize(180, 16)
		--rebuffConfig:SetPoint(relativePoint, UIParent, relativePoint, xPos, yPos)
		--rebuffConfig:Hide()
		-- local pbuffs = {}
		-- local pname = "Moxie"
		-- pbuffs[1461] = 1
		
		-- local buffCheck, buffTimes = addon:checkBuffs(pname, pbuffs)
		-- ttText = ""
		-- for i = 1, #buffCheck, 1 do
			-- print(buffCheck[i], buffTimes[i])
			-- ttText = ttText .. buffCheck[i] .. pname .. buffTimes[i] .. "\n"
		-- end

		local iconSize = Rebuff:getSV("options", "size") or 35
		--if iconSize == "" then iconSize = 35 end
		rebuffFrame:SetSize(iconSize, iconSize)
		
		------------------
		-- Data Broker ---
		------------------
		local lockStatus = 1
		db = LibStub("AceDB-3.0"):New("RebuffDB", SettingsDefaults)
		RebuffDB.db = db;
		RebuffMinimapData = ldb:NewDataObject("Rebuff",{
			type = "data source",
			text = "Rebuff",
			icon = "Interface/Icons/Spell_Holy_GreaterBlessingofSanctuary.blp",
			OnClick = function(self, button)
				if button == "RightButton" then
					if IsShiftKeyDown() then
						Rebuff:maptoggle("0")
						print("Rebuff: Hiding icon, re-enable with: /rebuff minimap 1")
					else
						InterfaceOptionsFrame_OpenToCategory(rebuffPanel)
						InterfaceOptionsFrame_OpenToCategory(rebuffPanel)
					end
				elseif button == "LeftButton" then
					if IsShiftKeyDown() then
						if critFrame:IsVisible() then
							critFrame:Hide()
						else
							local relativePoint, xPos, yPos = addon:getAnchorPosition("critFrame")
							critFrame:SetPoint(relativePoint, UIParent, relativePoint, xPos, yPos)
							critFrame:Show()
							
						end
					else
						if lockStatus == 1 then
							rebuffConfig:Show()
							--local relativePoint, xPos, yPos = addon:getAnchorPosition("position")
							lockStatus = 0
						else
							rebuffConfig:Hide()
							local _, _, relativePoint, xPos, yPos = rebuffConfig:GetPoint()
							addon:setAnchorPosition("position", relativePoint, xPos, yPos)
							--rebuffbar:SetPoint(relativePoint, UIParent, relativePoint, xPos, yPos)
							lockStatus = 1
						end
					end
				end
			end,
			
			-- Minimap Icon tooltip
			OnTooltipShow = function(tooltip)
				tooltip:AddLine("|cffff0000Rebuff|r\n|cffffffffLeft-click:|r broadcast missing buffs.\n|cffffffffRight-click:|r open options.\n|cffffffffShift+Right-click:|r hide minimap icon.")
			end,
		})
		
		-- display the minimap icon?
		local mmap = addon:getSV("minimap", "icon")
		if mmap == 1 then
			rebuffMinimapIcon:Register("rebuffIcon", RebuffMinimapData, RebuffDB)
			addon:maptoggle(1)
		else
			addon:maptoggle(0)
		end
	end
	
	-- Show or hide the frame based on group type settings
	if event == "PLAYER_ENTERING_WORLD" or event == "GROUP_ROSTER_UPDATE" then
		--print("group changed, do stuff")
		addon:toggleByGroupSize()
	end
	
	-- Hide the frame when player enters combat, if options is enabled
	if event == "PLAYER_REGEN_DISABLED" and addon:getSV("options", "hide") then
		rebuffFrame:Hide()
	end
	
	-- Show the frame when player exits combat, if options is enabled
	if event == "PLAYER_REGEN_ENABLED" and addon:getSV("options", "hide") then
		rebuffFrame:Show()
	end
end
	
	

-------------------------
---     Functions     ---
-------------------------

-- function addon:checkBuffs(pname, buffList)
	-- local buffs, times, i, j = { }, { }, 1, 1
	-- print(pname, "=================")
	-- for i = 1, #buffList, 1 do
		-- j = 1
		-- if buffList[i] ~= nil then
			-- local buff1, buff2 = string.split(",", buffList[i])
			-- --local buff, _, _, _, _, expTime, _, _, _, spellID = UnitBuff(pname, j)
			
			-- local name, _, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitBuff(pname, j);
			-- print("checking for", GetSpellInfo(buff1))
			-- local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(pname, buff1)
			-- if duration == 0 and durationNew then
				-- duration = durationNew
				-- expirationTime = expirationTimeNew
			-- end
			
			-- print(buff1, duration, durationNew, expirationTime)

			-- --local buff, _, _, _, _, expTime, _, _, _, spellID = UnitBuff(pname, j)
			
			-- buffs[#buffs + 1] = GetSpellInfo(buff1)
			-- times[#times + 1] = "|cffff0000missing|r"

			-- buff1 = tonumber(buff1)
			-- spellID = tonumber(spellID)
			
			-- --print(buff1)

			-- while name do
				-- if buff1 == spellId then
					-- print("match", buff1)
					-- times[#times] = addon:SecondsToClock(expirationTime - GetTime())
					-- print(buff1, duration, durationNew, expirationTime)
				-- end
				-- j = j + 1;
				-- --buff, _, _, _, _, expTime, _, _, _, spellID = UnitBuff(pname, j)
				-- name, _, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitBuff(pname, j);
				-- --print(name, duration, expirationTime)
				-- durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(pname, buff1)
				-- if duration == 0 and durationNew then
					-- duration = durationNew
					-- expirationTime = expirationTimeNew
				-- end
				
-- --				print(buff1, duration, expirationTime)
				-- --duration, expirationTime, durationNew, expirationTimeNew = 0, 0, 0, 0
				
				-- --print(duration, expirationTime)
			-- end
		-- end
	-- end

	-- return buffs, times
-- end



function addon:checkBuffs(pname, buffList)
	local buff1, buff2, buffs, times, i, j, added, useShortName, buffToCheck = nil, nil, {}, {}, 1, 1, nil, 0, nil

	-- Loop through each buff in the list of buffs to check for this player
	for k,buffToCheck in pairs(buffList) do
		j = 1
		local found = 0

		buff1, buff2 = string.split(",", buffToCheck)
		local buff, _, _, _, _, expTime, _, _, _, spellID = UnitBuff(pname, j)

		
		-- buffs[#buffs + 1] = GetSpellInfo(buff1)
		-- times[#times + 1] = "|cffff0000missing|r"

		buff1 = tonumber(buff1)
		buff2 = tonumber(buff2)
		spellID = tonumber(spellID)
		
		if ( debug == 1 ) then print(buff1, buff2) end

		while buff do
			if buff1 == spellID or buff2 == spellID then
				--print("match", buff1)
				--times[#times] = addon:SecondsToClock(expTime - GetTime())
				found = 1
			end
			j = j + 1;
			buff, _, _, _, _, expTime, _, _, _, spellID = UnitBuff(pname, j)
		end

		-- Add missing buff to the list, if it hasn't already been added for this player (not sure why that happens)
		if found == 0 and buff1 ~= added then
			-- check for custom name
			local shortName = addon:getSV("shortnames", buffToCheck)

			if shortName ~= nil and shortName ~= "" then
				buffs[#buffs + 1] = addon:getSV("shortnames", buffToCheck) or GetSpellInfo(buff1)
			else
				buffs[#buffs + 1] = GetSpellInfo(buff1)
			end
			times[#times + 1] = "|cffff0000missing|r"
			added = buff1
		end
	end

	return buffs, times
end

-- function addon:SecondsToClock(seconds)
  -- local seconds = tonumber(seconds)

  -- if seconds <= 0 then
    -- return "00:00:00";
  -- else
    -- hours = string.format("%02.f", math.floor(seconds/3600));
    -- mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
    -- secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
    -- return mins..":"..secs
  -- end
-- end


-- Minimap toggle function
function addon:maptoggle(mtoggle)
	if ( debug == 1 ) then print("icon state: " .. mtoggle) end
	
	local mmTbl = {
		icon = mtoggle
	}
	
	RebuffDB["minimap"] = mmTbl
	
	if mtoggle == "0" or mtoggle == 0 then
		if ( debug >= 1 ) then print("hiding icon") end
		rebuffMinimapIcon:Hide("rebuffIcon")
	else
		if (rebuffMinimapIcon:IsRegistered("rebuffIcon")) then
			rebuffMinimapIcon:Show("rebuffIcon")
		else
			rebuffMinimapIcon:Register("rebuffIcon", RebuffMinimapData, RebuffDB)
			rebuffMinimapIcon:Show("rebuffIcon")
		end
	end
end



-- -- Get Anchor Postion
function addon:getAnchorPosition(anchor)
	local posTbl = RebuffDB[anchor]

	if posTbl == nil then
		return "CENTER", 0, 0
	else
		-- Table exists, get the value if it is defined
		relativePoint = posTbl["relativePoint"] or "CENTER"
		xPos = posTbl["xPos"] or "-100"
		yPos = posTbl["yPos"] or "0"
		return relativePoint, xPos, yPos
	end
end

function addon:setAnchorPosition(anchor, relativePoint, XPos, YPos)
	posTbl = {
		relativePoint = relativePoint,
		xPos = XPos,
		yPos = YPos,
	}

	RebuffDB[anchor] = posTbl
end


function addon:toggleByGroupSize()
	if IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if debug >= 1 then print("Raid") end
		if addon:getSV("options", "raid") then
			rebuffFrame:Show()
		else
			rebuffFrame:Hide()
		end
	elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
		if debug >= 1 then print("Party") end
		if addon:getSV("options", "party") then
			rebuffFrame:Show()
		else
			rebuffFrame:Hide()
		end
	else
		if debug >= 1 then print("Solo") end
		if addon:getSV("options", "solo") then
			rebuffFrame:Show()
		else
			rebuffFrame:Hide()
		end
	end
end

function addon:broadcastText(txt, channel)
	-- strip off color formatting
	text = string.gsub(txt, "|c........", "")
	text = string.gsub(text, "|r", "")
	text = string.gsub(text, "###.*", "")

	if  (text ~= nil) then
		-- Strip off trailing commas (added by player buttons)
		if string.match(channel, "RAID") or string.match(channel, "PARTY") or string.match(channel, "SAY") then
			SendChatMessage(text, channel)
		else
			SendChatMessage(text, CHANNEL, nil, GetChannelName(channel))
		end
	end
end

-- function addon:getClassBuffs(class)
	-- print("Get saved values for", class)
	-- local class buffs Rebuff:getSV("classbuffs", classes[i])
-- end

---------------------
-- Register Events --
---------------------
rebuffConfig:RegisterEvent("ADDON_LOADED")
rebuffConfig:RegisterEvent("PLAYER_ENTERING_WORLD")
rebuffConfig:RegisterEvent("GROUP_ROSTER_UPDATE")
rebuffConfig:RegisterEvent("PLAYER_REGEN_DISABLED")
rebuffConfig:RegisterEvent("PLAYER_REGEN_ENABLED")
rebuffConfig:SetScript("OnEvent", onevent)