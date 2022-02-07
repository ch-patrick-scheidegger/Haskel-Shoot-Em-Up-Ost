module Chapter_16 where

-- Note: There are neither any tests nor automated tests for this chapter. It appears in this form in order to have a uniform format with resprct to the previous chapters.


data Nat = Zero | Succ Nat

add :: Nat -> Nat -> Nat
add Zero m = m
add (Succ n) m = Succ (add n m)

-- Exercise 16.1
-- Show that add n (Succ m) = Succ (add n m), by induction on n. Only use the definition of add in your proof.


-- Exercise 16.2
-- Using the property add n (Succ m) = Succ (add n m), together with add n Zero = n, show that addition is commutative (i.e. add n m = add m n) , by induction on n.

