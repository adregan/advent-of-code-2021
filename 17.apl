 daySeventeen←{
     ⎕IO←0
     ⍝ remove the comma, split on spaces, take last 2 and reverse for y x,
     ⍝ remove y= and x= from each, and decode. TODO: cleaner parse
     (y x)←⍎¨¨'..'(≠⊆⊢)¨'y=|x='⎕R''¨⌽¯2↑' '(≠⊆⊢)','⎕R''∊⊃⎕NGET ⍵ 1

     step←{
         ⍝ ⍺ is the target area; ⍵ is the velocity and the path of the projectile and the hit marker
         (v p h)←⍵
         (cY cX)←(⊃⌽p)
         (oY oX)←((⌊/⊃),(⌈/⊃∘⌽))⍺
         (iY iX)←((⌈/⊃),(⌊/⊃∘⌽))⍺
         hit←∧/(∧/2≤/(oY cY iY)),(∧/2≤/(iX cX oX))
         ⍝ return the input when the abs. value of last point is greater than the outermost boundary
         (∨/(cY<oY),(cX>oX)): (v p (h∨hit))
         ⍝ y delta is ¯1, x delta is the direction of the negated x (drag); new point is velocity plus last position
         (v+(¯1,×-(⊃⌽v))) (p,(⊂v+⊃⌽p)) (h∨hit)
     }
     ys←{(⌽-1+⍵),0,1+⍵}(⍳⌈⍥|/(2×y))
     xs←(1+⍳⌈/x)
     hits←⊃∘⌽¨all←{((y x)∘step⍣≡) ⍵ (⊂0 0) 0}¨velos←,ys∘.,xs
     ⎕←'part one:',⌈/∊⌈⍥⊃/¨¨1⊃¨hits/all ⍝ yeesh pretty gnarly
     ⎕←'part two:',+/hits
 }
