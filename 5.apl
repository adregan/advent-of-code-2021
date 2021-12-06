 dayFive←{
     ⍝ This is a terribly slow solution, but at least I learned a ton
     ⎕IO←0
     ⍝ Gotta reverse the coordinates as the are x,y and we'll need y,x
     in←↑⌽⍤⍎¨¨'-> '∘(~⍤∊⍨⊆⊢)¨⊃⎕NGET ⍵ 1
     ⍝ Initialize grid of zeros of max x,y
     grid←0⍴⍨1+↑(⌈⌿⌈/)in
     ⍝ put it all together for part 1; compress only the horizontal and vertical;
     ⍝ reverse the coordinates and produce ranges for each.
     hv ← ((=/⊃¨)∨(=/1∘⊃¨))in
     ⍝ to reverse coords to keep smallest x or y on left
     rev←{
         ys ← ⍺(,⍥⊃)⍵
         xs ← ⍺(,⍥(1∘⊃))⍵
         ((>/ys)⌽ys) (↓(,⍤0)) ((>/xs)⌽xs)
     }

     ⍝ Really slows down at this point
     hvCoords ← (⊣↓∘⍳1+⊢)/(↑rev/(hv⌿in))

     _←{(⍵⌷grid) ← ⍵⌷grid+1}¨¨hvCoords

     ⎕←'part one:',+/+⌿1<grid

    diagCoords←{
       range←⊣↓∘⍳1+⊢
       ys ← ⍺(,⍥⊃)⍵
       xs ← ⍺(,⍥(1∘⊃))⍵
       ySeq ← ↑range/((>/ys)⌽ys)
       xSeq ← ↑range/((>/xs)⌽xs)

       rev←{((>/)⍺): ⌽⍵ ⋄ ⍵ }
       (ys rev ySeq) (↓(,⍤0)) (xs rev xSeq)
    }

     _←{(⍵⌷grid) ← ⍵⌷grid+1}¨¨diagCoords/((~hv)⌿in)

     ⎕←'part two:',+/+⌿1<grid
 }
