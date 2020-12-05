{-# LANGUAGE LambdaCase #-}

module Main where

import Data.Foldable (Foldable(foldl'))
import Data.List (sort)

{-

Author: Benjamin M.
https://github.com/cptwunderlich

Part 1: Find highest seat ID.
        Starting from Interval 0-127, perform 7 halvings and choose the
        interval part indicated by input ('F' lower part, 'B' upper).
        For the last 3 characters, handle interval 0-7.
        seat ID = row * 8 + col

Part 2: Given list of seat IDs, find missing ID, where ID-1 and ID+1 exist.

https://adventofcode.com/2020/day/5

-}

data Interval = Iv Int Int

instance Show Interval where
    show (Iv l u) = "From " ++ show l ++ " to " ++ show u

ivMin :: Interval -> Int
ivMin (Iv m _) = m

uRow :: Int
uRow = 127

uCol :: Int
uCol = 7

halfIv :: Interval -> (Interval, Interval)
halfIv (Iv l u) = (Iv l (l + h), Iv (u - h) u)
 where
     diff = u - l
     h = diff `div` 2

txInput :: String -> [(a, a) -> a]
txInput = map (\case
                'F' -> fst
                'B' -> snd
                'L' -> fst
                'R' -> snd)

seatId :: String -> Int
seatId s = ivMin (finalIv uRow $ fst parts) * 8 + ivMin (finalIv uCol $ snd parts)
 where
     parts      = splitAt 7 s
     finalIv u s  = foldl' (\i f -> f $ halfIv i) (Iv 0 u) $ txInput s

part1 :: [String] -> Int
part1 = maximum . map seatId

part2 :: [String] -> Int
part2 s = findMissing $ zip sids (tail sids)
 where
     sids           = sort $ map seatId s
     findMissing p  = foldl' (\m (x, y) -> if y - x == 2 then x+1 else m) 0 p

main :: IO ()
main = interact go
 where
     go inp = "Part 1: " ++ show (part1 $ lines inp)
            ++ "\nPart 2: " ++ show (part2 $ lines inp) ++ "\n"