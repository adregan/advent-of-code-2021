 dayFour←{
     ⎕IO←0
     data←⊃⎕NGET ⍵ 1
     nums←⍎⊃data
     ⍝ first partition when the length is greater than zero and then execute each
     ⍝ value in each line before mixing things up.
     boards←((↑⍎¨)¨((0<∘≢¨1∘↓)⊆(1↓⊢)))data

     bingo←{
         ⍝ ⍺ is the boards
         ⍝ ⍵ is the boards state
         ⍝ returns the winning board and the winning state or double 0
         v←((+/¨∧⌿¨⍵)⍳1)
         h←((+/¨∧/¨⍵)⍳1)
         vwin←v⊃⍺,0 ⋄ vstate←v⊃⍵,0
         hwin←h⊃⍺,0 ⋄ hstate←h⊃⍵,0
         (vwin∨hwin)(vstate∨hstate)
     }

     play←{
         ⍝ ⍺ are the numbers to call
         ⍝ ⍵ is the current board state
         ⍝ ⍺⍺ is the call fn
         ⍝ ⍵⍵ is the predicate to check a winner
         ⍝ state is computed by calling the first number and combining with previous state
         state←(⍺⍺⊃⍺)∨⍵
         ⍝ check the state for a winner
         (winner wstate)←⍵⍵ state

         (1<≢winner):winner wstate (⊃⍺) ⍝ If we've got a winner return vals to compute score
         (1↓⍺)∇ state                   ⍝ If not drop the first and recurse
     }

     (winner state n)←(nums){(↓⍵)∊⍨¨boards}play(boards∘bingo)(boards×0)

     ⎕←'part one:',n×+/(~state)/⍥,winner
 }
