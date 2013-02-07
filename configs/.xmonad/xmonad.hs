import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.TwoPane
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Util.EZConfig  

myWorkspaces = ["1:web", "2:porn", "3:emacs", "4:terms", "5:ext"]

-- myLayout = onWorkspace "1:web" (TwoPane (0.80) (3/100)) -- $ smartBorders (tiled ||| Mirror tiled ||| Full)
--   where
--     tiled = Tall 1 0.05 ratio
--     ratio =  toRational (2/(1+sqrt(5)::Double)) -- golden ratio

myManageHook = composeAll [
  className =? "Emacs" --> doShift "3:emacs"
  , className =? "Pidgin" --> doShift "1:web"
  , className =? "Gimp" --> doFloat
  ]

main = xmonad $ defaultConfig
        { 
          modMask = mod4Mask -- Use Super instead of Alt
        , terminal = "aterm"
        , workspaces = myWorkspaces
        , manageHook = manageHook defaultConfig <+> manageSpawn <+> manageDocks
        -- , layoutHook = avoidStruts $ myLayout $ layoutHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , startupHook = do
            spawn "xset r rate 150 50; synclient MaxTapTime=0"
            spawn "xmobar"
            spawn ". ~/.fehbg"
            -- spawnOn "1:web" "chromium-browser gmail.com reader.google.com& pidgin"
            -- spawnOn "2:porn" "chromium-browser --incognito reddit.com"
            -- spawnOn "3:emacs" "emacs"
            -- spawnOn "4:terms" "x-terminal-emulator"
        } `additionalKeys` 
        [((mod4Mask, xK_BackSpace), spawn "emacsclient -n ~/.xmonad/xmonad.hs")
        , ((mod4Mask, xK_n), spawn "chromium-browser --incognito --disable-accelerated-compositing")
        , ((mod4Mask, xK_i), spawn "pidgin")
        , ((mod4Mask, xK_t), spawn "toggle_redshift.sh")
        , ((mod4Mask, xK_q), spawn "toggle_qwerty.sh")
        , ((mod4Mask, xK_d), spawn "kill_powersave.sh")
        , ((0, 0x1008ff12), spawn "myaudioproxy.sh mute")
        , ((0, 0x1008ff12), spawn "myaudioproxy.sh mute")
        , ((0, 0x1008ff11), spawn "myaudioproxy.sh voldown")
        , ((0, 0x1008ff13), spawn "myaudioproxy.sh volup")
        , ((0, 0x1008ff14), spawn "myaudioproxy.sh play")
        , ((0, 0x1008ff16), spawn "myaudioproxy.sh prev")
        , ((0, 0x1008ff17), spawn "myaudioproxy.sh next")
        , ((0, 0x1008ff15), spawn "myaudioproxy.sh stop")
        ]
         