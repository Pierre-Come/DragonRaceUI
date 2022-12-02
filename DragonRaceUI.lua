local Parent = CreateFrame('Frame', nil, UIParent, 'SecureHandlerStateTemplate')

local function UpdateUI()
    MainMenuBar:SetParent(Parent)
    MultiBarBottomLeft:SetParent(Parent)
    MultiBarBottomRight:SetParent(Parent)
    MultiBarRight:SetParent(Parent)
    MultiBarLeft:SetParent(Parent)
    MultiBar5:SetParent(Parent)
    MultiBar6:SetParent(Parent)
    MultiBar7:SetParent(Parent)
    
    PlayerFrame:SetParent(Parent)
    TargetFrame:SetParent(Parent)
    FocusFrame:SetParent(Parent)
end

local function HideUI()
    RegisterStateDriver(Parent, 'visibility', 'hide')
    UpdateUI();
end

local function ShowUI ()
    RegisterStateDriver(Parent, 'visibility', 'show')
    UpdateUI();
end

local function OnEvent(self, event, ...)
   if AuraUtil.FindAuraByName("Racing","player") == nil then
        ShowUI()
   else
        HideUI()
   end
end

local f = CreateFrame("Frame")
f:RegisterEvent("UNIT_AURA");
f:SetScript("OnEvent", OnEvent)
