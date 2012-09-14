module Main where 

	multiplicationTable :: [(Integer, Integer, Integer)]
	multiplicationTable = [(a,b,a*b) | a <- [1..12], b <- [1..12]]


