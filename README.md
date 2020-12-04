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

I thought this one would be really easy and I solved the first part quickly.
But I had a bug in the second part which took me a while to find.

Basically, I immediately had the imperative solution in mind, using modular
arithmetic. But also for a more "functional" approach, I though of `cycle`.

I always for get about `sum` and `product`. I went back to change that in
part 2, where I had a `foldl' (*) 1 fxs`, but I didn't change it for part 1.
A very pretty and terse solution reminded me of these functions.
(actually, it might be better to forget sum/product, according to a
[blog post by Michael Snoyman](https://www.snoyman.com/blog/2020/10/haskell-bad-parts-1).)

A more efficient solution would probably use `Data.Vector` and modular arithmetic.
I think Haskell's TypeClasses could shine for the latter, [like in this post](https://byorgey.wordpress.com/2020/02/15/competitive-programming-in-haskell-modular-arithmetic-part-1/).

## Day 4

A parsing and data validation task.
I think that would have been even easier with RegEx, but I actually haven't taken
the time yet to get and learn a regex library for Haskell.
That's why I stuck with parsec. The first part was done quickly, for the second
one I refactored a bit to make it "nicer".
But then it struck me - I had a bug and it took me forever to find it...
My solution counted one match too many - one parser matched the input, but didn't
consume all of it. I cheated and used another solution to find the culprit.
Parser combinators are deceptively simple... <* EOF

