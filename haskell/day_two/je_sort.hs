module Sort where
import Data.List (sort)

nativeSort :: [Integer] -> [Integer]
nativeSort list = sort list

quickSort :: Ord a => [a] ->[a]
quickSort [] = []
quickSort (head:tail) =
    let smaller = quickSort [x | x <- tail, x <=head]
        bigger =  quickSort [x | x <- tail, x > head]
    in smaller ++ [head] ++ bigger



mergeSort :: Ord a => [a] -> [a]
mergeSort []    =  []
mergeSort [x]  =  [x]
mergeSort list   =  merge (mergeSort left) (mergeSort right)
    where (left, right)  = splitAt (length list `div`2) list


merge :: Ord a => [a] -> [a] -> [a]
merge [] list = list
merge list [] = list
merge (left_h:left_t) (right_h:right_t)
 | left_h <= right_h = left_h:merge left_t (right_h:right_t) -- merge rest of left with right
 | otherwise = right_h:merge (left_h:left_t) right_t  -- merge all left with rest of right



main = print $ mergeSort [1,2,5,3,7,2,457,37,0,37,3]

