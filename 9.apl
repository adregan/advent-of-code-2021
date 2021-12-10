 dayNine←{
     ⎕IO←0
     in←(⍎⍤1 0)↑⊃⎕NGET ⍵ 1
     hmap←{n←⍵ ⋄ (⍺[0]↑n)←10 ⋄ (⍺[1]↑⍉n)←10 ⋄ ⊂n}⌺3 3⊢in

     lowest←{
         (t c b l _ r)←((1⌷∘⍉⊢),(1⌷⊢))⍵
         (∧/c<t l b r):c
         -1
     }

     ⎕←'part one:',(+/⍣2)(1+lowest¨hmap)
 }
