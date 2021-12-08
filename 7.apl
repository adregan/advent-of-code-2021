 daySeven←{
     ⎕IO←0
     in←{⍎⊃⊃⎕NGET ⍵ 1}⍵
     ⍝ perform outer product with subtraction of the input
     ⍝ and an array of all possible values 0 - max, apply absolute value
     ⎕←'part one:',⌊/+/moves←(|(⍳1+⌈/)∘.-⊢)in

     ⍝ crab calc is a brute force sum of all the numbers from 1..n
     ⍝ where n is each entry in the move matrix
     ⎕←'part two:',⌊/+/((+/(1∘+⍤⍳⊢))⍤0⊢)moves
 }
