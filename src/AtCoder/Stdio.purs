module AtCoder.Stdio
  ( stdin
  , stdio
  ) where

import Prelude

import Effect (Effect)
import Effect.Console (log)

foreign import stdin ∷ (String → Effect Unit) → Effect Unit

stdio ∷ (String → String) → Effect Unit
stdio = stdin <<< (log <<< _)
