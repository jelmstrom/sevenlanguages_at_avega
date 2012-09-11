module Main where


foldEvens :: [Integer] -> [Integer]
foldEvens list = foldr(\value acc-> if (even value) then value:acc else acc ) []   list

filterEvens ::  [Integer] -> [Integer]
filterEvens = filter even

listCompEvens :: [Integer] -> [Integer]
listCompEvens [] = []
listCompEvens  list = [value | value <-list , even value]

main = print $ "done"