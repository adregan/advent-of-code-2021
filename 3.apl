 dayThree←{
     ⎕IO←0
     ⍝ execute on each element of each row to preserve binary structure
     ⍝ and mix into a matrix
     in←{↑⍎¨¨⊃⎕NGET ⍵ 1}⍵
     ⍝ to find gamma, sum up th columns and compare results to half the length
     ⍝ of the input. If greater, the most frequent value is 1
     ⍝ epsilon is just the inverse of gamma (not gamma)
     epsilon←~gamma←((≢in)÷2)>+⌿in

     ⍝ over (⍥) is handy because it allows us to first apply the decode to each
     ⍝ arguments and then apply multiplication to the pair
     ⎕←'part one:',gamma×⍥(2∘⊥)epsilon
 }
