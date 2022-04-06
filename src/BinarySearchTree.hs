module BinarySearchTree
(T, empty, insert, fromList, toList, member, merge)
where

data T a = Leaf | Node (T a) a (T a)
   --deriving () -- Semigroup, Monoid

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
    Leaf == Leaf = True
    Node ta1 x1 tb1 == Node ta2 x2 tb2 = x1 == x2 && ta1 == ta2 && tb1 == tb2
    _ == _ = False

-- testValue to test tree
--    5
--  3    7
-- 1 4  6 9
testValue = Node (Node (Node Leaf 1 Leaf) 3 (Node Leaf 4 Leaf))
 5 (Node ( Node Leaf 6 Leaf) 7 (Node Leaf 9 Leaf))

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

-- Expected result: (((1)3((4)4))5((6)7(9)))
-- >>> insert 4 testValue
-- (((1)3((4)4))5((6)7(9)))
insert :: Ord a => a -> T a -> T a
insert x Leaf = Node Leaf x Leaf
insert x (Node t1 y t2)
    | x == y = Node (insert x t1) y t2
    | x < y = Node (insert x t1) y t2
    | otherwise = Node t1 y (insert x t2)

fromList :: Ord a => [a] -> T a
fromList [] = undefined 
fromList [x] = undefined 
fromList (x:xss) = Node (Node Leaf x Leaf) x (Node Leaf x Leaf) 

merge :: Ord a => T a -> T a -> T a
merge = undefined
