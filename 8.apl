 dayEight←{
     screens←↑' '(≠⊆⊢)¨⊢/↑in←{'|'(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵
     ⍝ 1 has 2 segments, 4 has 4, 7 has 3, and 8 has seven
     ⎕←'part one:',+/+⌿↑,(⊂2 3 4 7)=(≢¨⍤1)screens
 }
