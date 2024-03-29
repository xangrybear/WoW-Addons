local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars')

--Lua functions
local _G = _G
local unpack = unpack
local ceil = math.ceil
--WoW API / Variables
local RegisterStateDriver = RegisterStateDriver
local GetBindingKey = GetBindingKey
local PetHasActionBar = PetHasActionBar
local GetPetActionInfo = GetPetActionInfo
local IsPetAttackAction = IsPetAttackAction
local PetActionButton_StartFlash = PetActionButton_StartFlash
local PetActionButton_StopFlash = PetActionButton_StopFlash
local AutoCastShine_AutoCastStart = AutoCastShine_AutoCastStart
local AutoCastShine_AutoCastStop = AutoCastShine_AutoCastStop
local GetPetActionSlotUsable = GetPetActionSlotUsable
local SetDesaturation = SetDesaturation
local PetActionBar_UpdateCooldowns = PetActionBar_UpdateCooldowns
local NUM_PET_ACTION_SLOTS = NUM_PET_ACTION_SLOTS
-- GLOBALS: ElvUI_Bar4

local Masque = E.Masque
local MasqueGroup = Masque and Masque:Group("ElvUI", "Pet Bar")

local bar = CreateFrame('Frame', 'ElvUI_BarPet', E.UIParent, 'SecureHandlerStateTemplate')
bar:SetFrameStrata("LOW")

function AB:UpdatePet(event, unit)
	if (event == "UNIT_AURA" and unit ~= "pet") then return end

	for i = 1, NUM_PET_ACTION_SLOTS, 1 do
		local name, texture, isToken, isActive, autoCastAllowed, autoCastEnabled, spellID = GetPetActionInfo(i)
		local buttonName = "PetActionButton"..i
		local autoCast = _G[buttonName.."AutoCastable"]
		local button = _G[buttonName]

		button:SetAlpha(1)
		button.icon:Hide()
		button.isToken = isToken

		if not isToken then
			button.ICON:SetTexture(texture)
			button.tooltipName = name
		else
			button.ICON:SetTexture(_G[texture])
			button.tooltipName = _G[name]
		end

		if spellID then
			local spell = _G.Spell:CreateFromSpellID(spellID)
			button.spellDataLoadedCancelFunc = spell:ContinueWithCancelOnSpellLoad(function()
				button.tooltipSubtext = spell:GetSpellSubtext()
			end)
		end

		if isActive then
			button:SetChecked(true)

			if IsPetAttackAction(i) then
				PetActionButton_StartFlash(button)
			end
		else
			button:SetChecked(false)

			if IsPetAttackAction(i) then
				PetActionButton_StopFlash(button)
			end
		end

		if autoCastAllowed then
			autoCast:Show()
		else
			autoCast:Hide()
		end

		if autoCastEnabled then
			AutoCastShine_AutoCastStart(button.AutoCastShine)
		else
			AutoCastShine_AutoCastStop(button.AutoCastShine)
		end

		if texture then
			if GetPetActionSlotUsable(i) then
				SetDesaturation(button.ICON, nil)
			else
				SetDesaturation(button.ICON, 1)
			end

			button.ICON:Show()
		else
			button.ICON:Hide()
		end

		if not PetHasActionBar() and texture then
			PetActionButton_StopFlash(button)
			SetDesaturation(button.ICON, 1)
			button:SetChecked(0)
		end
	end
end

function AB:PositionAndSizeBarPet()
	local buttonSpacing = E:Scale(self.db.barPet.buttonspacing)
	local backdropSpacing = E:Scale((self.db.barPet.backdropSpacing or self.db.barPet.buttonspacing))
	local buttonsPerRow = self.db.barPet.buttonsPerRow
	local numButtons = self.db.barPet.buttons
	local size = E:Scale(self.db.barPet.buttonsize)
	local autoCastSize = (size / 2) - (size / 7.5)
	local point = self.db.barPet.point
	local numColumns = ceil(numButtons / buttonsPerRow)
	local widthMult = self.db.barPet.widthMult
	local heightMult = self.db.barPet.heightMult
	local visibility = self.db.barPet.visibility

	bar.db = self.db.barPet
	bar.db.position = nil; --Depreciated

	if visibility and visibility:match('[\n\r]') then
		visibility = visibility:gsub('[\n\r]','')
	end

	if numButtons < buttonsPerRow then
		buttonsPerRow = numButtons
	end

	if numColumns < 1 then
		numColumns = 1
	end

	if self.db.barPet.backdrop == true then
		bar.backdrop:Show()
	else
		bar.backdrop:Hide()
		--Set size multipliers to 1 when backdrop is disabled
		widthMult = 1
		heightMult = 1
	end

	local barWidth = (size * (buttonsPerRow * widthMult)) + ((buttonSpacing * (buttonsPerRow - 1)) * widthMult) + (buttonSpacing * (widthMult-1)) + ((self.db.barPet.backdrop == true and (E.Border + backdropSpacing) or E.Spacing)*2)
	local barHeight = (size * (numColumns * heightMult)) + ((buttonSpacing * (numColumns - 1)) * heightMult) + (buttonSpacing * (heightMult-1)) + ((self.db.barPet.backdrop == true and (E.Border + backdropSpacing) or E.Spacing)*2)
	bar:Width(barWidth)
	bar:Height(barHeight)

	if self.db.barPet.enabled then
		bar:SetScale(1)
		bar:SetAlpha(bar.db.alpha)
		E:EnableMover(bar.mover:GetName())
	else
		bar:SetScale(0.0001)
		bar:SetAlpha(0)
		E:DisableMover(bar.mover:GetName())
	end

	local horizontalGrowth, verticalGrowth
	if point == "TOPLEFT" or point == "TOPRIGHT" then
		verticalGrowth = "DOWN"
	else
		verticalGrowth = "UP"
	end

	if point == "BOTTOMLEFT" or point == "TOPLEFT" then
		horizontalGrowth = "RIGHT"
	else
		horizontalGrowth = "LEFT"
	end

	bar.mouseover = self.db.barPet.mouseover
	if bar.mouseover then
		bar:SetAlpha(0)
	else
		bar:SetAlpha(bar.db.alpha)
	end

	if self.db.barPet.inheritGlobalFade then
		bar:SetParent(self.fadeParent)
	else
		bar:SetParent(E.UIParent)
	end

	local button, lastButton, lastColumnButton, autoCast
	local firstButtonSpacing = (self.db.barPet.backdrop == true and (E.Border + backdropSpacing) or E.Spacing)
	for i = 1, NUM_PET_ACTION_SLOTS do
		button = _G["PetActionButton"..i]
		lastButton = _G["PetActionButton"..i-1]
		autoCast = _G["PetActionButton"..i..'AutoCastable']
		lastColumnButton = _G["PetActionButton"..i-buttonsPerRow]

		button:SetParent(bar)
		button:ClearAllPoints()
		button:Size(size)

		autoCast:SetOutside(button, autoCastSize, autoCastSize)

		if i == 1 then
			local x, y
			if point == "BOTTOMLEFT" then
				x, y = firstButtonSpacing, firstButtonSpacing
			elseif point == "TOPRIGHT" then
				x, y = -firstButtonSpacing, -firstButtonSpacing
			elseif point == "TOPLEFT" then
				x, y = firstButtonSpacing, -firstButtonSpacing
			else
				x, y = -firstButtonSpacing, firstButtonSpacing
			end

			button:Point(point, bar, point, x, y)
		elseif (i - 1) % buttonsPerRow == 0 then
			local x = 0
			local y = -buttonSpacing
			local buttonPoint, anchorPoint = "TOP", "BOTTOM"
			if verticalGrowth == 'UP' then
				y = buttonSpacing
				buttonPoint = "BOTTOM"
				anchorPoint = "TOP"
			end
			button:Point(buttonPoint, lastColumnButton, anchorPoint, x, y)
		else
			local x = buttonSpacing
			local y = 0
			local buttonPoint, anchorPoint = "LEFT", "RIGHT"
			if horizontalGrowth == 'LEFT' then
				x = -buttonSpacing
				buttonPoint = "RIGHT"
				anchorPoint = "LEFT"
			end

			button:Point(buttonPoint, lastButton, anchorPoint, x, y)
		end

		if i > numButtons then
			button:SetScale(0.0001)
			button:SetAlpha(0)
		else
			button:SetScale(1)
			button:SetAlpha(bar.db.alpha)
		end

		self:StyleButton(button, nil, MasqueGroup and E.private.actionbar.masque.petBar and true or nil)
	end

	RegisterStateDriver(bar, "show", visibility)

	--Fix issue with mover not updating size when bar is hidden
	bar:GetScript("OnSizeChanged")(bar)

	if MasqueGroup and E.private.actionbar.masque.petBar then MasqueGroup:ReSkin() end
end

function AB:UpdatePetCooldownSettings()
	for i = 1, NUM_PET_ACTION_SLOTS do
		local button = _G["PetActionButton"..i]
		if button and button.cooldown then
			button.cooldown:SetDrawBling(not self.db.hideCooldownBling)
		end
	end
end

function AB:UpdatePetBindings()
	for i = 1, NUM_PET_ACTION_SLOTS do
		if self.db.hotkeytext then
			local key = GetBindingKey("BONUSACTIONBUTTON"..i)
			_G["PetActionButton"..i.."HotKey"]:Show()
			_G["PetActionButton"..i.."HotKey"]:SetText(key)
			self:FixKeybindText(_G["PetActionButton"..i])
		else
			_G["PetActionButton"..i.."HotKey"]:Hide()
		end
	end
end

function AB:CreateBarPet()
	bar:CreateBackdrop()
	bar.backdrop:SetAllPoints()
	if self.db.bar4.enabled then
		bar:Point('RIGHT', ElvUI_Bar4, 'LEFT', -4, 0)
	else
		bar:Point('RIGHT', E.UIParent, 'RIGHT', -4, 0)
	end

	bar:SetAttribute("_onstate-show", [[
		if newstate == "hide" then
			self:Hide()
		else
			self:Show()
		end
	]])

	bar:SetScript("OnHide", function()
		for i = 1, NUM_PET_ACTION_SLOTS, 1 do
			local button = _G["PetActionButton"..i]
			if button.spellDataLoadedCancelFunc then
				button.spellDataLoadedCancelFunc()
				button.spellDataLoadedCancelFunc = nil
			end
		end
	end)

	self:RegisterEvent('PET_BAR_UPDATE', 'UpdatePet')
	self:RegisterEvent('PLAYER_CONTROL_GAINED', 'UpdatePet')
	self:RegisterEvent('PLAYER_CONTROL_LOST', 'UpdatePet')
	self:RegisterEvent('PLAYER_ENTERING_WORLD', 'UpdatePet')
	self:RegisterEvent('PLAYER_FARSIGHT_FOCUS_CHANGED', 'UpdatePet')
	self:RegisterEvent('SPELLS_CHANGED', 'UpdatePet')
	self:RegisterEvent('UNIT_FLAGS', 'UpdatePet')
	self:RegisterEvent('UNIT_PET', 'UpdatePet')
	self:RegisterEvent('PET_BAR_UPDATE_COOLDOWN', PetActionBar_UpdateCooldowns)

	E:CreateMover(bar, 'PetAB', L["Pet Bar"], nil, nil, nil, 'ALL,ACTIONBARS', nil, 'actionbar,barPet')

	self:PositionAndSizeBarPet()
	self:UpdatePetBindings()

	self:HookScript(bar, 'OnEnter', 'Bar_OnEnter')
	self:HookScript(bar, 'OnLeave', 'Bar_OnLeave')

	for i = 1, NUM_PET_ACTION_SLOTS do
		local button = _G["PetActionButton"..i]
		if not button.ICON then
			button.ICON = button:CreateTexture("PetActionButton"..i..'ICON')
			button.ICON:SetTexCoord(unpack(E.TexCoords))
			button.ICON:SetInside()

			if button.pushed then
				button.pushed:SetDrawLayer('ARTWORK', 1)
			end
		end

		self:HookScript(button, 'OnEnter', 'Button_OnEnter')
		self:HookScript(button, 'OnLeave', 'Button_OnLeave')

		if MasqueGroup and E.private.actionbar.masque.petBar then
			MasqueGroup:AddButton(button, {Icon=button.ICON})
		end
	end
end
