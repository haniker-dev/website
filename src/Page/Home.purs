module Page.Home where

import Tailwind (Tw, css, _z_10, absolute, font_bold, font_semibold, h_full, inset_0, isolate, leading_8, lg, max_w_7xl, min_h_full, mt_4, mt_6, mx_auto, object_cover, object_top, px_6, px_8, py_32, py_40, relative, sm, text_3xl, text_5xl, text_base, text_center, text_white, text_white_over_70, tracking_tight, tw, w_full, (~))

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

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

style
  :: { body :: Tw "mx-auto max-w-7xl px-6 py-32 text-center sm:py-40 lg:px-8"
     , container :: Tw "relative isolate min-h-full"
     , description :: Tw "mt-4 text-base text-white/70 sm:mt-6"
     , domain :: Tw "text-base font-semibold leading-8 text-white"
     , img :: Tw "absolute inset-0 -z-10 h-full w-full object-cover object-top"
     , wip :: Tw "mt-4 text-3xl font-bold tracking-tight text-white sm:text-5xl"
     }
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
