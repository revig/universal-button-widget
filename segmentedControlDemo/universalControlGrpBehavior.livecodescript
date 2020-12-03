script "universalControlGrpBehavior"

on mouseUp
   local tNumWidgets, tBtnWidth, tBtnHeight, tBtnTop, tCurrentBtnRight, tGrpLeft, tTargetID
   
   put the number of widgets of me into tNumWidgets
   
   # RESIZE AND DISTRIBUTE BUTTONS
   if (the environment is development) and (the altKey is down) then
      
      put the width of the target into tBtnWidth
      put the height of the target into tBtnHeight
      put the top of widget 1 of me into tBtnTop
      put the right of widget 1 of me into tCurrentBtnRight
      
      if tNumWidgets > 1 then
         put the left of me into tGrpLeft
         lock screen
         
         # SIZE
         repeat with i = 1 to tNumWidgets
            set the width of widget i of me to tBtnWidth
            set the height of widget i of me to tBtnHeight
            set the top of widget i of me to tBtnTop
            set the left of widget i of me to (tCurrentBtnRight - 1)
            put the right of widget i of me into tCurrentBtnRight
            
            # BORDER
            if i is tNumWidgets then
               set the roundTL of widget i of me to false
               set the roundBL of widget i of me to false
               if the shiftKey is down then
                  set the roundTR of widget i of me to false
                  set the roundBR of widget i of me to false
               else
                  set the roundTR of widget i of me to true
                  set the roundBR of widget i of me to true
               end if
               
            else if i is 1 then
               set the roundTR of widget 1 of me to false
               set the roundBR of widget 1 of me to false
               if the shiftKey is down then
                  set the roundTL of widget 1 of me to false
                  set the roundBL of widget 1 of me to false
               else
                  set the roundTL of widget 1 of me to true
                  set the roundBL of widget 1 of me to true
               end if
               
            else
               set the roundTL of widget i of me to false
               set the roundBL of widget i of me to false
               set the roundTR of widget i of me to false
               set the roundBR of widget i of me to false
            end if
         end repeat
      end if
      
      set the left of me to tGrpLeft
      unlock screen
      
      exit mouseUp
   end if
   
   # SET HIGHLIGHT
   if the clickingTogglesHighlight of me is empty then
      set the clickingTogglesHighlight of me to FALSE
   end if
   if the multipleHighlights of me is empty then
      set the multipleHighlights of me to FALSE
   end if
   
   if (the clickingTogglesHighlight of me is FALSE) and (the multipleHighlights of me is TRUE) then
      set the multipleHighlights of me to FALSE
   end if
   
   put the long ID of the target into tTargetID
   repeat with i = 1 to tNumWidgets
      if the isToggle of widget i of me is TRUE then
         if the long ID of widget i of me <> tTargetID then
            if (the multipleHighlights of me is FALSE) and (the clickingTogglesHighlight of me is TRUE) then
               set the isHighlighted of widget i of me to false
            else if (the multipleHighlights of me is FALSE) and (the clickingTogglesHighlight of me is FALSE) then
               set the isHighlighted of widget i of me to false
            end if
         else
            if the clickingTogglesHighlight of me is false then
               set the isHighlighted of tTargetID to TRUE
            end if
         end if
      end if
   end repeat
end mouseUp
