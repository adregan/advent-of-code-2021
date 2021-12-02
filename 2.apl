 dayTwo←{
     ⎕IO←0
     ⍝ Where ⍵ is the path to the data file
     in←{' '(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵
     ⍝ ⍺ is the command to find ⍵ is the input
     ⍝ The execute ⍎ would be better off the file read
     s←{+/⍎¨↑1⌷¨(⍺∘≡⍤⊃¨⍵)/⍵}
     ('forward'∘s×'down'∘s-'up'∘s)in
 }
