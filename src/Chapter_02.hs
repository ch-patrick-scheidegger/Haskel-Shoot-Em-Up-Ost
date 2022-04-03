module Chapter_02 where


-- Exercise 2.1 (*)
-- Work through the examples of chapter ”First Steps” (Programming in Haskell p.14-20) using GHCi.

-- Copy and paste your ghci session into the block comment below.
{-
patrick@LAPTOP-V8IQA7B7:~/haskellWorkSpace/Haskell-Exercises-shmup-2022-FS$ ghci
GHCi, version 8.10.7: https://www.haskell.org/ghc/  :? for help
Prelude> sqrt (3^2 + 4^2)
5.0
Prelude> 2+3*4
14
Prelude> (2+3)*4
20
Prelude> head [1,2,3,4,5]
1
Prelude> tail [1,2,3,4,5]
[2,3,4,5]
Prelude> tail []
*** Exception: Prelude.tail: empty list
Prelude> tail [1]
[]
Prelude> [1,2,3,4,5] !! 2
3
Prelude> [1,2,3,4,5] !! 22
*** Exception: Prelude.!!: index too large
Prelude> [] ! 0

<interactive>:10:4: error:
    Variable not in scope: (!) :: [a0] -> t0 -> t
Prelude> [] !! 0
*** Exception: Prelude.!!: index too large
Prelude> [] !! -1

<interactive>:12:1: error:
    Precedence parsing error
        cannot mix ‘!!’ [infixl 9] and prefix `-' [infixl 6] in the same infix expression
Prelude> [1,2,3,4,5] !! 0
1
Prelude> take 3 [1,2,3,4,5]
[1,2,3]
Prelude> take 0 [1,2,3,4,5]
[]
Prelude> take 0 []
[]
Prelude> take 1 []
[]
Prelude> take 1000 []
[]
Prelude> take 1-000 []

<interactive>:19:1: error:
    • Non type-variable argument in the constraint: Num ([a1] -> [a1])
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a1 a2.
              (Num ([a1] -> [a1]), Num ([a2] -> [a1] -> [a1])) =>
              [a1] -> [a1]
Prelude> take -1000 []

<interactive>:20:1: error:
    • Non type-variable argument
        in the constraint: Num ([a1] -> Int -> [a2] -> [a2])
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a1 a2.
              (Num ([a1] -> Int -> [a2] -> [a2]), Num (Int -> [a2] -> [a2])) =>
              Int -> [a2] -> [a2]
Prelude> drop 3 [1,2,3,4,5]
[4,5]
Prelude> drop 0 [1,2,3,4,5]
[1,2,3,4,5]
Prelude> length []
0
Prelude> length 0

<interactive>:24:8: error:
    • No instance for (Num [a0]) arising from the literal ‘0’
    • In the first argument of ‘length’, namely ‘0’
      In the expression: length 0
      In an equation for ‘it’: it = length 0
Prelude> [] ++ [] ++ []
[]
Prelude> [3] ++ [1] ++ [2]
[3,1,2]
Prelude> [3] ++ [1] ++ [[1],2]

<interactive>:27:1: error:
    • Non type-variable argument in the constraint: Num [a]
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a. (Num a, Num [a]) => [[a]]
Prelude> [3] ++ [1] ++ [[1]]

<interactive>:28:1: error:
    • Non type-variable argument in the constraint: Num [a]
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a. (Num a, Num [a]) => [[a]]
Prelude> [[] ++ []]
[[]]
Prelude> [[3] ++ [3]]
[[3,3]]
Prelude> [[3] ++ [3]] ++ []
[[3,3]]
Prelude> [[3] ++ [3]] ++ [2]

<interactive>:32:1: error:
    • Non type-variable argument in the constraint: Num [a]
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a. (Num a, Num [a]) => [[a]]
Prelude> [[3] ++ [3]] ++ [[2]]
[[3,3],[2]]
Prelude> factorial n = product [1..n]
Prelude> factorial n = product [2..n]
Prelude> factorial 3
6
Prelude> factorial 5
120
Prelude> average ns = sum ns ‘div‘ length ns

<interactive>:38:21: error: lexical error at character 'd'
Prelude> average ns = sum ns `div` length ns
Prelude> average 2,3,4

<interactive>:40:10: error: parse error on input ‘,’
Prelude> average [2,3,4,5]
3
Prelude> :t div
div :: Integral a => a -> a -> a
Prelude> div 4 2
2
Prelude> div 9 7
1
Prelude> :t mod
mod :: Integral a => a -> a -> a
Prelude> mod 9 7
2
Prelude> mod 9 9
0
Prelude> mod 9 8
1
Prelude> mod -9 -8

<interactive>:49:1: error:
    • Non type-variable argument in the constraint: Num (a -> a -> a)
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a. (Integral a, Num (a -> a -> a)) => a -> a -> a
Prelude> average [1,11]
6
Prelude> 
-}

-- Exercise 2.2 (*)
-- Parenthesise the following numeric expressions:
-- 2^3*4 2*3+4*5 2+3*4^5

e_2_2_a :: Int
e_2_2_a = (2^3)*4
-- >>> e_2_2_a
-- 32

e_2_2_b :: Int
e_2_2_b = (2*3)+(4*5)
-- >>> e_2_2_b
-- 26

e_2_2_c :: Int
e_2_2_c = 2+(3*(4^5))
-- >>> 3* 4^5
-- 3072
-- >>> e_2_2_c
-- 3074