module BinarySearchTree
(T, empty, insert, fromList, toList, member, merge)
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

instance Ord a => Monoid (T a) where
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


-- Expected result: (((1)3(4))5((6)7(9(100))))
-- >>> insert 100 testValue
-- (((1)3(4))5((6)7(9(100))))

-- Expected result: (((1)3(4))5((6)7(9)))
-- >>> insert 4 testValue
-- (((1)3(4))5((6)7(9)))
insert :: Ord a => a -> T a -> T a
insert x Leaf = Node Leaf x Leaf
insert x (Node t1 y t2)
    | x == y = Node t1 y t2
    | x < y = Node (insert x t1) y t2
    | otherwise = Node t1 y (insert x t2)

-- Expected result: (((1)3(4))5((6)7(9)))
-- >>> fromList [1,3,4,5,6,7,9]
-- (((1)3(4))5((6)7(9)))

-- Expected result: ((1)2)
-- >>> fromList [1,2]
-- ((1)2)
-- LIST MUST BE ORDERED AND ENTRIES MUST BE UNIQUE
fromList :: Ord a => [a] -> T a
fromList [] = empty
fromList [x] = Node Leaf x Leaf
fromList (x:xs) = Node (fromList firstHalf) getPivot (fromList (tail secondHalf))
   where 
       getPivot = (x:xs) !! div (length (x:xs)) 2
       (firstHalf, secondHalf) = splitAt (div (length (x:xs)) 2) (x:xs)



mergeTestValueOne = Node (Node Leaf 1 Leaf) 9 (Node Leaf 20 Leaf)
mergeTestValueTwo = Node (Node Leaf 5 Leaf) 15 (Node Leaf 30 Leaf)

-- >>> merge mergeTestValueOne mergeTestValueTwo
-- (((1)5(9))15((20)30))
merge :: Ord a => T a -> T a -> T a
merge xTree yTree = fromList (sort (nub ((toList xTree) ++ (toList yTree))))
