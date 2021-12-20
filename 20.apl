 dayTwenty←{
     ⎕IO←0
     ⍝ convert the algorithm and image to binary
     (alg img) ← {('#'∊⍨∊⊃⍵) ('#'∊⍨(↑⊃1↓⍵))}(0∘<⍤≢¨⊆⊢){⊃⎕NGET ⍵ 1}⍵
     enhance←{
         ⍝ ⍵ contains the padding element and the image
         (p i)←⍵
         ⍝ (,∘⌽∘⍉⍣4) is an idiom for "Surround matrix Ym with scalar Xs" (from aplcart.info)
         padded←p(,∘⌽∘⍉⍣4)i
         ⍝ converts the stencil padding to the padding element, p
         enhanced←{s←⍵ ⋄ (⍺[0]↑s)←p ⋄ (⍺[1]↑⍉s)←p ⋄ alg⌷⍨2⊥,s}⌺3 3⊢padded
         (0 0⌷enhanced) enhanced
     }

     ⎕←'part one:',+/,1⊃(enhance⍣2) (0 img)
     ⎕←'part two:',+/,1⊃(enhance⍣50) (0 img)
 }
