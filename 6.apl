 daySix←{
     ⎕IO←0
     in←{⍎⊃⊃⎕NGET ⍵ 1}⍵

     init←↑+⌿{c←9⍴0 ⋄ c[⍵] ← 1 ⋄ c}¨in

     day←{
        ⍝ ⍵ is the previous day's state
        state ← ⍵
        new ← ⍵[0]

        state[⍳7] ← 1⌽⍵[⍳7]
        state[6] ← state[6] + ⍵[7]
        state[7] ← ⍵[8]
        state[8] ← new
        state
     }
     ⍝ Call day 80 times on the input
     ⎕←'part one:',+/(day⍣80)init
     ⍝ Call day 256 times on the input
     ⎕←'part two:',0⍕+/(day⍣256)init
 }
