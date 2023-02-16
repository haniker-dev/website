module Theme
  ( ThemeClass
  , _z_10
  , absolute
  , css
  , deadCSSCode
  , h_full
  , inset_0
  , isolate
  , lg
  , max_w_7xl
  , min_h_full
  , mt_4
  , mt_6
  , mx_auto
  , object_cover
  , object_top
  , prefix
  , px_6
  , px_8
  , py_32
  , py_40
  , relative
  , sm
  , sm''mt_6
  , sm'_mt_6
  , sm__mt_6
  , text_base
  , text_center
  , text_white_over_70
  , themeClassGen
  , w_full
  ) where

import Prelude

import Data.Array (fold, foldl)
import Debug as Debug
import Halogen.HTML (ClassName(..), IProp)
import Halogen.HTML.Properties (class_)
import Test.QuickCheck.Arbitrary (arbitrary)
import Test.QuickCheck.Gen (Gen)

-- Sample usage of Tailwind CSS:
-- "relative isolate min-h-full"
-- "absolute inset-0 -z-10 h-full w-full object-cover object-top"
-- "mx-auto max-w-7xl px-6 py-32 text-center sm:py-40 lg:px-8"
-- "text-base font-semibold leading-8 text-white"
-- "mt-4 text-3xl font-bold tracking-tight text-white sm:text-5xl"
-- "mt-4 text-base text-white/70 sm:mt-6"

newtype ThemeClass = ThemeClass String

derive newtype instance Eq ThemeClass
derive newtype instance Ord ThemeClass

-- Semigroup and Monoid laws must be tested!!!
-- Associativity law for Semigroup is very important
-- because we MUST preserve the ordering of the classes
instance Semigroup ThemeClass where
  append a (ThemeClass "") = a
  append (ThemeClass "") b = b
  append (ThemeClass a) (ThemeClass b) = ThemeClass $ a <> " " <> b

instance Monoid ThemeClass where
  -- ThemeClass can be EMPTY!!!
  mempty = ThemeClass ""

toString :: ThemeClass -> String
toString (ThemeClass s) = s

css :: ∀ r i. Array ThemeClass -> IProp (class :: String | r) i
css xs = class_ $ ClassName $ toString $ fold xs

-- Classes: Should be generated by a tool from TailwindCSS

relative :: ThemeClass
relative = ThemeClass "relative"

isolate :: ThemeClass
isolate = ThemeClass "isolate"

min_h_full :: ThemeClass
min_h_full = ThemeClass "min-h-full"

absolute :: ThemeClass
absolute = ThemeClass "absolute"

inset_0 :: ThemeClass
inset_0 = ThemeClass "inset-0"

_z_10 :: ThemeClass
_z_10 = ThemeClass "-z-10"

h_full :: ThemeClass
h_full = ThemeClass "h-full"

w_full :: ThemeClass
w_full = ThemeClass "w-full"

object_cover :: ThemeClass
object_cover = ThemeClass "object-cover"

object_top :: ThemeClass
object_top = ThemeClass "object-top"

mx_auto :: ThemeClass
mx_auto = ThemeClass "mx-auto"

max_w_7xl :: ThemeClass
max_w_7xl = ThemeClass "max-w-7xl"

px_6 :: ThemeClass
px_6 = ThemeClass "px-6"

px_8 :: ThemeClass
px_8 = ThemeClass "px-8"

py_32 :: ThemeClass
py_32 = ThemeClass "py-32"

py_40 :: ThemeClass
py_40 = ThemeClass "py-40"

text_center :: ThemeClass
text_center = ThemeClass "text-center"

mt_4 :: ThemeClass
mt_4 = ThemeClass "mt-4"

mt_6 :: ThemeClass
mt_6 = ThemeClass "mt-6"

text_base :: ThemeClass
text_base = ThemeClass "text-base"

text_white_over_70 :: ThemeClass
text_white_over_70 = ThemeClass "text-white/70"

-- Break points

{-| Class-based breakpoints -}
sm__mt_6 :: ThemeClass
sm__mt_6 = ThemeClass "sm:mt-6"

sm'_mt_6 :: ThemeClass
sm'_mt_6 = ThemeClass "sm:mt-6"

sm''mt_6 :: ThemeClass
sm''mt_6 = ThemeClass "sm:mt-6"

{-| Array-based breakpoints 
-}
prefix :: String -> ThemeClass -> ThemeClass
prefix _ (ThemeClass "") = mempty
prefix p (ThemeClass a) = ThemeClass $ p <> a

foldWithPrefix :: String -> Array ThemeClass -> ThemeClass
foldWithPrefix p xs = foldl (\b a -> b <> prefix p a) mempty xs

sm :: Array ThemeClass -> ThemeClass
sm xs = foldWithPrefix "sm:" xs

lg :: Array ThemeClass -> ThemeClass
lg xs = foldWithPrefix "lg:" xs

{- This function exists to ensure that 
  Purescript compiler does dead code elimination
-}
deadCSSCode :: Debug.DebugWarning => ThemeClass
deadCSSCode =
  let
    _ = Debug.spy "deadCSSCode" "is compiled"
  in
    ThemeClass "deadCSSCode"

-- For testing purposes
themeClassGen :: Gen ThemeClass
themeClassGen = ThemeClass <$> arbitrary
