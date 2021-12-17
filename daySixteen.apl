 daySixteen←{
     ⎕IO←0
     ⍝ converts hex to binary
     bin←,⍉2 2 2 2⊤dig←{16⊥⍵⍳⍨⎕D,⎕A}¨hex←⊃⊃⎕NGET⍵1
     (v t p) ← 1 0 0 1 0 0 1⊂bin
     lv4←{2⊥,⍉1↓⍉(5,⍨⌊5÷⍨≢⍵)⍴⍵}
     len←{IL,⍨2⊥1↓⍵↑⍨IL←(16 12)⌷⍨⊃⍵} ⍝ IL is the id and length section 
     op3←{IL↓⍵↑⍨IL+spl←11×⊃(spc IL)←len⍵}
     op6←{IL↓⍵↑⍨IL+⊃(spl IL)←len⍵}
     op3 p

     literal← 'VVVTTTaAAAAbBBBBcCCCC   '
     operator←'VVVTTTILLLLLLLLLLLLLLLAAAAAAAAAAABBBBBBBBBBBBBBBB       '
     ⍉bin(,[0.5])operator
 }
