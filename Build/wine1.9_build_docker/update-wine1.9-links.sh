#!/bin/bash
PathToOpt="/opt/wine-1.9.11/bin"
OriginalPath="/usr/bin"
Filenames="msidb msiexec notepad regedit regsvr32 dil wine wineboot winebuild winecfg wineconsole winecpp winedb winedump winefile wineg++ winegcc winemaker winemine winepath wine-preloader wineserver wmc wrc"
arr=($Filenames)

for f in "${arr[@]}"
do
	Src="$OriginalPath/$f"
	Dest="$PathToOpt/$f"
	echo "$Src <- $Dest"
	ln -sf "$Dest" "$Src"
done
