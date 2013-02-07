import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.TwoPane
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Util.EZConfig  

myWorkspaces = ["1:web", "2:IM", "3:emacs", "4:terms", "5:docs", "6", "7", "8", "9"]

main = xmonad $ defaultConfig
        { 
          modMask = mod4Mask -- Use Super instead of Alt
        , terminal = "urxvt"
        , workspaces = myWorkspaces
        , manageHook = manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , startupHook = do
            spawn "xset r rate 150 50; synclient MaxTapTime=0"
            spawn "xmobar"
            spawn ". ~/.fehbg"
        } `additionalKeys` 
        [((mod4Mask, xK_BackSpace), spawn "emacsclient -n ~/.xmonad/xmonad.hs")
        , ((mod4Mask, xK_n), spawn "chromium-browser --incognito --disable-accelerated-compositing")
        , ((mod4Mask, xK_i), spawn "pidgin")
        , ((mod4Mask, xK_t), spawn "toggle_redshift.sh")
        , ((mod4Mask + mod1Mask, xK_q), spawn "toggle_qwerty.sh")
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
         