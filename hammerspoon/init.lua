-- MotoGP geçiş animasyonu (hs.webview + HTML/CSS)
-- Shell'den tetiklemek için:  open -g "hammerspoon://moto"

require("hs.ipc") -- `hs` komut satırı arayüzü için

local DURATION = 3.0   -- toplam süre (sn)

local DIR        = os.getenv("HOME") .. "/dotfiles/hammerspoon/"
local HTML_PATH  = DIR .. "moto.html"
local LIB_PATH   = DIR .. "lottie.min.js"
local JSON_PATH  = DIR .. "moto.json"
local SOUND_PATH = DIR .. "motogp.mp3"

local motoSound = hs.sound.getByFile(SOUND_PATH)

local function readFile(path)
  local f = io.open(path, "r")
  if not f then return nil end
  local s = f:read("*a")
  f:close()
  return s
end

function motoHTML(duration)
  local html = readFile(HTML_PATH)
  if not html then
    return "<html><body>moto.html bulunamadı</body></html>"
  end
  local lib  = readFile(LIB_PATH) or ""
  local data = readFile(JSON_PATH) or "{}"

  -- lottie-web kütüphanesini + animasyon verisini + süreyi HTML'e göm
  -- (WKWebView'de file:// göreli yol / CORS sorunlarını atlamak için inline)
  local head = string.format("<style>:root{--duration:%fs}</style>", duration)
    .. "<script>" .. lib .. "</script>"
    .. "<script>window.MOTO_DATA=" .. data .. ";</script>"

  local marker = "</head>"
  local pos = html:find(marker, 1, true) -- düz arama (pattern değil)
  if pos then
    return html:sub(1, pos - 1) .. head .. marker .. html:sub(pos + #marker)
  end
  return head .. html
end

local activeWebview = nil

local function motoZoom()
  if activeWebview then
    activeWebview:delete()
    activeWebview = nil
  end

  local screen = hs.screen.mainScreen()
  local frame = screen:fullFrame()

  -- ekranın tam ortasında sabit bir kutu (4:3, animasyonun en-boyu)
  local boxW = 520
  local boxH = 390
  local rect = {
    x = frame.x + (frame.w - boxW) / 2,
    y = frame.y + (frame.h - boxH) / 2,
    w = boxW,
    h = boxH,
  }

  local wv = hs.webview.new(rect)
  wv:windowStyle(hs.webview.windowMasks.borderless | hs.webview.windowMasks.nonactivating)
  wv:transparent(true)
  wv:shadow(false)
  wv:allowTextEntry(false)
  wv:level(hs.canvas.windowLevels.overlay)
  wv:behavior(hs.canvas.windowBehaviors.canJoinAllSpaces | hs.canvas.windowBehaviors.stationary)
  wv:html(motoHTML(DURATION))
  wv:show()

  -- ses (animasyonla senkron)
  if motoSound then motoSound:stop():play() end

  activeWebview = wv

  hs.timer.doAfter(DURATION + 0.15, function()
    if wv then wv:delete() end
    if activeWebview == wv then activeWebview = nil end
  end)
end

-- URL event: open -g "hammerspoon://moto"
hs.urlevent.bind("moto", function()
  motoZoom()
end)

-- her yüklemede artan sayaç (reload çalışıyor mu kontrolü için)
local n = (hs.settings.get("motoReloadCount") or 0) + 1
hs.settings.set("motoReloadCount", n)
_G.RELOAD_MARK = n

-- init.lua/moto.html değişince otomatik yeniden yükle
-- (atomik kaydetmeleri de kaçırmamak için .lua/.html/.json fark etmeksizin)
configWatcher = hs.pathwatcher.new(DIR, function()
  hs.reload()
end)
configWatcher:start()

hs.alert.show("Hammerspoon yüklendi 🏍️ (#" .. n .. ")")
