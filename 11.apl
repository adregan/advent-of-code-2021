 dayEleven ← {
     ⎕IO←0
     in←(⍎⍤0)↑⊃⎕NGET⍵1
     flash←{
         fc nxt←⍵       ⍝ flash count and next state
         f←10≤nxt       ⍝ identify all the flashers
         ⍝ the stenciled sum of the flashers is the amount that cell should increase,
         ⍝ excluding those that were equal to zero (they already flashed this round).
         nxt←nxt+(0≠nxt)×{+/,⍵}⌺3 3⊢f
         nxt[⍸f]←0      ⍝ set all the flashers to zero
         ⍝ update the flash count with the sum of flashers and return with next state
         (fc+(+/,f)) nxt
     }⍣≡    ⍝ run until stable
     ⍝ step follows the script from the prompt: add one to everyone and flash.
     step←{fc s←⍵ ⋄ flash fc (1+s)}

     ⎕←'part one:',⊃(step⍣100)0 in
     ⍝ For part 2 we count the number of steps and recurse until all are zero
     ⎕←'part two:',{⍺←0 ⋄ c←⍺+1 ⋄ (_ s) ← step 0 ⍵ ⋄ (0=+/,s): c ⋄ c ∇ s }in
 }
