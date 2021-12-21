 daySeventeen←{
     ⍝ remove the comma, split on spaces, take last 2 and reverse for y x,
     ⍝ remove y= and x= from each, and decode. TODO: cleaner parse
     ⍎¨¨'..'(≠⊆⊢)¨'y=|x='⎕R''¨⌽¯2↑' '(≠⊆⊢)','⎕R''∊⊃⎕NGET ⍵ 1
 }
