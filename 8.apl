 dayEight←{
     ⎕IO←0
     parse←{↑' '(≠⊆⊢)¨⍺⍺/↑⍵}
     screens←{⍵[⍋⍵]}¨(⊢parse)in←{'|'(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵
     ⍝ 1 has 2 segments, 4 has 4, 7 has 3, and 8 has seven
     ⎕←'part one:',+/+⌿↑,(⊂2 3 4 7)=(≢¨⍤1)screens

     encodings ← (0 1 2 4 5 6) (2 5) (0 2 3 4 6) (0 2 3 5 6) (1 2 3 5) (0 1 3 5 6) (0 1 3 4 5 6) (0 2 5) (0 1 2 3 4 5 6) (0 1 2 3 5 6)

     segments←{
         ⍝ 7 segments; it's in the title
         s←7⍴''
         findNByLength←⍵{⊃(⍺=≢¨⍵)/⍵}⍨⊢
         findByFreq ← ({(⊂(≢⍵) ⍺)}⌸(↑,/⍵)){(⍺=⊃¨⍵)/(1⊃¨⍵)}⍨⊢

         one←findNByLength 2
         seven←findNByLength 3
         four←findNByLength 4
         eight←findNByLength 7

         s[0]←((~seven∊one)/seven)
         s[5]←findByFreq 9
         s[2]←one/⍨~one∊s
         s[1]←findByFreq 6
         s[4]←findByFreq 4
         s[3]←(~four∊s[1 2 5])/four
         s[6]←(~eight∊s)/eight
         {⍵[⍋⍵]}¨(s⌷⍨⊂)¨encodings
     }

    ⎕←'part two:',+/{10⊥(⊃⍵)⍳(1⊃⍵)}¨(↓screens)(⊂⍤,⍤0)⍨segments¨↓(⊣parse)in
 }
