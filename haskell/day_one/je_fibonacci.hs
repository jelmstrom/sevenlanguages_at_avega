module Main where

je_fibonacci :: Integer -> Integer
je_fibonacci 0=0
je_fibonacci 1=1
je_fibonacci x = je_fibonacci(x-2) + je_fibonacci(x-1)


main = print $ je_fibonacci 5