module Chapter_08 where


-- Exercise 8.1 (*) 
-- In a similar manner to the function add for the data type Nat below, 
-- define a recursive multiplication function 
-- mult :: Nat -> Nat -> Nat for the recursive type of natural numbers. 
-- Hint: make use of add in your definition.

data Nat = Zero | Succ Nat
    deriving (Eq, Show)

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

-- >>> add (Succ Zero) (Succ Zero)
-- Succ (Succ Zero)

-- flatten :: Nat -> Nat
-- flatten Zero = Zero
-- flatten (Succ Zero) = Zero
-- flatten (Succ (Succ a)) = Succ a

-- >>> flatten (add (Succ Zero) (Succ Zero))
-- Succ Zero

-- 3 * 2 = 3 + (3 + (0))

mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult _ Zero = Zero
mult m (Succ n) = add m (mult m n)

-- >>> mult (add (Succ Zero) (Succ Zero)) (add (Succ Zero) (Succ Zero))
-- Succ (Succ (Succ (Succ Zero)))


-- Exercise 8.5 (**)
-- Given the type declaration for Expr below, define a higher-order function 
-- folde such that folde f g replaces each Val constructor in an expression by 
-- the function f, and each Add constructor by the function g.

data Expr = Val Int | Add Expr Expr
    deriving Show

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f g (Val x) = f x
folde f g (Add x y) = g (folde f g x) (folde f g y)


-- Exercise 8.6 (**)
-- Using folde, define a function eval :: Expr -> Int that evaluates an 
-- expression to an integer value, and a function size :: Expr -> Int that 
-- calculates the number of values in an expression.

eval :: Expr -> Int
eval = folde id (+)


size :: Expr -> Int
size = folde (\x -> 1) (+)


-- Exercise 8.7 (**)
-- Provide instance definitions to make the Expr and List types an instance of the Eq typeclass.

instance Eq Expr where
    -- (==) :: Expr a => a -> a -> bool
    Val x == Val y = x == y
    Add x1 x2 == Add y1 y2 = x1 == y1 && x2 == y2
    Val _ == Add _ _ = False
    Add _ _ == Val _ = False


data List a = Nil | Cons a (List a)
    deriving Show


instance Eq a => Eq (List a) where
    -- (==) :: List a => a -> a -> bool
    Nil == Nil = True
    Cons x xss == Cons y yss = x == y && xss == yss
    Nil == Cons x xss = False 
    Cons x xss == Nil = False 


