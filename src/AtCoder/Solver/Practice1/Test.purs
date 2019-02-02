module AtCoder.Solver.Practice1.Test
  ( test
  ) where

import Prelude

import AtCoder.Solver.Practice1 (solve)
import Test.Spec (Spec, it)
import Test.Spec.Assertions (shouldEqual)

test ∷ Spec Unit
test = do
    it "1 2 3 test" do
      solve "1\n 2 3\ntest\n" `shouldEqual` "6 test"
