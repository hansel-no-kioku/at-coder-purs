module AtCoder.Args.Parser
  ( run
  , run'
  , int
  ) where

import Prelude

import Data.Either (either)
import Data.Foldable (foldMap)
import Data.Int (fromString)
import Data.Maybe (fromMaybe)
import Data.String.CodeUnits (singleton)
import Text.Parsing.StringParser (ParseError, Parser, runParser)
import Text.Parsing.StringParser.CodePoints (anyDigit, skipSpaces)
import Text.Parsing.StringParser.Combinators (many1)


run ∷ Parser String → String → String
run = runImpl show


run' ∷ ∀ a. a → Parser a → String → a
run' = runImpl <<< const


int ∷ Parser Int
int = do
  skipSpaces
  str ← foldMap singleton <$> many1 anyDigit
  pure $ fromMaybe 0 $ fromString str


runImpl ∷ ∀ a. (ParseError → a) → Parser a → String → a
runImpl e p = either e identity <<< runParser p
