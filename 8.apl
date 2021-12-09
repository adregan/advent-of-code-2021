 dayEight←{
     ⎕IO←0
     parse←{↑' '(≠⊆⊢)¨⍺⍺/↑⍵}
     screens←(⊢parse)in←{'|'(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵
     ⍝ 1 has 2 segments, 4 has 4, 7 has 3, and 8 has seven
     ⎕←'part one:',+/+⌿↑,(⊂2 3 4 7)=(≢¨⍤1)screens

     segments←{
         ⍝ 7 segments; it's in the title
         s←7⍴''
         one←⊃(2=≢¨⍵)/⍵
         seven←⊃(3=≢¨⍵)/⍵
         four←⊃(4=≢¨⍵)/⍵
         eight←⊃(7=≢¨⍵)/⍵
         ⍝ you can determine segments by their frequency
         frequencies ← ↓{⍺,≢⍵}⌸(↑,/⍵)
         s[0] ← ((~seven∊one)/seven)
        ⍝  s[4] ← ()
         frequencies
     }
    ⍝  sort¨(((⊂⍋∘(≢¨))⌷⊢)⍤1)
     digits←segments¨↓(⊣parse)in

     digits
 }
