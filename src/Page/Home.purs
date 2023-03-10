module Page.Home where

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Tailwind

render :: forall a cs m. H.ComponentHTML a cs m
render =
  HH.div [ css style.container ]
    [ HH.img [ css style.img, HP.src "https://images.unsplash.com/photo-1545972154-9bb223aac798?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3050&q=80&exp=8&con=-15&sat=-75" ]
    , HH.div [ css style.body ]
        [ HH.p [ css style.domain ] [ HH.text "Haniker.dev" ]
        , HH.h1 [ css style.wip ] [ HH.text "Building In Progress..." ]
        , HH.p [ css style.description ] [ HH.text "Functional Programmers are still compiling their code to make this a great website!" ]
        ]
    ]

style :: _
style =
  { container: tw
      ~ relative
      ~ isolate
      ~ min_h_full
  , img: tw
      ~ absolute
      ~ inset_0
      ~ _z_10
      ~ h_full
      ~ w_full
      ~ object_cover
      ~ object_top
  , body: tw
      ~ mx_auto
      ~ max_w_7xl
      ~ px_6
      ~ py_32
      ~ text_center
      ~ sm py_40
      ~ lg px_8
  , domain: tw
      ~ text_base
      ~ font_semibold
      ~ leading_8
      ~ text_white
  , wip: tw
      ~ mt_4
      ~ text_3xl
      ~ font_bold
      ~ tracking_tight
      ~ text_white
      ~ sm text_5xl
  , description: tw
      ~ mt_4
      ~ text_base
      ~ text_white_over_70
      ~ sm mt_6
  }
