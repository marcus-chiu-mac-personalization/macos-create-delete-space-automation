-- values of horizontal position of close-space buttonset evenList to {212, 388, 564, 740, 916, 1092}set oddList to {120, 297, 474, 650, 826, 1002, 1178}tell application "System Events"	tell application "Mission Control" to launch	tell group 2 of group 1 of group 1 of process "Dock"				-- create new space (this expands the space docker in order to delete current space)		click (every button whose value of attribute "AXDescription" is "add desktop")				tell list 1			set spaceCount to count of buttons			set theMod to spaceCount mod 2						if theMod = 0 then				set firstList to evenList				set secondList to oddList			else				set firstList to oddList				set secondList to evenList			end if						set firstListSize to count of firstList			set secondListSize to count of secondList						-- DELETE NEWLY CREATED SPACE			set ii to (firstListSize - spaceCount) / 2			set pos to item (ii + spaceCount) of firstList			set comman to "/usr/local/bin/cliclick kd:alt c:" & pos & ",30"			do shell script comman						-- DELETE CURRENT SPACE			set curSpaceUUID to do shell script "defaults read com.apple.spaces | grep 'uuid = ' | head -n 1 | tr -d '[:space:]' | cut -d '\"' -f2"			set curSpaceNum to do shell script "defaults read com.apple.spaces | grep 'uuid = ' | sed -n '1!p' | grep -n " & curSpaceUUID & " | cut -d ':' -f1"			set curSpaceNum to curSpaceNum as integer			set ii to (secondListSize - (spaceCount - 1)) / 2			set pos to item (ii + curSpaceNum) of secondList			set comman to "/usr/local/bin/cliclick kd:alt c:" & pos & ",30"			do shell script comman		end tell	end tellend tell