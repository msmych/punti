hs.loadSpoon("EmmyLua")

local meh = {"ctrl", "alt", "cmd"}
local hyper = {"shift", "ctrl", "alt", "cmd"}

-- Quick reload
hs.hotkey.bind(meh, "h", function()
  hs.reload()
end)
hs.alert.show("Hammerspoon loaded")

-- App launcher
hs.hotkey.bind(meh, "g", function()
  hs.application.launchOrFocus("Ghostty")
end)

hs.hotkey.bind(meh, "i", function()
  hs.application.launchOrFocus("IntelliJ IDEA")
end)

hs.hotkey.bind(meh, "c", function()
  hs.application.launchOrFocus("Google Chrome")
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
