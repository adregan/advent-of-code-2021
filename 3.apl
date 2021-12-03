 dayThree←{
     ⎕IO←0
     ⍝ execute on each element of each row to preserve binary structure
     ⍝ and mix into a matrix
     in←{↑⍎¨¨⊃⎕NGET ⍵ 1}⍵
     ⍝ to find gamma, sum up th columns and compare results to half the length
     ⍝ of the input. If greater, the most frequent value is 1
     gamma←((≢in)÷2)>+⌿in
     ⍝ epsilon is just the inverse of gamma (not gamma)
     epsilon←~gamma

     ⎕←'part one:',2⊥gamma×2⊥epsilon
 }
