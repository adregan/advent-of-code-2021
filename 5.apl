 dayFive←{
     ⎕IO←0
     in←↑⍎¨¨'-> '∘(~⍤∊⍨⊆⊢)¨⊃⎕NGET ⍵ 1
     ⍝ Initialize grid of zeros of max x+1,y+1
     grid←0⍴⍨1+↑(⌈⌿⌈/)in
 }
