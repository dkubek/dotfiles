-- misc
import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.EwmhDesktops

import Data.List

import MyVars
import Keys
import Configs

-------------------------------------------------------------------------------
-- Colors
-- TODO: get from X server
backgroundColor       = "#282828"
backgroundColorLight  = "#665C54"
middleColor           = "#B8BB26"
foregroundColor       = "#D5C4A1"
urgentColor           = "#FB4934"

-------------------------------------------------------------------------------
-- Main --
main = xmonad =<< statusBar cmd pp kb conf
  where
    cmd   = "bash -c \"tee >(xmobar -x0) | xmobar -x1 \""
    pp    = customPP
    kb    = toggleStrutsKey
    conf  = myConfig

myConfig = def 
  { terminal            = myTerminal
  , workspaces          = myWorkspaces
  , modMask             = myModMask 
  , keys                = myKeys
  , focusFollowsMouse   = False

  , borderWidth         = 4
  , normalBorderColor   = backgroundColorLight
  , focusedBorderColor  = foregroundColor

  , layoutHook          = avoidStruts $ layoutHook defaultConfig
  , manageHook          = manageHook def <+> manageDocks
  , handleEventHook     = fullscreenEventHook
  }

-------------------------------------------------------------------------------
-- Looks --
-- bar
customPP = def 
  { ppCurrent         = pad . xmobarColor backgroundColor "" 
  , ppHidden          = pad . xmobarColor backgroundColorLight ""
  , ppHiddenNoWindows = pad . xmobarColor backgroundColorLight ""
  , ppUrgent          = xmobarColor urgentColor "" . wrap "[" "]" 
  , ppLayout          = xmobarColor backgroundColor ""
  , ppTitle           = const ""
  , ppVisible         = pad . xmobarColor middleColor ""
  , ppSep             = xmobarColor backgroundColor "" " | "
  , ppWsSep           = " "
  }
