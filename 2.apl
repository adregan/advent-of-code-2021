 dayTwo←{
     ⎕IO←0
     ⍝ Where ⍵ is the path to the data file
     in←↑{' '(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵

     ns←⍎¨⊢/in
     cmds←{⍵∘≡¨⊣/in}¨('forward' 'up' 'down')
     (fw up dn)←+/cmdmat←↑{⍵×ns}¨cmds

     fw×dn-up
 }
