import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Layout.Spacing
import System.IO

basic = "#CACACA"
accent = "#268BD2"

main = do
  -- start xmobar
  xmproc <- spawnPipe "/usr/bin/xmobar /home/finlayson/.xmonad/xmobar.hs"

  -- start with a Xfce config
  xmonad $ defaultConfig {
    modMask = mod4Mask,
    workspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
    manageHook = manageDocks <+> manageHook defaultConfig,
    terminal = "xfce4-terminal",
    layoutHook = avoidStruts $ layoutHook defaultConfig,
    logHook = dynamicLogWithPP xmobarPP {
      ppOutput = hPutStrLn xmproc,
      ppTitle = xmobarColor basic "" . shorten 110,
      ppCurrent = xmobarColor accent ""
    },

    -- set the highlight to a nice cyan
    focusedBorderColor = accent,
    borderWidth = 1
      
  -- set up some key maps      
  } `additionalKeys` [
      -- lock screen with Super-Z
      ((mod4Mask, xK_z), spawn "xscreensaver-command -lock"),

      -- use dmenu as launcher
      ((mod4Mask, xK_p), spawn "dmenu_run -nb '#002B36' -nf '#CACACA'"),

      -- Super-F launches browser
      ((mod4Mask, xK_f), spawn "Thunar"),

      -- Super-X launches terminal
      ((mod4Mask, xK_x), spawn "xfce4-terminal"),
      
      -- Super-B launches browser
      ((mod4Mask, xK_b), spawn "google-chrome-stable"),

      -- Super-C closes a window
      ((mod4Mask, xK_c), kill),

      -- Super-Backspace invokes Xkill
      ((mod4Mask, xK_BackSpace), spawn "xkill"),

      -- left goes to previous workspace
      ((mod4Mask, xK_Left), prevWS),

      -- rightleft goes to next workspace
      ((mod4Mask, xK_Right), nextWS)
      ]

