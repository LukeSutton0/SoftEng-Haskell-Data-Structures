module Lib
    ( someFunc,
        sqr
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

sqr :: Int -> Int
sqr x = x * x

