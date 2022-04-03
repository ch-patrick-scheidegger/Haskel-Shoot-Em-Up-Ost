module Chapter_01 where

-- Exercise 1.1 (*)
-- Chapter 1 of the book "Programming in Haskell" contains two calculations for double (double 2).
-- Give another possible calculation for the result of double (double 2).


-- Complete the following block comment.
{-
double (double 2)
= double 2 + double 2 = 2 * double x
???
...

double x = x + x
quadruple x = double (double x)

myQuadruple x = 2 * double x
-}

-- >>> myQuadruple 4
-- 16

-- Exercise 1.2 (*)
-- Show that sum [x] = x for any number x. Use the definiton of sum stated in Chapter 1 of "Programming in Haskell". 

-- Complete the following block comment.
{-
sum [x]
= sum[1..3] = sum[1,2,3] = sum[1,2] + 3 = sum[1] + 2 + 3 = 1 + 2 + 3 = 6
???
...
-}


-- Exercise 1.3 (*)
-- Define a function myProduct that produces the product of a list of numbers, and show using your definition that myProduct [2,3,4] == 24.
-- Note: We use the name "myProduct" since the name product is already defined in the ghc Prelude.

myProduct :: Num p => [p] -> p
myProduct [] = 1
myProduct (n:ns) = n * myProduct ns


{-
myProduct [2,3,4]
= {???}
???
...
-}