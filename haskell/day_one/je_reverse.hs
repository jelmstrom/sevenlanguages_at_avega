module Main where

revNative :: [Integer] -> [Integer]
revNative = reverse


revHeadTail :: [a] -> [a]
revHeadTail [] = []
revHeadTail (h:t) = revHeadTail(t) ++[h]

revFoldL :: [a] -> [a]
revFoldL  = foldl(\acc x-> x:acc) []


main = print $ "loaded"