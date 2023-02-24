module StyleSheet where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect (Effect)
import Effect.Class.Console (log)
import Page.Home as Page.Home
import Type.Data.Symbol (class Append, class Cons) as Symbol
import Type.Proxy (Proxy(..))

-- https://pursuit.purescript.org/builtins/docs/Prim.Symbol
-- https://jordanmartinez.github.io/purescript-jordans-reference-site/content/21-Hello-World/06-Type-Level-Programming/src/02-Symbol-Example-ps.html

main :: Effect Unit
main = do
  -- TODO import styles here
  _ <- pure Page.Home.style
  log $ show style.container
  pure unit

style
  :: { container :: Theme "my-4 mb-2 sm:mt-4 sm:bg-red"
     }
style =
  { container: css
      ~ my_4
      ~ mb_2
      ~ sm
          ( css
              ~ mt_4
              ~ bg_red
          )
  }

data Theme :: Symbol -> Type
data Theme a = Theme

instance IsSymbol a => Show (Theme a) where
  show :: Theme a -> String
  show _ = reflectSymbol (Proxy :: Proxy a)

class Appendable :: Symbol -> Symbol -> Symbol -> Constraint
class Appendable a b c | a b -> c

type Start :: Symbol
type Start = "@@@"

instance Appendable Start b b
else instance Appendable "" b b
else instance Appendable a "" a
else instance
  ( Symbol.Append a " " a1
  , Symbol.Append a1 b c
  ) =>
  Appendable a b c

combine
  :: forall a b c
   . Appendable a b c
  => Theme a
  -> Theme b
  -> Theme c
combine _ _ = Theme

infixr 5 combine as ~

-- Base CSS Functions

{-| Placeholder functions for nicer formatting
-}
css :: Theme Start
css = Theme

my_4 :: Theme "my-4"
my_4 = Theme

mb_2 :: Theme "mb-2"
mb_2 = Theme

mt_4 :: Theme "mt-4"
mt_4 = Theme

bg_red :: Theme "bg-red"
bg_red = Theme

-- Nested CSS Functions

class MapPrefix :: Symbol -> Symbol -> Symbol -> Constraint
class MapPrefix prefix inputLabel outputLabel | inputLabel -> outputLabel

instance
  -- Set lastHead as " " to generate prefix for first element
  ( MapPrefixHelper " " prefix inputLabel outputLabel
  ) =>
  MapPrefix prefix inputLabel outputLabel

class MapPrefixHelper :: Symbol -> Symbol -> Symbol -> Symbol -> Constraint
class MapPrefixHelper lastHead prefix inputLabel outputLabel | lastHead prefix inputLabel -> outputLabel

instance MapPrefixHelper lastHead prefix "" ""

else instance
  ( Symbol.Cons h tail inputLabel
  , Symbol.Append prefix h o1
  , MapPrefixHelper h prefix tail o2
  , Symbol.Append o1 o2 outputLabel
  ) =>
  MapPrefixHelper " " prefix inputLabel outputLabel

else instance
  ( Symbol.Cons h1 tail inputLabel
  , MapPrefixHelper h1 prefix tail o1
  , Symbol.Append h1 o1 outputLabel
  ) =>
  MapPrefixHelper lastHead prefix inputLabel outputLabel

sm
  :: ∀ a b
   . MapPrefix "sm:" a b
  => Theme a
  -> Theme b
sm _ = Theme
