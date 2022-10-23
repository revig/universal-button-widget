script "community.livecode.rabit.universalButton.__DefaultScript"
-- Sent when the widget geometry changed.
on ubGeometryChanged

end ubGeometryChanged


-- Use the ubResizeToFormattedWidth handler to adjust
-- the width of the button right after changing the
-- button label.
-- pDeviation is an integer to increase or decrease
-- the formatted width of the button.
on ubResizeToFormattedWidth pDeviation
   local tBtnText, tBtnToggleText, tFormattedWidth

   if (pDeviation <> empty) and (pDeviation is not a number) then
      put empty into pDeviation
   end if

   if pDeviation is not an integer then
     put the round of pDeviation into pDeviation
   end if

   -- THIS VALUE MAY NEED TO BE SET HIGHER
   wait 300 millisecs with messages

   put the buttonText of me into tBtnText
   put the buttonToggleText of me into tBtnToggleText
   put the ubFormattedWidth of me into tFormattedWidth

   set the buttonText of me to ""
   if the isToggle of me is TRUE then
      set the buttonToggleText of me to ""
   end if

   if pDeviation is empty then
      set the width of me to tFormattedWidth
   else
      set the width of me to (tFormattedWidth + pDeviation)
   end if

   set the buttonText of me to tBtnText
   if the isToggle of me is TRUE then
      set the buttonToggleText of me to tBtnToggleText
   end if
end ubResizeToFormattedWidth
