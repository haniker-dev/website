module Page.Home where

import Halogen as H
import Halogen.HTML as HH
import Tailwind
import Page.Home.Header as Header

render :: forall a cs m. H.ComponentHTML a cs m
render =
  HH.div [ css style.container ]
    [ Header.view
    ]

style :: _
style =
  { container: tw
      ~ relative
      ~ isolate
      ~ min_h_full
  }
