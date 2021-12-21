 dayTwo←{
     ⎕IO←0
     ⍝ Where ⍵ is the path to the data file
     ⍝ <SEPARATOR>(≠⊆⊢)<INPUT> is the idiom for partition
     in←↑{' '(≠⊆⊢)¨⊃⎕NGET ⍵ 1}⍵

     ⍝ take the right side of the data (the numbers) and decode each of them.
     ns←⍎¨⊢/in
     ⍝ grab all the command arrays by matching the left side of the data with each
     cmds←{⍵∘≡¨⊣/in}¨('forward' 'down' 'up')
     ⍝ Multiply each command array with the numbers, mix them and make the
     ⍝ command matrix before summing the rows into the forward, down, and up totals
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
