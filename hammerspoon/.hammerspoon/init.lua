hs.loadSpoon("EmmyLua")

local meh = {"ctrl", "alt", "cmd"}
local hyper = {"shift", "ctrl", "alt", "cmd"}

-- Quick reload
hs.hotkey.bind(hyper, "h", function()
  hs.reload()
end)
hs.alert.show("Hammerspoon loaded")

-- App launcher
hs.hotkey.bind(meh, ",", function()
  hs.application.launchOrFocus("Settings")
end)

hs.hotkey.bind(meh, "f", function()
  hs.application.launchOrFocus("Finder")
end)

hs.hotkey.bind(meh, "n", function()
  hs.application.launchOrFocus("Notes")
end)

hs.hotkey.bind(meh, "k", function()
  hs.application.launchOrFocus("Calendar")
end)

hs.hotkey.bind(meh, "j", function()
  hs.application.launchOrFocus("Reminders")
end)

hs.hotkey.bind(meh, "b", function()
  hs.application.launchOrFocus("Brave Browser")
end)

hs.hotkey.bind(meh, "i", function()
  hs.application.launchOrFocus("IntelliJ IDEA")
end)

-- Window management
hs.window.animationDuration = 0

local function moveWindow(fn)
  local win = hs.window.focusedWindow()
  if not win then return end
  local screen = win:screen():frame()
  fn(win, screen)
end

hs.hotkey.bind(hyper, "return", function()
  moveWindow(function(win, screen)
    win:setFrame(screen)
  end)
end)

hs.hotkey.bind(meh, "[", function()
  moveWindow(function(win, screen)
    win:setFrame({x = screen.x, y = screen.y, w = screen.w / 3, h = screen.h})
  end)
end)

hs.hotkey.bind(meh, "]", function()
  moveWindow(function(win, screen)
    win:setFrame({x = screen.x + screen.w / 3, y = screen.y, w = screen.w * 2 / 3, h = screen.h})
  end)
end)

hs.hotkey.bind(meh, "right", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:moveToScreen(win:screen():next())
end)

-- Local config
local ok, err = pcall(dofile, os.getenv("HOME") .. "/.hammerspoon/init.local.lua")
if not ok then
  print("No local config or error: " .. tostring(err))
end
