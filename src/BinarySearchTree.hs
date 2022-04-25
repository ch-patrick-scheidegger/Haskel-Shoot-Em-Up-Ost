module BinarySearchTree
(T, empty, insert, fromList, toList, member, merge, fromSortedList, balanceTree)
where

import Data.List (sort, nub)

data T a = Leaf | Node (T a) a (T a)

-- testValue to test tree
--    5
--  3    7
-- 1 4  6 9
testValue = Node (Node (Node Leaf 1 Leaf) 3 (Node Leaf 4 Leaf))
 5 (Node ( Node Leaf 6 Leaf) 7 (Node Leaf 9 Leaf))

-- Expected result: "(((1)3(4))5((6)7(9)))"
-- >>> show testValue
-- "(((1)3(4))5((6)7(9)))"
instance Show a => Show (T a) where
    show Leaf = ""
    show (Node ta x tb) = "(" ++ show ta ++ show x ++ show tb ++ ")"

-- Expected result: True
-- >>> testValue == testValue
-- True
instance Eq a => Eq (T a) where
    (==) xTree yTree = toList xTree == toList yTree

-- Expected result: ((1)5)
-- >>> (Node Leaf 1 Leaf) <> (Node Leaf 5 Leaf)
-- ((1)5)
instance Ord a => Semigroup (T a) where
    xTree <> yTree = merge xTree yTree

instance (Ord a, Semigroup a) => Monoid (T a) where
    mempty = empty
    -- Source: https://wiki.haskell.org/Monoid
    -- defining mappend is unnecessary, it copies from Semigroup
    -- defining mconcat is optional, since it has a default implementation

-- Expected result: [1,3,4,5,6,7,9]
-- >>> toList testValue
-- [1,3,4,5,6,7,9]

toList :: T a -> [a]
toList Leaf = []
toList (Node t1 x t2) = toList t1 ++ [x] ++ toList t2

-- Expected result: true
-- >>> member 4 testValue
-- True
member :: Ord a => a -> T a -> Bool
member x Leaf = False
member x (Node t1 y t2)
    | x == y = True
    | x > y = member x t2
    | otherwise = member x t1

empty :: T a
empty = Leaf


-- Expected result: ((3)5(9))
-- >>> insert 3 (Node (Node Leaf 3 Leaf) 5 (Node Leaf 9 Leaf))
-- ((3)5(9))
insert :: Ord a => a -> T a -> T a
insert x Leaf = Node Leaf x Leaf
insert x (Node t1 y t2)
    | x == y = Node t1 y t2
    | x < y = Node (insert x t1) y t2
    | otherwise = Node t1 y (insert x t2)

-- Expected result: (((2)3)7(8))
-- >>> fromList [7,8,2,3]
-- (((2)3)7(8))
fromList :: Ord a => [a] -> T a
fromList [] = empty
fromList xs = fromSortedList (sort (nub xs))

-- Expected Result: (((1)5(9))15((20)30))
-- >>> merge (Node (Node Leaf 1 Leaf) 9 (Node Leaf 20 Leaf)) (Node (Node Leaf 5 Leaf) 15 (Node Leaf 30 Leaf))
-- (((1)5(9))15((20)30))
merge :: Ord a => T a -> T a -> T a
merge xTree yTree = fromSortedList (sort (nub ((toList xTree) ++ (toList yTree))))

-- Additional Functions
balanceTree :: Ord a => T a -> T a
balanceTree x = fromSortedList (toList x)

-- Requires a sorted list without duplicates!
fromSortedList :: Ord a => [a] -> T a
fromSortedList [] = empty
fromSortedList [x] = Node Leaf x Leaf
fromSortedList (x:xs) = Node (fromSortedList firstHalf) getPivot (fromSortedList (tail secondHalf))
   where
       getPivot = (x:xs) !! div (length (x:xs)) 2
       (firstHalf, secondHalf) = splitAt (div (length (x:xs)) 2) (x:xs)
