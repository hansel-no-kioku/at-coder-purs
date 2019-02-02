module AtCoder.Args.SimpleParser
  ( run
  , run'
  , int
  , token
  ) where


import Prelude

import Control.Monad.Error.Class (throwError)
import Control.Monad.State (StateT, evalStateT, get, put)
import Data.Array (uncons)
import Data.Either (Either, either)
import Data.Int (fromString)
import Data.Maybe (Maybe(..), maybe)
import Data.String.Regex (Regex, regex, split)
import Data.String.Regex.Flags (noFlags)


type Parser = StateT (Array String) (Either String)


run ∷ Parser String → String → String
run = runImpl identity


run' ∷ ∀ a. a → Parser a → String → a
run' = runImpl <<< const


token ∷ Parser String
token = do
  state ← get
  case uncons state of
    Just {head, tail} → head <$ put tail
    _ → throwError "End of file."


int ∷ Parser Int
int = maybe (throwError "Can't get a integer") pure <<< fromString =<< token


runImpl ∷ ∀ a. (String → a) → Parser a → String → a
runImpl e p str =
  either e identity $ evalStateT p =<< flip split str <$> spaces


spaces ∷ Either String Regex
spaces = regex "\\s+" noFlags
