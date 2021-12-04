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

     lifeSupport←{
         ⍝ ⍵ is our matrix of values
         ⍝ ⍺⍺ is the predicate
         ⍝ ⍺ is the current index intialized to zero
         ⍺←0
         ⍝ current represents the column we're operating on at this moment
         cur←⍺⌷⍉⍵
         ⍝ the filter is determined by applying the predicate to the current for
         ⍝ the criteria (0 or 1) which is then compared to the values in the current
         filter←↑(⍺⍺cur)=cur
         ⍝ the rest is the filter applied to the rows
         rest←filter⌿⍵
         (1=⍨≢rest):,rest  ⍝ when one result, reshape to vector and return
         (⍺+1)∇rest        ⍝ otherwise: recurse
     }
     halfLen←2÷⍨(≢⊢)

     ⍝ The s-prime combinator: apply the arg in parallel to +/ and halfLen and
     ⍝ then perform the boolean operation.
     oxy←(+/≥(halfLen⊢))lifeSupport in
     co2←(+/<(halfLen⊢))lifeSupport in

     ⎕←'part two:',oxy×⍥(2∘⊥)co2
 }
