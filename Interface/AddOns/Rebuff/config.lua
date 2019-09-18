local addonName, addon = ...
local debug = 0
local AceGUI = LibStub("AceGUI-3.0")
local playerFaction = UnitFactionGroup("player")

local classBuffs, classBuffList, checkBoxes, buffIcons, groupCheckBoxes, tankBoxes, classes, class, channel = {}, {}, {}, {}, {}, {}, {}, "ALL", nil
local allBuffs = {}
local tankBuffs = {}
local druidBuffs = {}
local hunterBuffs = {}
local mageBuffs = {}
local priestBuffs = {}
local paladinBuffs = {}
local rogueBuffs = {}
local shamanBuffs = {}
local warlockBuffs = {}
local warriorBuffs = {}
local shortNameBoxes = {}

-- Main options panel
rebuffPanel = CreateFrame("Frame")
rebuffPanel.name = addonName
InterfaceOptions_AddCategory(rebuffPanel)

local title = rebuffPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText(addonName)

-- local rebuffPanelText = rebuffPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
-- rebuffPanelText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
-- rebuffPanelText:SetText("Rebuff Options")

local usageText = rebuffPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
usageText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -65)
usageText:SetJustifyH("LEFT")
usageText:SetText("Set up class-specific buff monitoring.")


-------------------------------------------
-- Checkbox to show buff names only once --
-------------------------------------------
local onlyOnceBox = CreateFrame("CheckButton", "onlyOnceBox_GlobalName", rebuffPanel, "InterfaceOptionsCheckButtonTemplate")
onlyOnceBox_GlobalNameText:SetText("Show buff names once")
onlyOnceBox.tooltipText = "Only show each buff name once"
onlyOnceBox:SetPoint("TOPLEFT", rebuffPanel, "TOPLEFT", 20, -40)
-- check is set after ADDON_LOADED

------------------------------------------
-- Checkbox to enable/disable broadcast --
------------------------------------------
local broadcastEnable = CreateFrame("CheckButton", "broadcastEnable_GlobalName", rebuffPanel, "InterfaceOptionsCheckButtonTemplate")
broadcastEnable_GlobalNameText:SetText("Enable broadcast")
broadcastEnable.tooltipText = "Enable or disable broadcasting missing buffs"
broadcastEnable:SetPoint("TOPLEFT", rebuffPanel, "TOPLEFT", 430, -40)
-- check is set after ADDON_LOADED

----------------------------------------
-- Checkboxes to enable by group type --
----------------------------------------
-- Setup is completed after ADDON_LOADED, after tank boxes
local enableSolo = CreateFrame("CheckButton", "enableSolo_GlobalName", rebuffPanel, "InterfaceOptionsCheckButtonTemplate")
local enableParty = CreateFrame("CheckButton", "enableParty_GlobalName", rebuffPanel, "InterfaceOptionsCheckButtonTemplate")
local enableRaid = CreateFrame("CheckButton", "enableRaid_GlobalName", rebuffPanel, "InterfaceOptionsCheckButtonTemplate")

--------------------------------------
-- Checkbox to hide while in combat --
--------------------------------------
local hideInCombat = CreateFrame("CheckButton", "hideInCombat_GlobalName", rebuffPanel, "InterfaceOptionsCheckButtonTemplate")
hideInCombat_GlobalNameText:SetText("Hide in combat")
hideInCombat.tooltipText = "Hide the buff frame while in combat"
hideInCombat:SetPoint("TOPLEFT", rebuffPanel, "TOPLEFT", 230, -40)
-- check is set after ADDON_LOADED

local sizeBox = CreateFrame("EditBox", nil, rebuffPanel, "InputBoxTemplate")

------------------
--    Events    --
------------------
local function onevent(self, event, arg1, ...)
	if(event == "ADDON_LOADED" and arg1 == "Rebuff") then
		
		if Rebuff:getSV("options", "onlyOnce") then onlyOnceBox:SetChecked(true) end
		if Rebuff:getSV("options", "broadcast") then broadcastEnable:SetChecked(true) end
		if Rebuff:getSV("options", "hide") then hideInCombat:SetChecked(true) end
		
		----------------------------------------
		-- Drop Down Menu broadcast channels ---
		-----------------------------------------
		channel = Rebuff:getSV("options", "channel") or "RAID"
		
		if not rebuffBroadcastChannels then
		   CreateFrame("Button", "rebuffBroadcastChannels", rebuffPanel, "UIDropDownMenuTemplate")
		end
		 
		rebuffBroadcastChannels:ClearAllPoints()
		rebuffBroadcastChannels:SetPoint("TOPRIGHT", rebuffPanel, "TOPRIGHT", -40, -65)
		rebuffBroadcastChannels:Show()

		-- list of choices
		local channelTbl = {
			channel,
			"RAID",
			"PARTY",
			"SAY",
		}
		
		--rebuffBroadcastChannels:SetText("test")

		local customChannels = ""
		for i = 1, 10 do	-- i have no clue how many channels you're allowed to be in at once so i just put 10
			local chanID, chanName = GetChannelName(i)
			if chanName ~= nil then
				if not string.match(chanName, "LookingForGroup") then
					--print(chanName)
					--customChannels = customChannels .. chanName .. ","
					table.insert(channelTbl, chanName)
				end
			end
		end

		-- return dropdown selection
		local function OnClick(self)
			UIDropDownMenu_SetSelectedID(rebuffBroadcastChannels, self:GetID(), text, value)
			channel = self.value
			if ( debug == 2 ) then print(channel) end
			return channel
		end

		-- dropdown box properties
		local function initialize(self, level)
			local info = UIDropDownMenu_CreateInfo()
			for k,v in pairs(channelTbl) do
				info = UIDropDownMenu_CreateInfo()
				info.text = v
				info.value = v
				info.func = OnClick
				UIDropDownMenu_AddButton(info, level)
			end
		end

		UIDropDownMenu_Initialize(rebuffBroadcastChannels, initialize)
		UIDropDownMenu_SetWidth(rebuffBroadcastChannels, 100);
		UIDropDownMenu_SetButtonWidth(rebuffBroadcastChannels, 124)
		UIDropDownMenu_SetSelectedID(rebuffBroadcastChannels, 1)
		UIDropDownMenu_JustifyText(rebuffBroadcastChannels, "LEFT")


		-----------------------------------
		--- Drop Down Menu for Classes  ---
		-----------------------------------
		if not classSelect then
		   CreateFrame("Button", "classSelect", rebuffPanel, "UIDropDownMenuTemplate")
		end
		 
		classSelect:ClearAllPoints()
		classSelect:SetPoint("TOPLEfT", rebuffPanel, 0, -140)
		classSelect:Show()

		-- list of choices
		local classes = {}
		if playerFaction == "Alliance" then
			classes = {
				"ALL",
				"TANK",
				"DRUID",
				"HUNTER",
				"MAGE",
				"PALADIN",
				"PRIEST",
				"ROGUE",
				"WARLOCK",
				"WARRIOR",
			}
		else
			classes = {
				"ALL",
				"TANK",
				"DRUID",
				"HUNTER",
				"MAGE",
				"PRIEST",
				"ROGUE",
				"SHAMAN",
				"WARLOCK",
				"WARRIOR",
			}
		end

		-- return dropdown selection
		local function OnClick(self)
			UIDropDownMenu_SetSelectedID(classSelect, self:GetID(), text, value)
			class = self.value
			if ( debug == 2 ) then print(class) end
			--updateBox(class)
			--addon:storeClassBuffs(class)
			Rebuff:getClassBuffs(class)
			return class
		end

		-- dropdown box properties
		local function initialize(self, level)
			local info = UIDropDownMenu_CreateInfo()
			for k,v in pairs(classes) do
				info = UIDropDownMenu_CreateInfo()
				info.text = v
				info.value = v
				info.func = OnClick
				UIDropDownMenu_AddButton(info, level)
			end
		end

		UIDropDownMenu_Initialize(classSelect, initialize)
		UIDropDownMenu_SetWidth(classSelect, 100);
		UIDropDownMenu_SetButtonWidth(classSelect, 124)
		UIDropDownMenu_SetSelectedID(classSelect, 1)
		UIDropDownMenu_JustifyText(classSelect, "LEFT")
		
		
		-- Buffs --
		-- 10157 = Arcane Intellect (1461 = rank 3 for testing)
		-- 23028 = Arcane Brilliance
		-- 10938 = Power Word: Fortitude
		-- 21564 = Prayer of Fortitude
		-- 10958 = Shadow Protection
		-- 27683 = Prayer of Shadow Protection
		-- 27841 = Divine Spirit
		-- 27681 = Prayer of Spirit
		-- 9885 = Mark of the Wild (8907 for testing)
		-- 21850 = Gift of the Wild
		-- 20217 = Blessing of Kings
		-- 25898 = Greater Blessing of Kings
		-- 25291 = Blessing of Might
		-- 25916 = Greater Blessing of Might
		-- 1038 = Blessing of Salvation
		-- 25895 = Greater Blessing of Salvation
		-- 25290 = Blessing of Wisdom
		-- 25918 = Greater Blessing of Wisdom
		-- 20914 = Blessing of Sanctuary
		-- 25899 = Greater Blessing of Sanctuary
		

		if playerFaction == "Alliance" then
			classBuffList = {"10157,23028", "10938,21564", "10958,27683", "27841,27681", "9885,21850", "20217,25898", "25291,25916", "1038,25895", "25290,25918", "20914,25899"}
			--classBuffList = {"6673", "1459", "203539", "21562", "133539", "235313", "158486", "130", "118", "87946"}; -- retail testing
		else
			classBuffList = {"10157,23028", "10938,21564", "10958,27683", "27841,27681", "9885,21850"}
		end
		
		-- Load buffs to watch for each class
		for i = 1, 10 do
			classBuffs[classes[i]] = Rebuff:getSV("classbuffs", classes[i])
		end
		
		-- for k,v in pairs(classBuffs) do
			-- print(k, v)
		-- end
		
		local xoffset, yoffset = 75, -180
		local buffName1, buffName2, spellIcon = nil, nil, nil
		
		-- Create checkboxes for each buff in the classBuffList table
		for i = 1, #classBuffList, 1 do

			local buff1, buff2 = string.split(",", classBuffList[i])
			buffName1, _, spellIcon = GetSpellInfo(buff1)
			buffName2 = GetSpellInfo(buff2) or buffName1
			
			-- Icons for buffs
			local buffIcon = CreateFrame("Button", nil, rebuffPanel)
			buffIcon:SetSize(25,25)
			buffIcon:SetPoint("TOPLEFT", rebuffPanel, "TOPLEFT", xoffset, yoffset)
			buffIcon.t = buffIcon:CreateTexture(nil, "BACKGROUND")
			buffIcon.t:SetTexture(spellIcon)
			buffIcon.t:SetAllPoints()
			buffIcons[i] = buffIcon
			
			
			-- Create the checkbuttons
			local boxName = classBuffList[i] .. "_GlobalName"
			local checkBox = CreateFrame("CheckButton", boxName, rebuffPanel, "InterfaceOptionsCheckButtonTemplate")
			checkBox.tooltipText = buffName1 .. " / " .. buffName2
			checkBox:SetSize(35, 35)
			checkBox:SetHitRectInsets(0, 0, 0, 0)
			checkBoxes[i] = checkBox
			
			checkBoxes[i]:SetPoint("LEFT", buffIcons[i], "RIGHT", 3, 0)
			
			-- Update list of buffs when a box is checked or unchecked
			checkBoxes[i]:SetScript("OnClick", 
				function()
					addon:storeClassBuffs(class, i)
				end
			);
			
			---------------------------------------------------
			-- Textboxes for short (or alternate) buff names --
			---------------------------------------------------
			-- Pull the names from Saved Variables if they exist
			local snText = Rebuff:getSV("shortnames", tonumber(buff1)) or ""
			local shortNameBox = CreateFrame("EditBox", nil, rebuffPanel, "InputBoxTemplate")
			shortNameBox:SetWidth(120)
			shortNameBox:SetHeight(30)
			shortNameBox:SetPoint("LEFT", checkBox, "RIGHT", 30, 0)
			shortNameBox:SetMaxLetters(100)
			shortNameBox:SetHyperlinksEnabled(false)
			shortNameBox:SetText(snText)
			shortNameBox:SetAutoFocus(false)
			shortNameBox:SetCursorPosition(0)
			shortNameBoxes[i] = shortNameBox
		
			yoffset = yoffset - 30
		end
		
		-- Header for Custom Name boxes
		local usageText2 = rebuffPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		usageText2:SetPoint("BOTTOM", shortNameBoxes[1], "TOP", 0, 1)
		usageText2:SetJustifyH("CENTER")
		usageText2:SetText("Custom Name")
		
		-- Header for Groups
		local groupsText = rebuffPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		groupsText:SetPoint("LEFT", usageText2, "RIGHT", 50, 0)
		groupsText:SetJustifyH("CENTER")
		groupsText:SetText("Groups")
		
		
		-- Make a table of tank names to use below
		local tanks = Rebuff:getSV("tanks", nil) or {}
		local t, tankList = 1, {}
		for k,v in pairs(tanks) do
			tankList[t] = k
			t = t + 1
		end
		
		yoffset = -5
		for i = 1, 8 do
			--------------------------------------
			-- Checkboxes for groups to monitor --
			--------------------------------------
			local boxName = "group" .. i .. "_GlobalName"
			local checkBox = CreateFrame("CheckButton", boxName, rebuffPanel, "InterfaceOptionsCheckButtonTemplate")
			checkBox:SetSize(35, 35)
			checkBox:SetHitRectInsets(0, 0, 0, 0)
			checkBox:SetPoint("TOP", groupsText, "BOTTOM", 0, yoffset)
			
			-- get saved checkbox state
			if Rebuff:getSV("groups", "g" .. i) then
				checkBox:SetChecked(true)
			end
			
			-- add checkboxes to table, add label
			groupCheckBoxes[i] = checkBox
			getglobal(checkBox:GetName() .. 'Text'):SetText(i)	
			
			-------------------------
			-- Textboxes for Tanks --
			-------------------------
			-- Pull the names from Saved Variables if they exist
			local tank = Rebuff:getSV("tanks", i) or ""
			local tankBox = CreateFrame("EditBox", nil, rebuffPanel, "InputBoxTemplate")
			tankBox:SetWidth(120)
			tankBox:SetHeight(30)
			tankBox:SetPoint("LEFT", groupCheckBoxes[i], "RIGHT", 60, 0)
			tankBox:SetMaxLetters(100)
			tankBox:SetHyperlinksEnabled(false)
			if tankList[i] then
				tankBox:SetText(tankList[i])
			end
			tankBox:SetAutoFocus(false)
			tankBox:SetCursorPosition(0)
			tankBoxes[i] = tankBox
			
			yoffset = yoffset - 30
		end
		
		-- Header for Tanks
		local tanksText = rebuffPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		tanksText:SetPoint("LEFT", groupsText, "RIGHT", 90, 0)
		tanksText:SetJustifyH("CENTER")
		tanksText:SetText("Tanks")

		-- Load initial list of checkboxes with ALL
		Rebuff:getClassBuffs("ALL")
		
		-------------------------
		--- Store class buffs ---
		-------------------------
		function addon:storeClassBuffs(class, idx)
			if class == "ALL" then
				-- loop through every class + ALL + TANK (10 per faction)
				for j = 1, 10 do
					local saveClass = classes[j]
					local storeBuffs = Rebuff:getSV("classbuffs", saveClass)
					if storeBuffs == nil then
						storeBuffs = {}
					end
					
					-- set buff to true for every class
					if checkBoxes[idx]:GetChecked() then
						storeBuffs[idx] = classBuffList[idx]
					-- set buff to false for every class
					else
						storeBuffs[idx] = nil
					end
					
					-- save class buffs
					classBuffs[saveClass] = storeBuffs
				end
			else
				local storeBuffs = {}
				
				-- Get the state of all checkboxes every time one is changed for that class
				for i = 1, #classBuffList do
					if checkBoxes[i]:GetChecked() then
						-- box is checked, put this buff on the list
						storeBuffs[i] = classBuffList[i]
					else
						-- box is unchecked, remove it from the class list and the ALL list
						storeBuffs[i] = nil
						allBuffs = Rebuff:getSV("classbuffs", "ALL") or {}
						allBuffs[i] = nil
					end
				end
				
				-- Save results
				classBuffs[class] = storeBuffs
			end
		end
		
	end
	
	--------------------------
	-- Enable by group type --
	--------------------------
	-- Header for group types
	local groupTypeText = rebuffPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	groupTypeText:SetPoint("TOP", tankBoxes[8], "BOTTOM", 0, -20)
	groupTypeText:SetJustifyH("CENTER")
	groupTypeText:SetText("Enable while:")
	
	-- Initial checkbox creation happens at the start before the events
	-- Solo
	enableSolo_GlobalNameText:SetText("Solo")
	enableSolo.tooltipText = "Show frame while solo"
	enableSolo:SetPoint("TOPLEFT", groupTypeText, "BOTTOMLEFT", 5, -4)
	if Rebuff:getSV("options", "solo") then enableSolo:SetChecked(true) end
	
	-- Party
	enableParty_GlobalNameText:SetText("Party")
	enableParty.tooltipText = "Show frame while in a party"
	enableParty:SetPoint("TOP", enableSolo, "BOTTOM", 0, 2)
	if Rebuff:getSV("options", "party") then enableParty:SetChecked(true) end
	
	-- Raid
	enableRaid_GlobalNameText:SetText("Raid")
	enableRaid.tooltipText = "Show frame while in a raid"
	enableRaid:SetPoint("TOP", enableParty, "BOTTOM", 0, 2)
	if Rebuff:getSV("options", "raid") then enableRaid:SetChecked(true) end
	
	
	---------------
	-- Icon Size --
	---------------
	local size = Rebuff:getSV("options", "size") or 35
	--initial sizeBox creation is done at the start, needs to be local to the entire file
	sizeBox:SetWidth(30)
	sizeBox:SetHeight(35)
	sizeBox:SetPoint("TOPRIGHT", shortNameBoxes[1], "BOTTOMRIGHT", 0, -290)
	sizeBox:SetMaxLetters(100)
	sizeBox:SetHyperlinksEnabled(false)
	sizeBox:SetText(size)
	sizeBox:SetAutoFocus(false)
	sizeBox:SetCursorPosition(0)
	
	sizeBox.Label = sizeBox:CreateFontString(nil , "BORDER", "GameFontHighlight")
    sizeBox.Label:SetJustifyH("RIGHT")
    sizeBox.Label:SetPoint("RIGHT", sizeBox, "LEFT", -10, 0)
	sizeBox.Label:SetText("Icon size:")
end

--------------------------------------------------
--- Save items when the Okay button is pressed ---
--------------------------------------------------
rebuffPanel.okay = function (self)
	if debug >= 1 then print("saving...") end

	-- Store buffs assigned for each class
	RebuffDB["classbuffs"] = classBuffs

	-- Get short names from text boxes and store
	local shortNames = {}

	for i = 1, #classBuffList do
		--local buff = tonumber(classBuffList[i])
		local buff = classBuffList[i]
		shortNames[buff] = shortNameBoxes[i]:GetText() or nil
	end

	RebuffDB["shortnames"] = shortNames
	
	-- Get tanks text boxes and store
	local tanks = {}
	for i = 1, 8 do
		tanks[tankBoxes[i]:GetText()] = i or nil
	end

	RebuffDB["tanks"] = tanks
	
	-- Get groups to monitor from check boxes and store
	groups = {
		g1 = groupCheckBoxes[1]:GetChecked(),
		g2 = groupCheckBoxes[2]:GetChecked(),
		g3 = groupCheckBoxes[3]:GetChecked(),
		g4 = groupCheckBoxes[4]:GetChecked(),
		g5 = groupCheckBoxes[5]:GetChecked(),
		g6 = groupCheckBoxes[6]:GetChecked(),
		g7 = groupCheckBoxes[7]:GetChecked(),
		g8 = groupCheckBoxes[8]:GetChecked(),
	}
	
	RebuffDB["groups"] = groups
	
	-- Set icon size based on input
	local iconSize = sizeBox:GetText() or 35
	rebuffFrame:SetSize(iconSize, iconSize)
	
	-- Store additional options
	options = {
		onlyOnce = onlyOnceBox:GetChecked(),
		broadcast = broadcastEnable:GetChecked(),
		channel = channel,
		solo = enableSolo:GetChecked(),
		party = enableParty:GetChecked(),
		raid = enableRaid:GetChecked(),
		hide = hideInCombat:GetChecked(),
		size = iconSize,
	}
	
	RebuffDB["options"] = options
	
	-- Show or hide the frame based on group selection
	Rebuff:toggleByGroupSize()
	
	if debug >= 1 then print("saved") end
end


-----------------------
--- Get class buffs ---
-----------------------
function addon:getClassBuffs(class)
	if debug >= 1 then print("Get saved values for", class) end
	--local classBuffs Rebuff:getSV("classbuffs", classes[i])
	--local buffList = classBuffs[class]
	local buffList = Rebuff:getSV("classbuffs", class) or {}
	--print(class, buffList)
	
	for i = 1, #classBuffList do
		if buffList[i] ~= nil then
			checkBoxes[i]:SetChecked(true)
		else
			checkBoxes[i]:SetChecked(false)
		end
	end
end

rebuffPanel:RegisterEvent("ADDON_LOADED")
rebuffPanel:SetScript("OnEvent", onevent)




