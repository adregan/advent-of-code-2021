 daySeven←{
     ⎕IO←0
     in←{⍎⊃⊃⎕NGET ⍵ 1}⍵
     ⍝ perform outer product with subtraction of the input
     ⍝ and an array of all possible values 0 - max,
     ⍝ apply absolute value, sum the rows, and min reduce
     'part one:',⌊/+/|((⍳1+⌈/)∘.-⊢)in
 }
