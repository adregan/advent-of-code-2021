 dayFour ← {
     ⎕IO←0
     data ← ⊃⎕NGET ⍵ 1
     nums ← ⍎⊃data
     ⍝ first partition when the length is greater than zero and then execute each
     ⍝ value in each line before mixing things up.
     boards ← ((↑⍎¨)¨((0<∘≢¨1∘↓)⊆(1↓⊢)))data
 }
