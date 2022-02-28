module Chapter_03 where

-- Exercise 3.1
-- What are the types of the following values?

-- e3_1_1 = ['a','b','c']
-- e3_1_1 :: ???

-- e3_1_2 = ('a','b','c')
-- e3_1_2 :: ???

-- e3_1_3 = [(False,'O'),(True,'1')]
-- e3_1_3 :: ???

-- e3_1_4 = ([False,True],['0','1'])
-- e3_1_4 :: ???

-- e3_1_5 = [tail, init, reverse]
-- e3_1_5 :: ???


-- Exercise 3.2
-- Write down definitions that have the following types; it does not matter what the definitions actually do as long as they are type correct. The type of your defined function may be more general than the types defined below.


-- bools :: [Bool]
-- bools = ???

-- nums :: [[ Int ]]
-- nums = ???

-- add :: Num a => a -> a -> a -> a
-- add = ???

-- copy :: b -> (b, b)
-- copy = ???

-- apply :: (t1 -> t2) -> t1 -> t2
-- apply = ???


-- Exercise 3.3 (**)
-- What are the types of the following functions?

-- Hint: take care to include the necessary class constraints in the types if the functions are defined using overloaded operators.

-- second xs = head (tail xs) 
-- second :: ???

-- swap (x,y) = (y,x)
-- swap :: ???

-- pair x y = (x,y)
-- pair :: ???

-- double x = x*2
-- double :: ???


-- palindrome xs = reverse xs == xs 
-- palindrome :: ???

-- twice f x = f (f x)
-- twice :: ??? 


-- Exercise 3.4 (*)
-- Check your answers to the preceding three questions using GHCi.

-- Copy and paste your ghci session into the block comment below.
{-
-}

-- Exercise 3.5 (**)
-- Why is it not feasible in general for function types to be instances of the Eq class? When is it feasible? Hint: two functions of the same type are equal if they always return equal results for equal arguments.

-- Type your answer into the block comment below.
{-
-}
