{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Attoparsec.Text

newtype TrackSection = TrackSection Int deriving (Show)

parseTS :: Parser TrackSection
parseTS = string "TS" >> TrackSection <$> decimal

main :: IO ()
main = do
    let p = parse (many1 parseTS) "TS123TS234hi"
    print $ feed p ""
