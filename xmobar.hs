Config {
  font = "xft:Terminus:size=11:antialias=true",
  bgColor = "#002B36",
  fgColor = "#CACACA",
  position = Static {xpos = 19, ypos = 0, width = 1900, height = 16},
  lowerOnStart = False,
  commands = [
    Run Cpu ["-L","3","-H","50","--normal","#CACACA","--high","#CACACA"] 10,
    Run Memory ["-t","Mem: <usedratio>%"] 10,
    Run Date "%a %b %_d %l:%M" "date" 10,
    Run Com "/home/finlayson/bin/myweath" [] "myweath" 3600,
    Run Com "/home/finlayson/bin/checkup" [] "checkup" 3600,
    Run Com "/home/finlayson/bin/mail-check" [] "mail-check" 100,
    Run Com "/home/finlayson/bin/getvol" [] "getvol" 10,
    Run StdinReader],
  sepChar = "%",
  alignSep = "}{",
  template = "%StdinReader%}{<action=xfce4-terminal -e htop><icon=/home/finlayson/.xmonad/icons/cpu.xbm/> %cpu% | <icon=/home/finlayson/.xmonad/icons/mem.xbm/> %memory%</action> | <action=xfce4-terminal -e 'sudo pacman -Syu'> <icon=/home/finlayson/.xmonad/icons/up.xbm/> %checkup%</action> | <action=xfce4-terminal -e mutt><icon=/home/finlayson/.xmonad/icons/mail.xbm/> %mail-check%</action> | <action=xfce4-terminal -e /home/finlayson/bin/mcal><icon=/home/finlayson/.xmonad/icons/clock.xbm/> %date%</action> | <icon=/home/finlayson/.xmonad/icons/temp.xbm/> <action=xfce4-terminal -e /home/finlayson/bin/full-weather>%myweath%</action> | <action=xfce4-terminal -e alsamixer><icon=/home/finlayson/.xmonad/icons/volume.xbm/> %getvol%</action>"
}

