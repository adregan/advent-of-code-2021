 dayNine←{
     ⎕IO←0
     in←(⍎⍤1 0)↑⊃⎕NGET ⍵ 1
     ⍝ turn all the stencil padding into 10s
     hmap←{n←⍵ ⋄ (⍺[0]↑n)←10 ⋄ (⍺[1]↑⍉n)←10 ⋄ ⊂n}⌺3 3⊢in

     lowest←{
         (t c b l _ r)←((1⌷∘⍉⊢),(1⌷⊢))⍵
         (∧/c<t l b r):c
         -1
     }

     ⎕←'part one:',(+/⍣2)(l←1+lowest¨hmap)

     ⍝ basinSize←{
     ⍝     ⍝ ⍺ is the map matrix; ⍵ is the coords queue ((y, x))
     ⍝     init←((y x)←∊⊃⍵)⌷⍺
     ⍝     row←y⌷⍺
     ⍝     col←x⌷⍉⍺
     ⍝     r ← ⊃(1+x)↓row
     ⍝     l ← ⊃x↑row
     ⍝     d ← ⊃(1+y)↓col
     ⍝     u ← ⊃y↑col
     ⍝ }

     ⍝ The position of the basin starts is any point that's not zero
     ⍝ ((9≠⊢in) basinSize⊢)⊃⍸(0<l)
 }
