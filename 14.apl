 dayFourteen←{
     ⎕IO ⎕FR ⎕PP←0 1287 34
     ⍝ (1 1∘⊂) a useful idiom to produce a head and a tail
     pt←⊃⊃(_ rs)←(0∘<⍤≢¨⊆⊢)⊃⎕NGET ⍵ 1         ⍝ polymer template
     (rules inserts)←↓⍉↑' -> '∘(~⍤∊⍨⊆⊢)¨rs    ⍝ insertion rules
     counter←(0,⍨⊣)⌸rules
     insert←{
         current←⍵
         count←counter
         _←{
             (p c)←⍵
             ins←⊃inserts⌷⍨rules⍳⊂p
             upIdx←rules⍳((⊃p),ins) (ins,(1⊃p))
             (c>0): count[upIdx;1]←(c+count[upIdx;1])
             count
         }¨↓⍵
         count
     }
     letterCount←{
         ⍝ ⍵ is the filled in counter
         count←⍵
         {
             dblCount←count[(⍸(⊂∊⍵,⍵)⍷rules);1]
             dblCount+⌈2÷⍨dblCount-⍨+/count[⍸(⍵∊⊢)¨rules;1]
         }¨∪∊rules
     }

     ⍝ initialize the count with the current polymer template
     init←counter ⋄ init[rules⍳2,/pt;1] ← 1
     ⎕←'part one:',(⌈/-⌊/)letterCount (insert⍣10)init
     ⎕←'part two:',(⌈/-⌊/)letterCount (insert⍣40)init
 }
