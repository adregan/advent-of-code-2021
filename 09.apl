 dayNine←{
     ⎕IO←0
     in←(⍎⍤1 0)↑⊃⎕NGET ⍵ 1
     ⍝ turn all the stencil padding into 10s
     hmap←{n←⍵ ⋄ (⍺[0]↑n)←10 ⋄ (⍺[1]↑⍉n)←10 ⋄ ⊂n}⌺3 3⊢in

     findLowest←{
         (t c b l _ r)←((1⌷∘⍉⊢),(1⌷⊢))⍵
         (∧/c<t l b r):c
         -1
     }

     ⎕←'part one:',(+/⍣2)(l←1+findLowest¨hmap)

     ⍝ create two bit map of the area; mark all the low points with a unique number; flood fill
     bMap←(9≠⊢in) ⋄ bMap[lowCoords]←1+⍳≢lowCoords←⍸(0<l)
     filled ← (××{1⊃⌈/⍵,⍉⍵}⌺3 3)⍣≡bMap
     ⍝ TODO: I have no idea how this flood fill works (××{1⊃⌈/⍵,⍉⍵}⌺3 3)⍣≡⊢ . From least to most perplexing:
     ⍝ - Q: the stencil always takes the center of the max rows; why?
     ⍝
     ⍝ - Q: what does ×× do?
     ⍝ - A: You're reading it differently than you should. I believe the
     ⍝      rightmost × is the middle tine of a fork with a mondaic direction on the
     ⍝      left
     ⍝
     ⍝ - Q: f⍣≡ is supposed to call f until the predicate on the right is satisfied,
     ⍝      but how will the initial map ever match the filled map?
     ⍝ - A: f⍣≡Y means apply f to Y until stable, ie. the output doesn't change from the previous call.
     'part two:',×/3↑{⍵[⍒⍵]}((+/⍣2)filled=⊢)¨(1+⍳≢lowCoords)
 }
