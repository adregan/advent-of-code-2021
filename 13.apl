 dayThirteen←{
     (c i)←d⊆⍨0<≢¨d←⊃⎕NGET ⍵ 1
     ⍝ coords are x,y, reverse for y,x
     coord←⌽⍤⍎¨c
     ⍝ instructions have the axis in the first position and the amount to fold
     instr←{s←' '(≠⊆⊢)⍵ ⋄ s←'='(≠⊆⊢)⊃¯1↑s ⋄ s[1]←⍎⊃s[1] ⋄ s}¨i
     ⍝ folding is taking ↑ a given amount from the top and bottom of the grid,
     ⍝ reverse first ⊖ on the bottom, and then or'ing ∨ them together.
     fold←{(⍺↑⍵)∨(⊖(¯1×⍺)↑⍵)}
     run←{
         ⍝ ⍵ is the boxed instruction set and grid
         (axis amt)←⊃⊃(i g)←⍵
         ⍝ he tail of the instructions
         nxt←(1↓i)
         axis='y':(nxt(amt fold g))
         ⍝ spin grid clockwise before folding and then spin it back
         axis='x':(nxt(⍉⌽(amt fold⌽⍉g)))
         nxt g
     }

     ⍝ grid is initialized with each coordinate set to 1
     g←(↑1+⌈/coord)⍴0 ⋄ g[coord]←1
     ⎕←'part one:',+/,1⊃run⍣≡((1↑instr)g)
     ⎕←'part two:'
     ⍝ formats the output so that it's easier to read
     ⎕←((' ' '⌷')⌷⍨⊢⍤1)¨(1⊃run⍣≡(instr g))
 }
