module Page.Home where

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

render :: forall a cs m. H.ComponentHTML a cs m
render =
  HH.div [ HP.classes [ HH.ClassName "relative isolate min-h-full" ] ]
    [ HH.img [ HP.classes [ HH.ClassName "absolute inset-0 -z-10 h-full w-full object-cover object-top" ], HP.src "https://images.unsplash.com/photo-1545972154-9bb223aac798?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3050&q=80&exp=8&con=-15&sat=-75" ]
    , HH.div [ HP.classes [ HH.ClassName "mx-auto max-w-7xl px-6 py-32 text-center sm:py-40 lg:px-8" ] ]
        [ HH.p [ HP.classes [ HH.ClassName "text-base font-semibold leading-8 text-white" ] ] [ HH.text "Haniker.dev" ]
        , HH.h1 [ HP.classes [ HH.ClassName "mt-4 text-3xl font-bold tracking-tight text-white sm:text-5xl" ] ] [ HH.text "Building In Progress..." ]
        , HH.p [ HP.classes [ HH.ClassName "mt-4 text-base text-white/70 sm:mt-6" ] ] [ HH.text "Functional Programmers are still compiling their code to make this a great website!" ]

        ]
    ]
