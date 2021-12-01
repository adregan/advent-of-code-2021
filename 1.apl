dayOne←{
    ⍝ ⍵ is the path to the input file
    in←{⍎¨⊃⎕NGET ⍵ 1}⍵
    ⍝ counts the number of times the value increases as we advance through the array
    countIncreasing←{+/1 1⍉0 1↓∘.<⍨⍵}
    ⍝ part one advances through the array one at a time
    one←countIncreasing in
    ⍝ part two advances through the array n-wise 3 at a time
    two←countIncreasing 3+/in
    'part one:',one,'part two:',two
}
