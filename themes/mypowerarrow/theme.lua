--[[

     Powerarrow Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local os, math, string = os, math, string
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") ..
   "/.config/awesome/themes/mypowerarrow"
theme.wallpaper                                 = theme.dir .. "/wall.jpg"
theme.font                                      = "DejaVu Sans Condensed 10"
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#FFFFFF"
theme.fg_urgent                                 = "#C83F11"
theme.bg_normal                                 = "#222222"
theme.bg_focus                                  = "#1E2320"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_normal                         = "#FFFFFF"
theme.taglist_fg_focus                          = "#FFFFFF"
theme.taglist_bg_focus                          = "#CE5666"
theme.taglist_bg_normal                         = "#001010" .. "A0"
theme.tasklist_bg_focus                         = "#4b696d"
theme.tasklist_fg_focus                         = "#FFFFFF"
theme.tasklist_bg_normal                        = "#222222"
theme.tasklist_fg_normal                        = "#A0A0A0"
theme.border_width                              = 2
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#9F9F9F"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_bg_normal                            = "#222222"
theme.menu_bg_focus                             = "#ce5666"
theme.vol_bg                                    = "#f19959" .. "B0"
theme.textclock_bg                              = "#e46165" .. "B0"
theme.launchbar_term_bg                         = "#234d69" .. "F0"
theme.launchbar_ff_bg                           = "#275776" .. "F0"
theme.launchbar_thunar_bg                       = "#2a5e80" .. "F0"
theme.launchbar_emacs_bg                        = "#2e668b" .. "F0"
theme.menu_height                               = 24
theme.menu_width                                = 200
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.useless_gap                               = 2
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus_hover         = theme.dir .. "/icons/titlebar/close_focus_hover.png"
theme.titlebar_minimize_button_focus            = theme.dir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_minimize_button_focus_hover      = theme.dir .. "/icons/titlebar/minimize_focus_hover.png"
theme.titlebar_minimize_button_normal           = theme.dir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_focus_active_hover = theme.dir .. "/icons/titlebar/maximized_focus_active_hover.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_focus_inactive_hover = theme.dir .. "/icons/titlebar/maximized_focus_inactive_hover.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"


-- Application icons
theme.emacs                                     = theme.dir .. "/icons/apps/emacs.svg"
theme.firefox                                   = theme.dir .. "/icons/apps/firefox.svg"
theme.terminal                                  = theme.dir .. "/icons/apps/terminal.svg"
theme.thunar                                    = theme.dir .. "/icons/apps/thunar.svg"


-- Awesome menu
local mylauncher = awful.widget.button({image = theme.awesome_icon})
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

local markup = lain.util.markup
local separators = lain.util.separators

local mytextclock = wibox.widget.textclock('<span color="#ffffff" font="DejaVu Sans Condensed 10"> %d/%m | %Hh%M </span>')

-- Calendar
-- load the widget code
local calendar = require("calendar.calendar")

-- attach it as popup to your text clock widget:
calendar({html = '<span font_desc="Terminus 10">\n%s</span>'}):attach(mytextclock)


theme.cal = calendar({})
-- theme.cal = lain.widget.calendar({
--     cal = "/usr/bin/ncal -bM",
--     attach_to = { mytextclock },
--     notification_preset = {
--         font = "Terminus 10",
--         fg   = theme.fg_normal,
--         bg   = theme.bg_normal
--     }
-- })

-- ALSA volume bar
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsabar({
    width = 67,
    notification_preset = { font = theme.font }
})
theme.volume.tooltip.wibox.fg = theme.fg_focus
theme.volume.tooltip.wibox.font = theme.font
theme.volume.bar:buttons(my_table.join (
          awful.button({}, 1, function()
            awful.spawn.with_shell(string.format("%s -e alsamixer", terminal))
          end),
          awful.button({}, 2, function()
            awful.spawn(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 3, function()
            awful.spawn(string.format("%s -D pulse set %s 1+ toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 4, function()
            awful.spawn(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 5, function()
            awful.spawn(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end)
))
local volumebg = wibox.container.background(theme.volume.bar, "#585858", gears.shape.rectangle)
local volumewidget = wibox.container.margin(volumebg, 7, 7, 5, 5)


-- Application buttons
local firefox_button = awful.widget.button({ image = theme.firefox })
firefox_button:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("firefox") end)
))

local emacs_button = awful.widget.button({ image = theme.emacs })
emacs_button:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("emacs") end)
))

local terminal_button = awful.widget.button({ image = theme.terminal })
terminal_button:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("x-terminal-emulator") end)
))

local thunar_button = awful.widget.button({ image = theme.thunar })
thunar_button:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("pcmanfm") end)
))


-- Separators
local arrow = separators.arrow_left
local arrow_right = separators.arrow_right

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    local names = { "🌏", "ℇ", "📂", "✎", "🎶"}
    local l = awful.layout.suit  -- Just to save some typing: use an alias.
    local layouts = { l.tile, l.tile, l.tile, l.floating, l.tile}
    awful.tag(names, s, layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    local right_widgets = {
       layout = wibox.layout.fixed.horizontal,
       -- using separators
       arrow("alpha", theme.vol_bg),
       wibox.container.background
       (wibox.container.margin(
           wibox.widget
           { volicon, volumewidget, layout = wibox.layout.align.horizontal
           }, 3, 3), theme.vol_bg),
       arrow(theme.vol_bg, theme.textclock_bg),
       wibox.container.background(
          wibox.container.margin(
             mytextclock, 4, 0), theme.textclock_bg),
       --]],
       wibox.widget.systray(),
       s.mylayoutbox
    }

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all,
                                       awful.util.taglist_buttons)

    -- Create a tasklist widget
    -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags,
                                         awful.util.tasklist_buttons,
                                         { bg_focus = theme.tasklist_bg_focus .. "85",
                                           shape = gears.shape.rectangle,
                                           shape_border_width = 1,
                                           shape_border_color = "#A0A0A0" .. "90",
                                           align = "center" })

    -- tasklist transparent background
    s.mytasklist.tasklist_bg_normal = theme.tasklist_bg_normal .. "60"
    s.mytasklist.tasklist_bg_focus = theme.tasklist_bg_normal .. "85"
    s.mytasklist.tasklist_fg_normal = theme.tasklist_fg_normal .. "100"
    s.mytasklist.tasklist_fg_focus = theme.tasklist_fg_focus .. "100"

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 20,
                              bg = theme.bg_normal .. "60", fg = theme.fg_normal .. "99"})

    -- Add widgets to the wibox
    s.mywibox:setup {
       layout = wibox.layout.align.horizontal,
       { -- Left widgets
          wibox.container.background(
             wibox.container.margin( wibox.widget {mylauncher,
                                                   layout = wibox.layout.align.horizontal},
                                     0,4), "#000000"),
          layout = wibox.layout.fixed.horizontal,
          --spr,
          wibox.container.background(
             wibox.container.margin(wibox.widget
                                    { s.mytaglist,
                                      layout = wibox.layout.align.horizontal },
                                    0, 0), theme.taglist_bg_normal),
          arrow_right(theme.taglist_bg_normal, theme.launchbar_term_bg),
          arrow_right(theme.launchbar_term_bg, theme.launchbar_term_bg),
          wibox.container.background(
             wibox.container.margin(wibox.widget
                                    { terminal_button,
                                      layout = wibox.layout.align.horizontal },
                                    2, 1), theme.launchbar_term_bg),
          arrow_right(theme.launchbar_term_bg, theme.launchbar_ff_bg),
          wibox.container.background(
             wibox.container.margin(wibox.widget
                                    { firefox_button,
                                      layout = wibox.layout.align.horizontal },
                                    2, 1), theme.launchbar_ff_bg),
          arrow_right(theme.launchbar_ff_bg, theme.launchbar_thunar_bg),
          wibox.container.background(
             wibox.container.margin(wibox.widget
                                    { thunar_button,
                                      layout = wibox.layout.align.horizontal },
                                    2, 1), theme.launchbar_thunar_bg),
          arrow_right(theme.launchbar_thunar_bg, theme.launchbar_emacs_bg),
          wibox.container.background(
             wibox.container.margin(wibox.widget
                                    { emacs_button,
                                      layout = wibox.layout.align.horizontal },
                                    2, 1), theme.launchbar_emacs_bg),
          arrow_right(theme.launchbar_emacs_bg, "alpha"),
          s.mypromptbox,
          spr,
       },
       s.mytasklist, -- Middle widget
       right_widgets,
    }
end

return theme
