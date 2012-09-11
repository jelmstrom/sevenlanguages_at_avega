module Main where

je_fibonacci :: Integer -> Integer
je_fibonacci x
    | x >1 =  je_fibonacci(x-2) + je_fibonacci(x-1)
    | otherwise = x


main = print $ je_fibonacci 5