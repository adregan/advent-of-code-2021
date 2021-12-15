 dayFourteen←{
     ⎕IO ⎕FR ⎕PP←0 1287 34
     ⍝ (1 1∘⊂) a useful idiom to produce a head and a tail
     pt←⊃⊃(_ rs)←(0∘<⍤≢¨⊆⊢)⊃⎕NGET ⍵ 1         ⍝ polymer template
     (rules inserts)←↓⍉↑' -> '∘(~⍤∊⍨⊆⊢)¨rs    ⍝ insertion rules
     c←⊣/{⍺,≢⍵}⌸pt

     all←(0,⍨⊣)⌸∪∊rules ⋄ c←{⍺,≢⍵}⌸pt ⋄ m←((~(∪∊rules)∊∪pt)/↓all) ⋄ lCnt←↑((↓c),m)

     insert←{
         ⍝ empty counter for this round of pairs
         pairs←(0,⍨⊣)⌸rules
         _←{
             (p c)←⍵
             ins←⊃inserts⌷⍨rules⍳⊂p
             upIdx←rules⍳((⊃p),ins) (ins,(1⊃p))
             lCnt[(⊣/lCnt)⍳ins;1]←(c+lCnt[(⊣/lCnt)⍳ins;1])
             (c>0): pairs[upIdx;1]←(c+pairs[upIdx;1])
             pairs
         }¨↓⍵
         pairs
     }

     ⍝ initialize the count with the current polymer template
     init←(0,⍨⊣)⌸rules ⋄ init[rules⍳2,/pt;1] ← 1
     ten←(insert⍣10)init
     ⎕←'part one:',(⌈/-⌊/)⊢/lCnt
     _←(insert⍣30)ten
     ⎕←'part two:',(⌈/-⌊/)⊢/lCnt
 }
