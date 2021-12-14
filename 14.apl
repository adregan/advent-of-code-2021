 dayFourteen←{
     ⎕IO←0
     ptemp←⊃⊃(_ rs)←(0∘<⍤≢¨⊆⊢)⊃⎕NGET ⍵ 1  ⍝ polymer template
     (rules ins)←↓⍉↑' -> '∘(~⍤∊⍨⊆⊢)¨rs    ⍝ insertion rules

     insert←{¯1↓⍵(,,⍤0)0,⍨∊ins⌷⍨⊂⊢/↑⍸⍉rules∘.≡(2,/⍵)}

     ⎕←'part one:',(⌈/-⌊/)(≢⊢)⌸(insert⍣10)ptemp
 }
