 dayOne←{
     ⍝ ⍵ is the path to the input file
     in←{⍎¨⊃⎕NGET ⍵ 1}⍵
     +/1 1∘⍉1↓⍉(∘.<⍨in)
 }
