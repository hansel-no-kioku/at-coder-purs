module Test.Main where

import Prelude

import AtCoder.Solver.Practice1.Test (test)
import Effect (Effect)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (run)

main ∷ Effect Unit
main = run [consoleReporter] do
  test
