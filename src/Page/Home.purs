module Page.Home where

import Prelude

import Theme
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

render :: forall a cs m. H.ComponentHTML a cs m
render =
  HH.div [ HP.class_ $ HH.ClassName "relative isolate min-h-full" ]
    [ HH.img [ HP.classes [ HH.ClassName "absolute inset-0 -z-10 h-full w-full object-cover object-top" ], HP.src "https://images.unsplash.com/photo-1545972154-9bb223aac798?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3050&q=80&exp=8&con=-15&sat=-75" ]
    , HH.div [ HP.classes [ HH.ClassName "mx-auto", HH.ClassName "max-w-7xl px-6 py-32 text-center sm:py-40 lg:px-8" ] ]
        [ HH.p [ HP.classes [ HH.ClassName "text-base font-semibold leading-8 text-white" ] ] [ HH.text "Haniker.dev" ]
        , HH.h1 [ HP.classes [ HH.ClassName "mt-4 text-3xl font-bold tracking-tight text-white sm:text-5xl" ] ] [ HH.text "Building In Progress..." ]
        , HH.p [ css style.description ] [ HH.text "Functional Programmers are still compiling their code to make this a great website!" ]
        ]
    ]

style
  :: { description :: Array ThemeClass
     }
style =
  { description:
      -- Array-based syntax like elm-css
      -- We need to loop O(n) to create the final string
      -- Possible invalid classes like sm [ lg [ mt_6 ] ]
      -- We ignore overwritten CSS rules/classes
      [ mt_4
      , text_base
      , text_white_over_70
      -- Breakpoint designed as an array
      -- We need to loop to append "sm:" to each rule
      , sm
          [ mt_6
          ]
      -- Breakpoint designed as a class to prevent additional looping
      -- and also prevent any invalid nested breakpoints
      -- Too verbose... we will ignore it
      , sm__mt_6
      , sm'_mt_6
      , sm''mt_6
      ]
  -- Performant? 
  -- Harder to work with such as conditional adding of a class, debugging, ...
  -- Hence, we discard this approach
  -- description: do
  --   mt_4
  --   text_base
  --   text_white_over_70
  --   sm do 
  --     mt_6
  }
