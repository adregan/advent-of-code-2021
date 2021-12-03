 dayTwo←{
     ⎕IO←0
     ⍝ Where ⍵ is the path to the data file
     in←↑{' '(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵
     ns←⍎¨⊢/in
     cmds←⊣/in
     (fw up dn)←{(⍵∘≡¨cmds)/ns}¨('forward' 'up' 'down')
     (+/fw)×(+/dn)-(+/up)
 }
