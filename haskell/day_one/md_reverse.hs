module Main where

	reverse1 :: [Integer] -> [Integer]
	reverse1 [] = []
	reverse1 (x:xs) = reverse1(xs) ++ [x]
