script "universalControlGrpBehavior"

on mouseUp
   local tGroupID, tTargetID, tNumWidgets
   
   put the long id of me into tGroupID
   put the long id of the target into tTargetID
   put the number of widgets of me into tNumWidgets
   
   # RESIZE AND DISTRIBUTE BUTTONS
   if (the environment is development) and (the altKey is down) then
      ubCreateSegmentedControl tGroupID, tTargetID, tNumWidgets
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




command ubCreateSegmentedControl pGroupID pTargetID pNumWidgets
   local tBorderWidth, tBtnWidth, tBtnHeight, tBtnLeft, tCurrentBtnBottom
   local tBtnTop, tCurrentBtnRight, tGrpTop, tGrpLeft
   
   if the vertical of pGroupID is empty then
      set the vertical of pGroupID to FALSE
   end if
   
   put the btnBorderWidth of pTargetID into tBorderWidth
   
   put the width of pTargetID into tBtnWidth
   put the height of pTargetID into tBtnHeight
   if the vertical of pGroupID is TRUE then
      put the left of widget 1 of pGroupID into tBtnLeft
      put the bottom of widget 1 of pGroupID into tCurrentBtnBottom
   else
      put the top of widget 1 of me into tBtnTop
      put the right of widget 1 of me into tCurrentBtnRight
   end if
   
   if pNumWidgets > 1 then
      put the top of pGroupID into tGrpTop
      put the left of pGroupID into tGrpLeft
      lock screen
      
      # SIZE
      repeat with i = 1 to pNumWidgets
         set the btnBorderWidth of widget i of pGroupID to tBorderWidth
         set the width of widget i of pGroupID to tBtnWidth
         set the height of widget i of pGroupID to tBtnHeight
         if the vertical of pGroupID is TRUE then
            set the left of widget i of pGroupID to tBtnLeft
            set the top of widget i of pGroupID to (tCurrentBtnBottom - tBorderWidth)
            put the bottom of widget i of pGroupID into tCurrentBtnBottom
         else
            set the top of widget i of pGroupID to tBtnTop
            set the left of widget i of pGroupID to (tCurrentBtnRight - tBorderWidth)
            put the right of widget i of pGroupID into tCurrentBtnRight
         end if
         
         # BORDER
         if i is pNumWidgets then
            set the roundTL of widget i of pGroupID to false
            if the vertical of pGroupID is TRUE then
               set the roundTR of widget i of pGroupID to false
            else
               set the roundBL of widget i of pGroupID to false
            end if
            if the shiftKey is down then
               if the vertical of pGroupID is TRUE then
                  set the roundBL of widget i of pGroupID to false
               else
                  set the roundTR of widget i of pGroupID to false
               end if
               set the roundBR of widget i of pGroupID to false
            else
               if the vertical of pGroupID is TRUE then
                  set the roundBL of widget i of pGroupID to true
               else
                  set the roundTR of widget i of pGroupID to true
               end if
               set the roundBR of widget i of pGroupID to true
            end if
            
         else if i is 1 then
            if the vertical of pGroupID is TRUE then
               set the roundBL of widget 1 of pGroupID to false
            else
               set the roundTR of widget 1 of pGroupID to false
            end if
            set the roundBR of widget 1 of pGroupID to false
            if the shiftKey is down then
               set the roundTL of widget 1 of pGroupID to false
               if the vertical of pGroupID is TRUE then
                  set the roundTR of widget 1 of pGroupID to false
               else
                  set the roundBL of widget 1 of pGroupID to false
               end if
            else
               set the roundTL of widget 1 of pGroupID to true
               if the vertical of pGroupID is TRUE then
                  set the roundTR of widget 1 of pGroupID to true
               else
                  set the roundBL of widget 1 of pGroupID to true
               end if
            end if
            
         else
            set the roundTL of widget i of pGroupID to false
            set the roundBL of widget i of pGroupID to false
            set the roundTR of widget i of pGroupID to false
            set the roundBR of widget i of pGroupID to false
         end if
      end repeat
   end if
   
   if the vertical of pGroupID is TRUE then
      set the top of pGroupID to tGrpTop
   else
      set the left of pGroupID to tGrpLeft
   end if
   
   unlock screen
end ubCreateSegmentedControl
