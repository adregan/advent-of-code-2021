 dayFour ← {
     ⎕IO←0
     data ← ⊃⎕NGET ⍵ 1
     nums ← ⍎⊃data
     ⍝ first partition when the length is greater than zero and then execute each
     ⍝ value in each line before mixing things up.
     boards ← ((↑⍎¨)¨((0<∘≢¨1∘↓)⊆(1↓⊢)))data
     nums boards
     bingo←{
         ⍝ ⍺ is the boards
         ⍝ ⍵ is the board state
         ⍝ returns the winning board or a 0
         v ← ((+/¨∧⌿¨⍵)⍳1)⊃⍺,0
         h ← ((+/¨∧/¨⍵)⍳1)⊃⍺,0
         v ∨ h
     }

     play←{
         ⍝ ⍺ are the numbers to call
         ⍝ ⍵ is the current board state
         ⍝ ⍺⍺ is the call fn
         ⍝ ⍵⍵ is the predicate to check a winner
         ⍝ state is computed by calling the first number and combining with previous state
         state←(⍺⍺⊃⍺)∨⍵
         ⍝ check the state for a winner
         winner←⍵⍵ ⍵
         (1<≢winner):winner
         (1↓⍺) ∇ state
     }

     (nums) {(↓⍵)∊⍨¨boards} play (boards∘bingo) (boards × 0)
 }
