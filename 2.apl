 dayTwo←{
     ⎕IO←0
     ⍝ Where ⍵ is the path to the data file
     in←↑{' '(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵

     ns←⍎¨⊢/in
     cmds←{⍵∘≡¨⊣/in}¨('forward' 'down' 'up')
     (fw dn up)←+/cmdmat←↑{⍵×ns}¨cmds

     ⎕←'part one:',fw×dn-up

     ⍝ the command matrix with the first row (forward) dropped represents
     ⍝ the running aim if we plus scan the rows subtract the columns
     aim←-⌿+\1↓cmdmat

     ⍝ once we've constructing a matrix of forward commands
     ⍝ and running aim, we can multiply the columns for the various
     ⍝ depth increases and sum them for the total depth
     depth←+/×⌿↑(0⌷cmdmat)(aim)

     ⎕←'part two:',fw×depth
 }
