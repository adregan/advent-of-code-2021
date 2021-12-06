 daySix←{
     in←{⍎⊃⊃⎕NGET ⍵ 1}⍵
     ⍝ A day starts by generating any new fish (count the zeros, initialize array of 8s)
     ⍝ Subtract 1 from the previous day, replace ¯1s with 6s and catenate new
     day←{new←(+/0=⍵)⍴8 ⋄ (6@(¯1∘=))((⍵-1),new)}
     ⍝ Call day 80 times on the input
     ⎕←'part one:',≢(day⍣80)in
     ⍝ Call day 256 times on the input
     ⎕←'part two:',≢(day⍣256)in
 }
