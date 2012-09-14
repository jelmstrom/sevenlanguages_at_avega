module Main where

	combinations :: [String] -> [(String, String)]
	combinations [] = []
	combinations (h:t) = [(h,x) | x <- t ] ++ combinations t
