module Main where


	data Tree a = Tip | Node a (Tree a) (Tree a) deriving (Show, Eq)

	leaf x = Node x Tip Tip

	insert a Tip = leaf a
	insert a (Node value treeLeft treeRight) 
		| a <= value = Node value (insert a treeLeft) treeRight
		| otherwise = Node value treeLeft (insert a treeRight)

	listToTree list = foldr(insert) Tip list

	treeToList Tip = []
	treeToList (Node value xl xr) = treeToList xl ++ (value : treeToList xr)
	
	sortList :: [Integer] -> [Integer]
	sortList = treeToList . listToTree
