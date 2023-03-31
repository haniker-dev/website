module View.Style (defaultStyle) where

import Tailwind

defaultStyle =
  { container: tw
      ~ mx_auto
      ~ max_w_7xl
      ~ px_4
      ~ sm px_6
      ~ lg px_8
  }
