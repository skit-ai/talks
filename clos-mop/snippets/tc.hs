#!/usr/bin/env stack
{- stack
  script
  --resolver lts-8.8
  --package text
-}
{-# LANGUAGE OverloadedStrings #-}

import Data.Char

class Serializable a where
  dumps :: a -> String
  loads :: String -> a

class Animal a where
  speak :: a -> String
  shout :: a -> String
  shout it = map toUpper (speak it)
  speak it = map toLower (shout it)

data Mammal = Cow String | Dog String | Abhinav

instance Animal Mammal where
  speak (Cow _) = "moo!"
  speak (Dog _) = "boo!"
  speak Abhinav = "lol"

main :: IO ()
main = do
  let a = Cow "cow-1"
  putStrLn $ speak a
  putStrLn $ shout a
