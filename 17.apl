 daySeventeen←{
     ⎕IO←0
     ⍝ remove the comma, split on spaces, take last 2 and reverse for y x,
     ⍝ remove y= and x= from each, and decode. TODO: cleaner parse
     (y x)←⍎¨¨'..'(≠⊆⊢)¨'y=|x='⎕R''¨⌽¯2↑' '(≠⊆⊢)','⎕R''∊⊃⎕NGET ⍵ 1
     pp←{
         (y x)←⍵
         ⍝ build target area; min absolute y by difference of xs; pad with max y and x
         s←ta←⊖⌽(⌈⍥|/y)(⌈/x)↑(⌊⍥|/y)(|⍤-/x)⍴1
         s[⍸ta] ← '#' ⋄ s[⍸~ta] ← '.' ⋄ s[0;0] ← 'S' ⋄ s
     }
     step←{
         ⍝ ⍺ is the target area; ⍵ is the velocity and the path of the projectile
         (v p)←⍵
         ⍝ return the input when the abs. value of last point is greater than the outermost boundary
         (⊃⌽p)∨/⍤>⍥|(((⌊/⊃),(⌈/⊃∘⌽))⍺): (v p)
         ⍝ y delta is ¯1, x delta is the direction of the negated x (drag); new point is velocity plus last position
         (v+(¯1,×-(⊃⌽v))) (p,(⊂v+⊃⌽p))
     }

     ((y x)∘step⍣≡) (2 7) (⊂0 0)
 }
