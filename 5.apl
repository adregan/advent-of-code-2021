 dayFive←{
     ⍝ This is a terribly slow solution, but at least I learned a ton
     ⎕IO←0
     ⍝ Gotta reverse the coordinates as the are x,y and we'll need y,x
     in←↑⌽⍤⍎¨¨'-> '∘(~⍤∊⍨⊆⊢)¨⊃⎕NGET ⍵ 1
     ⍝ Initialize grid of zeros of max x,y
     g←{0⍴⍨1+↑(⌈⌿⌈/)⍵}
     ⍝ to reverse coords when the right is smaller than the left
     revCoords ← (∨/¨>/)⌽⊢
     ⍝ This is amazing to me. This inclusive range works on coordinate pairs
     ⍝ as easily as it does on single values.
     r←⊣↓∘⍳1+⊢
     ⍝ put it all together for part 1; compress only the horizontal and vertical;
     ⍝ reverse the coordinates and produce ranges for each.
     p1Coords ← r/(revCoords(((=/⊃¨)∨(=/1∘⊃¨))in)⌿in)
     p1Grid ← g in

     _←{(⍵⌷p1Grid) ← ⍵⌷p1Grid+1}¨¨p1Coords

     ⎕←'part one:',+/+⌿1<p1Grid
 }
