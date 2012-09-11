module StringConvert where
import Data.Char

stripNonAlphaNum :: [Char] -> [Char]
stripNonAlphaNum string =   ([x | x <- string, isNumber x || x == '.'])   -- Uggly


convertString :: [Char] -> Float
convertString  string = read (stripNonAlphaNum string) :: Float


main = print $ convertString "£0001,234.50"