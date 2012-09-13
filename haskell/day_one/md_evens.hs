module Main where

	even1 :: [Integer] -> [Integer]
	even1 numbers = [a | a <- numbers, mod a 2 == 0]

	even2 :: [Integer] -> [Integer]
	even2 [] = []
	even2 (h:t)  
		| mod h 2 == 0 = h:even2 t
		| otherwise = even2 t

	even3 :: [Integer] -> [Integer]
	even3 [] = []
	even3 (h:t)
		| even h = h:even3 t
		| otherwise = even3 t

	even4 :: [Integer] -> [Integer]
	even4 [] = []
	even4 (h:t) = if even h then h:even4 t else even4 t

