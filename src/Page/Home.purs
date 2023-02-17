module Page.Home where

import Theme
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
  :: { body :: Array ThemeClass
     , container :: Array ThemeClass
     , description :: Array ThemeClass
     , domain :: Array ThemeClass
     , img :: Array ThemeClass
     , wip :: Array ThemeClass
     }
style =
  { container:
      [ relative
      , isolate
      , min_h_full
      ]
  , img:
      [ absolute
      , inset_0
      , _z_10
      , h_full
      , w_full
      , object_cover
      , object_top
      ]
  , body:
      [ mx_auto
      , max_w_7xl
      , px_6
      , py_32
      , text_center
      , sm [ py_40 ]
      , lg [ px_8 ]
      ]
  , domain:
      [ text_base
      , font_semibold
      , leading_8
      , text_white
      ]
  , wip:
      [ mt_4
      , text_3xl
      , font_bold
      , tracking_tight
      , text_white
      , sm [ text_5xl ]
      ]
  , description:
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
