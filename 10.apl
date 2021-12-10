 dayTen←{
     ⎕IO←0
     in←⊃⎕NGET⍵1
     ⍝ ⍣≡ means to repeat until stable; strip balanced character sets until you can't anymore:
     ⍝ ie. the remainging characters have an unbalnce within them
     stripBalanced←'\(\)|\[\]|{}|<>'⎕R''⍣≡⊢
     ⍝ check for the closing braces in the stripped solution; find the corrupted indexes, ~ for incomplete
     cor←0<≢¨(4~⍨⊢)¨illegal←(')]}>'⍳⊢)¨stripped←stripBalanced¨in

     ⎕←'part one:',+/(3 57 1197 25137)⌷⍨(⊂{⊃(4≠⍵)/⍵}¨cor/illegal)
 }
