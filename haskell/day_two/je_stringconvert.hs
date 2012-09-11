module StringConvert where
import Data.Char

stripNonAlphaNum :: [Char] -> [Char]
stripNonAlphaNum string =   ([x | x <- string, isAlphaNum x])


convertString :: [Char] -> Float
convertString  string = read (stripNonAlphaNum string) :: Float


main = print $ convertString "12345"