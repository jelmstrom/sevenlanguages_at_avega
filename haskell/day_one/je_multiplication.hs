module Main where

multiply :: [Integer] -> [(Integer, Integer, Integer)]
multiply numbers= [(first, second, first * second) | first <- numbers, second <- numbers]
main= print$ multiply [1,2,3,4,5,6,7,8,9,10,11,12]