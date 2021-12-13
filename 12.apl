 dayTwelve←{
     in←'-'(≠⊆⊢)¨⊃⎕NGET⍵1

     starts←in/⍨s←('start'≡⊃)⍤1⊢↑in
     ends←in/⍨e←('end'≡1∘⊃)⍤1⊢↑in 
     m←in/⍨(~s∨e)
     ⍝ Find the mids with a capital letter and reverse and append to mids
     mids←m,⌽¨(,↑(∨/(⎕A∊⍨⊢)¨⍤1)↑m)/m

     path←{
         ⍵
     }⍣≡

     (mids,ends∘path) starts
 }
