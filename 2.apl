 dayTwo←{
     ⎕IO←0
     ⍝ Where ⍵ is the path to the data file
     in←{' '(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵
     ⍝ ⍺ is the command to find ⍵ is the input
     sumCommand←{+/⍎¨↑1⌷¨(⍺∘≡⍤⊃¨⍵)/⍵}
     up←'up'sumCommand in
     down←'down'sumCommand in
     forward←'forward'sumCommand in
     forward×down-up
 }
