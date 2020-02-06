module Exercise.Problems1to10 where

-- Problem 1
--   Find the last element of a list.
--   Example: myLast [1,2,3,4] => 4, myLast ['x','y','z'] => 'z'

myLast l = last l

-- Problem 2
--   Find the last but one element of a list
--   Example: myLast [1,2,3,4] => 3, myLast ['x','y','z'] => 'y'

myButLast l = last (init l)

-- Problem 3
--   Find the kth element of a list
--   Example: elementAt [1,2,3,4] 3 => 3, elementAt "haskell" 5 => 'e'

elementAt l k = if k == 1
                then head l
                else elementAt (tail l) (k-1)

-- Problem 4
--   Find the number of elements of a list
--   Example: myLength [1,2,3,4] => 4, myLength "haskell" => 7

myLength l = if null l
    then 0
    else 1 + myLength (tail l)

-- Problem 5
--   Reverse a list
--   Example: myReverse [1,2,3,4] => [4,3,2,,1], myReverse "haskell" => "lleksah"

myReverse l = if length l == 1
    then l
    else myReverse (tail l) ++ [head l]