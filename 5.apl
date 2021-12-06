 dayFive←{
     ⎕IO←0
     ⍝ Gotta reverse the coordinates as the are x,y and we'll need y,x
     in←↑⌽⍤⍎¨¨'-> '∘(~⍤∊⍨⊆⊢)¨⊃⎕NGET ⍵ 1
     ⍝ Initialize grid of zeros of max x,y 
     grid←0⍴⍨1+↑(⌈⌿⌈/)in
     p1Coords ← (((=/⊃¨)∨(=/1∘⊃¨))in)⌿in
 }
