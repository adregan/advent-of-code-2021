 dayFourteen←{
     ⎕IO←0
     ⍝ (1 1∘⊂) a useful idiom to produce a head and a tail
     d←(1 1∘⊂)⊃⎕NGET ⍵ 1
     pt←⊃⊃d       ⍝ polymer template
     rs←1↓⊃1⊃d    ⍝ insertion rules
 }
