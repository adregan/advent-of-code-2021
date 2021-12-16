 dayFourteen←{
     ⎕IO ⎕FR ⎕PP←0 1287 34
     ⍝ (1 1∘⊂) a useful idiom to produce a head and a tail
     pt←⊃⊃(_ rs)←(0∘<⍤≢¨⊆⊢)⊃⎕NGET ⍵ 1         ⍝ polymer template
     (rules inserts)←↓⍉↑' -> '∘(~⍤∊⍨⊆⊢)¨rs    ⍝ insertion rules
     ⍝ initialize the letter count with the current polymer template
     defLetC←(0,⍨⊣)⌸∪∊rules ⋄ ptc←{⍺,≢⍵}⌸pt ⋄ ml←((~(∪∊rules)∊∪pt)/↓defLetC) ⋄ lCnt←↑((↓ptc),ml)
     defRuleC←(0,⍨⊣)⌸rules ⋄ pairC←{⍺,≢⍵}⌸2,/pt ⋄ mR←((~rules∊(⊣/pairC))/↓defRuleC) ⋄ init←↑((↓pairC),mR)

     insert←{
         (lCount pairC)←⍵
         pairs←(0,⍨⊣)⌸rules ⍝ empty counter for this round of pairs
         letterCounts←{
             (p pCnt)←⍵
             ins←⊃inserts⌷⍨rules⍳⊂p
             upIdx←rules⍳((⊃p),ins) (ins,(1⊃p))
             _←pairs[upIdx;1]←(pCnt+pairs[upIdx;1])
             (ins pCnt)
         }¨↓pairC
         newCount←lCount{
            s←⍺
            (h t)←(1 1∘⊂⍵)
            (l c)←⊃h
            s[(⊣/s)⍳l;1]←(c+s[(⊣/s)⍳l;1])
            (0=≢t): s
            s∇t
         }letterCounts
         (newCount pairs)
     }
     (tenLc tenS)←(insert⍣10) (lCnt init)
     ⎕←'part one:',(⌈/-⌊/)⊢/tenLc
     (tlc _)←(insert⍣30) (tenLc tenS)
     ⎕←'part two:',(⌈/-⌊/)⊢/tlc
 }
