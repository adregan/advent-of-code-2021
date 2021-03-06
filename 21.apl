 dayTwentyOne←{
     (p1 p2)←{⍎⊃(¯1↑':'(≠⊆⊢)⍵)}¨⊃⎕NGET ⍵ 1
     turn←{
         ⍝ ⍺⍺ is the pred which should take the score and should return true if there is a winner
         ⍝ ⍵⍵ is the roll
         ⍝ ⍵ is a combo of score, current player, and roll count
         ⍝ ⍺ is the max position
         (s psn p rc)←⍵

         (⍺⍺ s):(⊂s),(⊂psn),p,rc ⍝ We have a winner

         np←((⍺,⊢)⌷⍨(0<⊢))⍺|(psn[p]++/⍵⍵ rc) ⍝ np is max if residue is zero
         psn[p]←np ⋄ s[p]←s[p]+np ⍝ sets new position and updates score
         (⊂s),(⊂psn),(~p),(3+rc)
     }

     roll←{
         ⍝ for part one, we roll 3 times and the rolls are deterministic,
         ⍝ ⍵ is the total roll count to this point, ⍺ is the max side
         3↑⍵⌽(1+⍳⍺)
     }

     ⎕←'part one:',((1⊃∘⊃⊢)×(⊃⍤(¯1∘↑)⊢))10(∨/(1000≤⊢))turn(100∘roll)⍣≡(⊂0 0),(⊂p1 p2),0,0
 }
