module Main where



toTuples :: [String] -> [(String, String)]
toTuples items = [(a,b) | a <- items, b <-items, a<b]

main = print $ toTuples["black", "white", "blue","yellow", "red"]