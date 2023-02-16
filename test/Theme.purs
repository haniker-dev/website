module Test.Theme where

import Prelude

import Effect.Class (liftEffect)
import Test.QuickCheck.Laws.Data.Monoid (checkMonoidGen)
import Test.QuickCheck.Laws.Data.Semigroup (checkSemigroupGen)
import Test.Spec (Spec, describe, it)
import Theme (themeClassGen)

spec :: Spec Unit
spec =
  describe "Theme" do
    it "Semigroup Laws" do
      liftEffect $ checkSemigroupGen themeClassGen

    it "Monoid Laws" do
      liftEffect $ checkMonoidGen themeClassGen
