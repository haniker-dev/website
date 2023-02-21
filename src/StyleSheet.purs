module StyleSheet where

import Prelude

import Effect (Effect)
import Page.Home as Page.Home

main :: Effect Unit
main = do
  -- TODO import styles here
  _ <- pure Page.Home.style
  pure unit
