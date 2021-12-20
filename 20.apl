 dayTwenty←{
     ⎕IO←0
     (alg img) ← {(∊⊃⍵) ((↑⊃1↓⍵))}(0∘<⍤≢¨⊆⊢){⊃⎕NGET ⍵ 1}⍵
     ⍝ (,∘⌽∘⍉⍣4) is an idiom for "Surround matrix Ym with scalar Xs" (from aplcart.info)
     ⍝ multiplying by the size of the image for appropriate room to grow
     pad←{'.'(,∘⌽∘⍉⍣(4×≢⍵))⍵}
     enhance←{alg⌷⍨2⊥,⍵∊'#'}⌺3 3⊢

     +/,'#'=(enhance⍣2)(pad img)
 }
