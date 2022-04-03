{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}

module Chapter_06 where


-- Exercise 6.2 (*)
-- Define a recursive function sumdown :: Int -> Int that returns the sum of the non-negative integers 
-- from a given non-negative integer to zero. For example, sumdown 3 should return the result 3 + 2 + 1 + 0 = 6.

sumdown :: Int -> Int
sumdown 0 = 0
sumdown x = x + sumdown (x - 1)

-- >>> sumdown 5
-- 15


-- Exercise 6.3 (*)
-- Define the exponentiation operator ^ for non-negative integers using the same pattern of recursion 
-- as the multiplication operator *, and show how the expression 2 ^ 3 is evaluated using your definition.
-- Note: If you are trying this within ghc, please note that ^ is already defined in the Prelude. 
-- Use the operator ^# which is currently undefined instead.

(^#) ::  Int -> Int -> Int
-- ??? ^# ??? = ???
-- ??? ^# ??? = ???
(^#) a 0 = 1
(^#) 0 b = 0
(^#) a b = a * a^#(b-1)

-- >>> 3^#3
-- 27

{-
2^3
= 2 * 2^2 = 2 * 2 * 2
???
...
-}



-- Exercise 6.5 (**)
-- Using the recursive definitions given in chapter ”Recursive Functions”,
-- show how length [1,2,3], drop 3 [1,2,3,4,5], and init [1,2,3] are evaluated.

-- length :: [a] -> Int
-- length [] = 0
-- length (_ : xs) = 1 + length xs

-- drop :: Int -> [a] -> [a]
-- drop 0 xs = xs
-- drop _ [] = []
-- drop n (_ : xs) = drop (n - 1) xs

-- init :: [a] -> [a]
-- init [_] = []
-- init (x:xs) = x : init xs

-- No executable code required.
-- Enter your solution within the block comment below.

-- >>> drop 3 [1,2,3,4,5]
-- [4,5]

{-
length [1,2,3]
= 1 + length [2,3] = 1 + 1 + length [3] = 1 + 1 + 1 + length [] = 1 + 1 + 1 + 0 = 3
???
...

drop 3 [1,2,3,4,5]
= drop 2 [2,3,4,5] = drop 1 [3,4,5] = drop 0 [4,5] = [4,5]
???
...

init [1,2,3]
= 1 : init [2,3] = [1,2] : init [3] = [1,2] : [] = [1,2]
???
...

-}
-- >>> init [1,2,3]
-- [1,2]

-- Exercise 6.6 (**)
-- Without looking at the definitions from the standard prelude, define the following 
-- library functions on lists using recursion.
-- Note: If you are trying this within ghc, please note that 
-- these functions are already defined in the Prelude. Use fresh function names 
-- by prefixing each name with a "my" and changing the resulting name into camelcase, 
-- for example "and" becomes "myAnd". The operators you define should be suffixed with a "#" (i.e., !! becomes !!#).
-- Note: Most of these functions are defined in the prelude using other library functions 
-- rather than using explicit recursion, and are generic functions rather than being specific to the type of lists.

-- (a) Decide if all logical values in a list are True: 
--     and :: [Bool] -> Bool


myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (False:_) = False
myAnd (True:xs) = myAnd xs
-- >>> myAnd [False, False, False, False, False]
-- False



-- (b) Concatenate a list of lists:
--     concat :: [[a]] -> [a]
-- concat [[1,2],[3],[4]]
myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (xs:xss) = xs ++ myConcat xss
-- >>> myConcat [[1,2],[3],[4]] 
-- [1,2,3,4]


-- (c) Produce a list with a non-negative number of identical elements: 
--     replicate :: Int -> a -> [a]

myReplicate :: Int -> a -> [a]
myReplicate 0 _ = []
myReplicate n v = v : myReplicate (n-1) v
-- >>> myReplicate 5 5
-- [5,5,5,5,5]


-- (d) Select the nth element of a list: 
--     (!!) :: [a] -> Int -> a

(!!#) :: [a] -> Int -> a
(!!#) (v:_) 0 = v
(!!#) (_:vs) n = (!!#) vs (n-1)
-- >>> [1,2,3] !!# 0
-- 1



-- (e) Decide if a value is an element of a list:
--     elem :: Eq a => a -> [a] -> Bool

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem x (y:ys) = if x == y then True else myElem x ys
-- >>> myElem 3 [3,1,2,4,5]
-- True


-- Exercise 6.7 (**)
-- Define a recursive function merge :: Ord a => [a] -> [a] -> [a] that merges two sorted lists 
-- to give a single sorted list. For example:
-- > merge [2 ,5 ,6] [1 ,3 ,4]
-- > merge [1, 2, 3] [7, 8, 9]
-- [1,2,3,4,5,6]
-- Note: your definition should not use other functions on sorted lists such as insert or isort, 
-- but should be defined using explicit recursion.

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

-- >>> merge [1, 2, 3] [7, 8, 9]
-- [1,2,3,7,8,9]


-- Exercise 6.8 (**)
-- Using merge, define a function msort :: Ord a => [a] -> [a] that implements merge sort, 
-- in which the empty list and singleton lists are already sorted, and any other list is sorted by 
-- merging together the two lists that result from sorting the two halves of the list separately.
-- Hint: first define a function halve :: [a] -> ([a],[a]) that splits a list into two halves whose 
-- lengths differ by at most one.


halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- >>> halve [1,2,3,4]
-- ([1,2],[3,4])

-- >>> halve [1]
-- ([],[1])

msort :: Ord a => [a] -> [a]
msort [] = [] -- maybe not needed
msort [x] = [x]
msort [x, y] = if x <= y then [x,y] else [y,x]
msort xs = merge (msort (fst (halve xs))) (msort (snd (halve xs)))

-- >>> msort [1,5,3,2,7,8,-1,0]
-- [-1,0,1,2,3,5,7,8]

-- >>> msort ['a', 'z', 'c', 'd', 'v']
-- "acdvz"
