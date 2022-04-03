module Chapter_03 where

-- Exercise 3.1
-- What are the types of the following values?

-- e3_1_1 = ['a','b','c']
-- e3_1_1 :: [Char]

-- e3_1_2 = ('a','b','c')
-- e3_1_2 :: (Char, Char, Char)

-- e3_1_3 = [(False,'O'),(True,'1')]
-- e3_1_3 :: [(Bool, Char)]

-- e3_1_4 = ([False,True],['0','1'])
-- e3_1_4 :: ([Bool], [Char])

-- e3_1_5 = [tail, init, reverse]
-- e3_1_5 :: [[x] -> [x]]


-- Exercise 3.2
-- Write down definitions that have the following types; it does not matter what the 
-- definitions actually do as long as they are type correct. The type of your defined 
-- function may be more general than the types defined below.

-- Note: Please replace the ??? and uncomment the type declarations and your answers in order for them to be checked by the compiler.

-- bools :: [Bool]
-- bools = [True, False]

-- nums :: [[ Int ]]
-- nums = [[2,3], [5,6], [7,5]]

-- add :: Num a => a -> a -> a -> a
-- add ??? = ???

-- copy :: b -> (b, b)
-- copy ??? = ???

-- apply :: (t1 -> t2) -> t1 -> t2
-- apply ??? = ???


-- Exercise 3.3 (**)
-- What are the types of the following functions?

-- Hint: take care to include the necessary class constraints in the types if 
-- the functions are defined using overloaded operators.

-- Note: Please replace the ??? and uncomment your answers in order for them to be checked by the compiler.

second xs = head (tail xs) 
-- second :: ???

swap (x,y) = (y,x)
-- swap :: ???

pair x y = (x,y)
-- pair :: ???

double x = x*2
-- double :: ???

palindrome xs = reverse xs == xs 
-- palindrome :: ???

twice f x = f (f x)
-- twice :: ??? 


-- Exercise 3.4 (*)
-- Check your answers to the preceding three questions using GHCi.

-- Copy and paste your ghci session into the block comment below.
{-
patrick@LAPTOP-V8IQA7B7:~/haskellWorkSpace/Haskell-Exercises-shmup-2022-FS$ ghci
GHCi, version 8.10.7: https://www.haskell.org/ghc/  :? for help
Prelude> bools :: [Bool]

<interactive>:1:1: error: Variable not in scope: bools :: [Bool]
Prelude> bools = [True, False]
Prelude> :t bools
bools :: [Bool]
Prelude> nums = [[2,3], [5,6], [7,5]]
Prelude> :t nums
nums :: Num a => [[a]]
Prelude> :t a + b + c

<interactive>:1:1: error: Variable not in scope: a

<interactive>:1:5: error: Variable not in scope: b

<interactive>:1:9: error: Variable not in scope: c
Prelude> :t add a b c = a + b + c

<interactive>:1:11: error: parse error on input ‘=’
Prelude> add a b c = a + b + c
Prelude> :t add
add :: Num a => a -> a -> a -> a
Prelude> copy v = (v, v)
Prelude> :t copy
copy :: b -> (b, b)
Prelude> apply a b = a (b + 5)
Prelude> :t apply
apply :: Num t1 => (t1 -> t2) -> t1 -> t2
Prelude> e3_1_1 = ['a','b','c']
Prelude> :t e3_1_1
e3_1_1 :: [Char]
Prelude> e3_1_2 = ('a','b','c')
Prelude> :t e3_1_2
e3_1_2 :: (Char, Char, Char)
Prelude> e3_1_3 = [(False,'O'),(True,'1')]
Prelude> :t e3_1_3
e3_1_3 :: [(Bool, Char)]
Prelude> e3_1_4 = ([False,True],['0','1'])
Prelude> :t e3_1_4
e3_1_4 :: ([Bool], [Char])
Prelude> e3_1_5 = [tail, init, reverse]
Prelude> :t e3_1_5
e3_1_5 :: [[a] -> [a]]
Prelude> second xs = head (tail xs) 
Prelude> :t second
second :: [a] -> a
Prelude> swap (x,y) = (y,x)
Prelude> :t swap
swap :: (b, a) -> (a, b)
Prelude> pair x y = (x,y)
Prelude> :t pair
pair :: a -> b -> (a, b)
Prelude> double x = x*2
Prelude> :t double
double :: Num a => a -> a
Prelude> palindrome xs = reverse xs == xs 
Prelude> :t palindrome
palindrome :: Eq a => [a] -> Bool
Prelude> twice f x = f (f x)
Prelude> :t twice
twice :: (t -> t) -> t -> t
Prelude> 
-}

-- Exercise 3.5 (**)
-- Why is it not feasible in general for function types to be instances of the Eq class? 
-- When is it feasible? Hint: two functions of the same type are equal if they always 
-- return equal results for equal arguments.

-- Type your answer into the block comment below.
{-
    Eq is a class so a set of types. Its not visible which type is used for the Eq class. Example
    test :: Eq -> Eq -> Bool
    test a b = a == b
    is not valid as it is not implicit enough. The first Eq could be a Bool where as the second one could be a Char
    which is not valid. 

    It would be feasible if the same Eq is passed
    test :: Eq a => a -> a -> Bool

    ----
    Functions in general cannot be compared like this
    testtest :: (a -> b) -> (a -> b) -> Bool 
    as the params a and b are not specified.
-}
-- https://stackoverflow.com/questions/12904310/what-is-wrong-with-this-simple-type-definition-expecting-one-more-argument-to/12904380
