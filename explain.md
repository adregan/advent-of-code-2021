# Advent of Code 2021 APL Explanations

As an APL neophyte, it may be worth capturing descriptions of the idioms used in
solving the problems.

## General IO

Input is given via text files downloaded from the advent of code site. So there
is a need for some data wrangling before we can produce our solution. These are
the idioms used to read the files.

### Reading a series of numbers

Given a text file with a series of numbers, e.g.:

```
3742
234
1243
3567
...
```

You can read the file and produce an array of numbers with the following idiom:

`⍎¨⊃⎕NGET [path/to/file] 1`

[⎕NGET](https://help.dyalog.com/17.0/Content/Language/System%20Functions/nget.htm) is a utility for reading a file which returns the data in the first index, so we take the first with right shoe `⊃`. As each line is a nested character array, we can "execute each" with hydrant diaeresis (⍎¨), converting strings into ints.

## Problems

### Day One

#### Part One

```apl
solve ← {+/1 1⍉0 1↓∘.<⍨⍵}
```

Breaking the solution up into "phrases" we have (in order of execution): `∘.<`, `0 1↓`, `1 1⍉`, `+/`.

- `∘.<`
By first performing an outer product with less than (∘.<) we have the solution
in the upper right diagonal—illustrated here by the 1s in the boolean mask. So
the "tricky" part is getting at those values.

```
┌→──────────────────┐
↓0 1 0 0 0 0 0 0 0 0│
│0 0 1 0 0 0 0 0 0 0│
│0 0 0 1 0 0 0 0 0 0│
│0 0 0 0 1 0 0 0 0 0│
│0 0 0 0 0 1 0 0 0 0│
│0 0 0 0 0 0 1 0 0 0│
│0 0 0 0 0 0 0 1 0 0│
│0 0 0 0 0 0 0 0 1 0│
│0 0 0 0 0 0 0 0 0 1│
│0 0 0 0 0 0 0 0 0 0│
└~──────────────────┘
```

- `0 1↓`
allows us to drop the leading column so that the important values are in
the leading diagonal.

- `1 1⍉`
We can then select only those values in the leading diagonal with the idiom `1 1⍉`.

- `+/`
At this point, a plus reduce `+/` will give us the answer

#### Part Two

Part two involves the same calculation but batches values together in the sum of
a rolling window of 3. The rest of thealgorithm remains the same, we just need to manipulate the
input.

In APL this can be easily done with [Reduce
n-wise](https://help.dyalog.com/latest/#Language/Primitive%20Operators/Reduce%20N%20Wise.htm#ReduceN-Wise)
as shown here with a 3n-wise catenate reduction:

```
in ← 199 200 208 210 200 207 240 269 260 263
3,/in

┌───────────┬───────────┬───────────┬───────────┬───────────┬───────────┬───────────┬───────────┐
│199 200 208│200 208 210│208 210 200│210 200 207│200 207 240│207 240 269│240 269 260│269 260 263│
└───────────┴───────────┴───────────┴───────────┴───────────┴───────────┴───────────┴───────────┘
```

To instead sum them, we need `+3/`. After that, we can pass the result to the
original algorithm for the answer.

#### Simpler solution

While checking my work, I came across a much shorter solution which I am
preserving here for future reference.

As it's possible to do an n-wise reduction with <, you can more optimally use:

```
one ← +/2</⊢
two ← +/2</3+/⊢
```
