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
         winners←,((∨/¨∧⌿¨)∨(∨/¨∧/¨))⍵
         ((winners⍳1)⊃⍺,0) ((winners⍳1)⊃⍵,0)
     }

     play←{
         ⍝ ⍺ are the numbers to call
         ⍝ ⍵ is the current board state
         ⍝ ⍺⍺ is the call fn
         ⍝ ⍵⍵ is the predicate to check a winner
         ⍝ state is computed by calling the first number and combining with previous state
         state←(⍺⍺⊃⍺)∨⍵
         ⍝ check the state for a board matching the predicate
         (match mstate)←⍵⍵ state

         (1<≢match):match mstate ⍺    ⍝ If we've got a match return vals to compute score
         (1↓⍺)∇ state                 ⍝ If not drop the first and recurse
     }

     (winner state rest)←(nums){(↓⍵)∊⍨¨boards}play(boards∘bingo)(boards×0)

     ⎕←'part one:',⊃rest×+/(~state)/⍥,winner

     lose←{
         ⍝ ⍺ is the boards
         ⍝ ⍵ is the boards state
         ⍝ returns the losing board and the losing state or double 0
         winners←((∨/¨∧⌿¨)∨(∨/¨∧/¨))⍵
         loser←(~winners)⍳1
         ((1-⍨≢⍺)=+/winners):(loser⊃⍺)(loser⊃⍵)
         0 0
     }

     ⍝ Identify the losing board and then play it until it wins
     (loser lstate lrest)←(nums){(↓⍵)∊⍨¨boards}play(boards∘lose)(boards×0)
     (lwinner state rest)←(rest){(↓⍵)∊⍨¨(⊂loser)}play((⊂loser)∘bingo)(⊂lstate)

     ⎕←'part two:',⊃rest×+/(~,state)/⍥,lwinner
 }
