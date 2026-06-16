local LangConfig = {}

local _httpService = game:GetService("HttpService")

local _allData    = {}
local _current    = {}
local _revMap     = {}
local _updaters   = {}

_G.LangUpdaters = _G.LangUpdaters or {}
_updaters = _G.LangUpdaters

local function _flatten(tbl, prefix)
    for k, v in pairs(tbl) do
        local fk = prefix and (prefix .. "." .. k) or k
        if type(v) == "table" then
            _flatten(v, fk)
        elseif type(v) == "string" and v ~= "" then
            if not _revMap[v] then _revMap[v] = fk end
        end
    end
end

function LangConfig.LoadLanguage(url)
    local ok, raw = pcall(game.HttpGet, game, url)
    if not ok or not raw then return false end
    local decOk, data = pcall(_httpService.JSONDecode, _httpService, raw)
    if not decOk or type(data) ~= "table" then return false end
    _allData = data
    _revMap  = {}
    for _, t in pairs(_allData) do _flatten(t, nil) end
    local code = _G.LangCode or "en"
    _current = _allData[code] or _allData["en"] or {}
    return true
end

function LangConfig.KhanhThy(key)
    local val = _current
    for part in key:gmatch("[^%.]+") do
        if type(val) ~= "table" then return key end
        val = val[part]
    end
    if val == nil then return key end
    return tostring(val)
end

function LangConfig.RL(fn)
    table.insert(_updaters, fn)
end

function LangConfig.ApplyLanguage(code, notifyFn)
    if not _allData[code] then return end
    _G.LangCode = code
    _current = _allData[code]
    if _G.SaveData then
        _G.SaveData.Language_Save = code
        if SaveSettings then pcall(SaveSettings) end
    end
    for _, fn in ipairs(_updaters) do pcall(fn) end
    pcall(function()
        local guiParent = (gethui and gethui()) or game:GetService("CoreGui")
        for _, obj in ipairs(guiParent:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                local txt = obj.Text
                if txt and #txt > 0 then
                    local tKey = _revMap[txt]
                    if tKey then
                        local newTxt = LangConfig.KhanhThy(tKey)
                        if newTxt ~= tKey and newTxt ~= txt then obj.Text = newTxt end
                    end
                end
            end
        end
    end)
    if notifyFn then pcall(notifyFn, code) end
end

function LangConfig.BuildLanguageSection(Fluent, tab, langs, labelTitle, labelSection)
    local section = tab:AddSection(labelSection or "Language")
    section:AddDropdown("LangConfig_Language", {
        Title    = labelTitle or "Language",
        Values   = langs or {"en"},
        Default  = _G.LangCode or "en",
        Callback = function(val) LangConfig.ApplyLanguage(val, function()
            if Fluent and Fluent.Notify then
                Fluent:Notify({ Title = "Language", Content = val, Duration = 3 })
            end
        end) end,
    })
end

function LangConfig.SetupAutoSave(SaveManager, folder, configName, delay)
    local _folder    = folder      or "MyHub"
    local _name      = configName  or "autosave"
    local _delay     = delay       or 3
    local _pending   = false
    local _lastTick  = 0

    local function _schedule()
        _lastTick = tick()
        if _pending then return end
        _pending = true
        task.spawn(function()
            repeat task.wait(0.5) until tick() - _lastTick >= _delay
            _pending = false
            SaveManager:SetFolder(_folder)
            pcall(function() SaveManager:Save(_name) end)
        end)
    end

    local function _hookOption(obj)
        if type(obj) ~= "table" then return end
        pcall(function()
            if obj.OnChanged then obj:OnChanged(_schedule) end
        end)
    end

    for _, obj in pairs(SaveManager.Options or {}) do _hookOption(obj) end

    local opts = SaveManager.Options or {}
    setmetatable(opts, {
        __newindex = function(t, k, v)
            rawset(t, k, v)
            task.defer(function() _hookOption(v) end)
        end
    })

    SaveManager.ScheduleAutoSave = _schedule
    SaveManager:SetLibrary(Fluent or getgenv().Fluent)
    SaveManager:SetFolder(_folder)
    SaveManager:IgnoreThemeSettings()
    SaveManager:BuildFolderTree()

    local autoloadFile = _folder .. "/autoload.txt"
    if isfile and not isfile(autoloadFile) then
        pcall(writefile, autoloadFile, _name)
    end

    SaveManager:LoadAutoloadConfig()
end

if getgenv then
    getgenv().KhanhThy      = LangConfig.KhanhThy
    getgenv().RL            = LangConfig.RL
    getgenv().ApplyLanguage = LangConfig.ApplyLanguage
end

return LangConfig
