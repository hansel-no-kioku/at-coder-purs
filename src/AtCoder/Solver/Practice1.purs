module AtCoder.Solver.Practice1
  ( solve
  ) where

import Prelude

import AtCoder.Args.SimpleParser (int, run, token)


solve ∷ String → String
solve = run $ solver <$> int <*> int <*> int <*> token


solver ∷ Int → Int → Int → String → String
solver a b c s = show (a + b + c) <> " " <> s
