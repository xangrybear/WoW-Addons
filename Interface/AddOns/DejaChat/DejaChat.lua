-- Deja Chat

CHAT_FRAME_FADE_OUT_TIME = 0
CHAT_TAB_HIDE_DELAY = 0
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0

BNToastFrame:SetClampedToScreen(true)

CHAT_BUTTONS = {
	"QuickJoinToastButton",
	"ChatFrameMenuButton",
	"ChatFrameChannelButton",
	"ChatFrameToggleVoiceDeafenButton",
	"ChatFrameToggleVoiceMuteButton",
	}

local ignoreDVCBAalpha
local DVCBAlphaTimer

local function SetAlpha(frame)
	if ignoreDVCBAalpha then return end
	ignoreDVCBAalpha = true
	if frame:IsMouseOver() then
		frame:SetAlpha(1)
	else
		frame:SetAlpha(0)
	end
	ignoreDVCBAalpha = nil
end


local function showDVCB(self)
	if DVCBAlphaTimer then DVCBAlphaTimer:Cancel() end
	for _, v in ipairs(CHAT_BUTTONS) do
		ignoreDVCBAalpha = true
		_G[v]:SetAlpha(1)
		ignoreDVCBAalpha = nil
	end
end

local function hideDVCB(self)
	for _, v in ipairs(CHAT_BUTTONS) do
		ignoreDVCBAalpha = true
		_G[v]:SetAlpha(0)
		ignoreDVCBAalpha = nil
	end
end

local function delayHideDVCB(self)
	DVCBAlphaTimer = C_Timer.NewTimer(0.75, hideDVCB)
end

	for _, v in ipairs(CHAT_BUTTONS) do
		v = _G[v]
		hooksecurefunc(v, "SetAlpha", SetAlpha)
		v:HookScript("OnEnter", showDVCB)
		v:HookScript("OnLeave", delayHideDVCB)
		v:SetAlpha(0)
	end


-- ChatFrameMenuButton:HookScript("OnShow", ChatFrameMenuButton.Hide)
-- ChatFrameMenuButton:Hide()

-- QuickJoinToastButton:HookScript("OnShow", QuickJoinToastButton.Hide)
-- QuickJoinToastButton:Hide()

-- Table to keep track of frames already seen:
local frames = {}

-- Function to handle customzing a chat frame:
local function ProcessFrame(frame)
	if frames[frame] then return end

	frame:SetClampRectInsets(0, 0, 0, 0)
	frame:SetMaxResize(UIParent:GetWidth(), UIParent:GetHeight())
	frame:SetMinResize(250, 100)

	local name = frame:GetName()
	_G[name .. "ButtonFrame"]:Hide()
	_G[name .. "EditBoxLeft"]:Hide()
	_G[name .. "EditBoxMid"]:Hide()
	_G[name .. "EditBoxRight"]:Hide()

	local editbox = _G[name .. "EditBox"]
	editbox:ClearAllPoints()
	editbox:SetPoint('BOTTOMLEFT', ChatFrame1, 'TOPLEFT', -7, 25)
	editbox:SetPoint('BOTTOMRIGHT', ChatFrame1, 'TOPRIGHT', 10, 25) 
	editbox:SetAltArrowKeyMode(false)

	frames[frame] = true
end

-- Get all of the permanent chat windows and customize them:
for i = 1, NUM_CHAT_WINDOWS do
	ProcessFrame(_G["ChatFrame" .. i])
end

-- Set up a dirty hook to catch temporary windows and customize them when they are created:
local old_OpenTemporaryWindow = FCF_OpenTemporaryWindow
FCF_OpenTemporaryWindow = function(...)
	local frame = old_OpenTemporaryWindow(...)
	ProcessFrame(frame)
	return frame
end

function FloatingChatFrame_OnMouseScroll(self, delta)
	if delta > 0 then
		if IsShiftKeyDown() then
			self:ScrollToTop()
		else	
			self:ScrollUp()
		end
	elseif delta < 0 then
		if IsShiftKeyDown() then
			self:ScrollToBottom()
		else
			self:ScrollDown()
		end
	end	
end

---------------
-- Chat Tabs --
---------------
local currentTab = 1

local NextChatFrameTab = CreateFrame("BUTTON", "NextChatFrameTab")
local PreviousChatFrameTab = CreateFrame("BUTTON", "PreviousChatFrameTab")

local DejaChatTabsFrame = CreateFrame("Frame", "DejaChatTabsFrame", UIParent)
    DejaChatTabsFrame:RegisterEvent("PLAYER_LOGIN")
    DejaChatTabsFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

    DejaChatTabsFrame:SetScript("OnEvent", function (self)
        BINDING_HEADER_DEJACHATTABS = "DejaChatTabs" --IOP Header name.
        for i = 1,NUM_CHAT_WINDOWS do
            local name, _, _, _, _, _, _, _, docked = GetChatWindowInfo(i);
            if name == "" then
                _G["BINDING_NAME_CLICK ChatFrame"..i.."Tab:LeftButton"] = "Chat Tab "..i
            else
                _G["BINDING_NAME_CLICK ChatFrame"..i.."Tab:LeftButton"] = "["..i..". "..name.."]"
            end
            _G["ChatFrame"..i.."Tab"]:SetScript("PreClick", function(self, button, down)
                print(i)
                currentTab = i
                self:Click()
            end)
        end
        _G["BINDING_NAME_CLICK NextChatFrameTab:LeftButton"] = "Next Chat Frame Tab"
        _G["BINDING_NAME_CLICK PreviousChatFrameTab:LeftButton"] = "Previous Chat Frame Tab"
    end)

    NextChatFrameTab:SetScript("OnClick", function(self, button, down)
        currentTab = (currentTab+1)
        if (currentTab > 10) then
            currentTab = 10
        end
        local name, _, _, _, _, _, shown, _, docked = GetChatWindowInfo(currentTab);
        if (docked == nil) then
            currentTab = (currentTab - 1)
        end
        _G["ChatFrame"..currentTab.."Tab"]:Click()
    end)

    PreviousChatFrameTab:SetScript("OnClick", function(self, button, down)
        currentTab = (currentTab-1)
        if (currentTab < 1) then
            currentTab = 1
        end
        _G["ChatFrame"..currentTab.."Tab"]:Click()
    end)