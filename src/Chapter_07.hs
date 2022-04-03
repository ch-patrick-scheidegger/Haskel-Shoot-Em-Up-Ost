{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use uncurry" #-}
{-# HLINT ignore "Use curry" #-}
{-# HLINT ignore "Use any" #-}
{-# HLINT ignore "Use all" #-}

module Chapter_07 where

-- Exercise 7.1 (*)
-- Show how the list comprehension [f x | x <- xs, p x] can be re-expressed using the higher-order functions map and filter.

e_7_1 :: (a -> b) -> (a -> Bool) -> [a] -> [b]

-- e_7_1 f p xs = ???map???filter???
e_7_1 f p xs = map f (filter p xs)
-- >>> e_7_1 (\x -> x * 2) even [1,2,3,4,5,6]
-- [4,8,12]


-- Exercise 7.2 (**)
-- Without looking at the definitions from the standard prelude, define the following higher-order 
-- library functions on lists. Try to use the higher-order functions and, or, (.), foldr and map 
-- within your definitions if possible.
-- Note: in the prelude the first two of these functions are generic functions rather 
-- than being specific to the type of lists.
-- Note: If you are trying this within ghc, please note that these functions are already 
-- defined in the Prelude. Use fresh function names by prefixing each name with a "my" and 
-- changing the resulting name into camelcase, for example "all" becomes "myAll". 

-- (a) Decide if all elements of a list satisfy a predicate:
--     all :: (a -> Bool) -> [a] -> Bool

myAll :: (a -> Bool) -> [a] -> Bool

myAll p = foldr (\x y -> (p x) && y) True
-- >>> myAll even [2,4,6]
-- True


-- (b) Decide if any element of a list satisfies a predicate:
--     any :: (a -> Bool) -> [a] -> Bool

myAny :: (a -> Bool) -> [a] -> Bool

myAny p = foldr (\x y -> (p x) || y) False
-- >>> myAny even [1,3,4,7]
-- True


-- (c) Select elements from a list while they satisfy a predicate:
--     takeWhile :: (a -> Bool) -> [a] -> [a]

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f = foldr (\x y -> if f x then x : y else []) []

-- (2 : (4 : (5 : (8 : []))))
-- (2 : (4 : []))
-- >>> myTakeWhile even [2,4,5,8]
-- [2,4]


-- (d) Remove elements from a list while they satisfy a predicate:
--     dropWhile :: (a -> Bool) -> [a] -> [a]

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = []
myDropWhile p (x:xs) = if p x then myDropWhile p xs else x:xs 


-- foldr (2 : (4 : (5 : (6 : []))))
-- foldl (((([] : 2) : 4) : 5) : 6)

-- >>> dropWhile even [2,4,6,9,8,7,6,5,4,3] 
-- [9,8,7,6,5,4,3]

-- >>> myDropWhile even [2,4,5,6]
-- [5,6]


-- Exercise 7.3 (**)
-- Redefine the functions map and filter using foldr.

myMap :: (a -> b) -> [a] -> [b]
-- myMap f = foldr ??? ???
myMap f = foldr (\x y -> (f x) : y) []
-- >>> myMap (*2) [1,2,3,4]
-- [2,4,6,8]


myFilter :: (a -> Bool) -> [a] -> [a]
-- myFilter f = foldr ??? ???
myFilter p = foldr (\x y -> if p x then x : y else y) []
-- >>> myFilter even [1,2,3,4,5,6,7,8]
-- [2,4,6,8]

myOdd = not . even 
myOdd2 n = not (even n)

-- >>> myOdd2 3
-- True


-- Exercise 7.5 (**)
-- Without looking at the definitions from the standard prelude, define the higher-order library 
-- function curry that converts a function on pairs into a curried function, and, conversely, 
-- the function uncurry that converts a curried function with two arguments into a function on pairs.
-- Hint: first write down the types of the two functions.

-- myCurry :: ???
myCurry f x y = f (x,y)

-- >>> myCurry (\x -> x + 4) (4)
-- Non type-variable argument in the constraint: Num (a, b)
-- (Use FlexibleContexts to permit this)


-- myUncurry :: ??? 
myUncurry f (x, y) = f x y

