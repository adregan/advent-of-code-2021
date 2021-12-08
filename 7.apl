 daySeven←{
     ⎕IO←0
     in←{⍎⊃⊃⎕NGET ⍵ 1}⍵
     ⍝ perform outer product with subtraction of the input
     ⍝ and an array of all possible values 0 - max, apply absolute value
     ⎕←'part one:',⌊/+/moves←(|(⍳1+⌈/)∘.-⊢)in

     ⍝ learned about triangular numbers at The APL Orchard: ⍝ https://en.wikipedia.org/wiki/Triangular_number
     ⍝ rather than sum all the numbers 1–n, the formula (n(n+1))/2 accomplishes the same thing
     ⎕←'part two:',⌊/+/((2÷⍨⊢×1+⊢)⍤0⊢)moves
 }
