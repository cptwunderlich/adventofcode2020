# Advent of Code 2020

As usual, I won't compete for the leaderboards.
I just want to improve my Haskell (might use another language as well)
and do it for fun.

For the first time ever, I'm streaming my attempts live on Discord.

## Day 1

Should've been rather straight forward, as the problem is a mix between
combinatorics and arithmetic.
I tried to create an "efficient" solution for part 1, but it looks a bit
messy. It would be even more efficient if I would just check and add elements
one at a time, so that I'd only have to iterate over the list once.

For part 2 I just did it the naive way. I tried an optimization,
but it made no difference. I've seen a solution, that uses the same approach
as I did in part 1, by simply iteratively adding `2020-x` to the set too...

One solution on reddit looked really good and terse. For both parts,
a list comprehension with tails etc.

The second part seems to be a variation of the [3SUM problem](https://en.wikipedia.org/wiki/3SUM)

## Day 2

Spent half the time figuring out Cabal and Parsec.
The problem itself was straight forward: counting repetions in a string,
then checking letters at given positions.

My design of part 1 let me reuse most of it.

The only thing I'm not really happy with, is in part 1, counting occurrences
of `char` will not short-curcuit after `max` occurences - I think.
Never too sure how to analyze Haskell programs and what happens under the surface.

## Day 3
