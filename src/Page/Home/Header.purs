module Page.Home.Header (view) where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Elements as HE
import Halogen.HTML.Properties as HP
import Tailwind
import View.Style (defaultStyle)

view :: forall a cs m. H.ComponentHTML a cs m
view =
  let
    navs = nav <$> [ "Who We Are", "What We Do", "Tech Stack", "Portfolio", "Contact Us" ]
  in
    HH.header []
      [ HH.nav []
          [ HH.div [ css style.container ]
              [ HH.div [ css style.logoNav ]
                  [ HH.a [ HP.href "/" ]
                      [ HH.img [ css style.logo, HP.src "images/logo.png" ]
                      ]
                  , HH.div [ css style.navContainer ] navs
                  ]
              , HH.div [ css style.popoverContainer ]
                  [ HH.div [ css style.popover ]
                      [ HH.button [ css style.popoverButton ]
                          [ menuIcon
                          ]
                      ]

                  ]
              ]
          ]
      ]

nav :: forall a cs m. String -> H.ComponentHTML a cs m
nav label =
  HH.a [ css style.nav, HP.href "/" ]
    [ HH.span [ css style.navLabel ] [ HH.text label ]
    ]

menuIcon :: forall a cs m. H.ComponentHTML a cs m
menuIcon =
  HE.element (H.ElemName "svg")
    [ HP.attrNS (H.Namespace "AAAA") (H.AttrName "viewBox") "0 0 24 24"
    , HP.attr (H.AttrName "fill") "none"
    , HP.attr (H.AttrName "aria-hidden") "true"
    , css style.menuIcon
    ]
    [ HE.element (H.ElemName "path")
        [ HP.attr (H.AttrName "d") "M5 6h14M5 18h14M5 12h14"
        , HP.attr (H.AttrName "stroke-width") "2"
        , HP.attr (H.AttrName "stroke-linecap") "round"
        , HP.attr (H.AttrName "stroke-linejoin") "round"
        ]
        []
    ]

style :: _
style =
  { container: defaultStyle.container
      ~ relative
      ~ z_50
      ~ flex
      ~ justify_between
      ~ py_8
  , logoNav: tw
      ~ relative
      ~ z_10
      ~ flex
      ~ items_center
      ~ gap_16
  , logo: tw
      ~ h_10
      ~ w_auto
  , navContainer: tw
      ~ hidden
      ~ lg (flex ~ gap_10)
      ~ relative
  , nav: tw
      ~ relative
      ~ _my_2
      ~ _mx_3
      ~ rounded_lg
      ~ px_3
      ~ py_2
      ~ text_sm
      ~ text_gray_700
      ~ hover (text_gray_900 ~ bg_gray_100)
  , navLabel: tw
      ~ relative
      ~ z_10
  , popoverContainer: tw
      ~ flex
      ~ items_center
      ~ gap_6
  , popover: tw
      ~ lg hidden
  , popoverButton: tw
      ~ relative
      ~ z_10
      ~ _m_2
      ~ inline_flex
      ~ items_center
      ~ rounded_lg
      ~ stroke_gray_900
      ~ p_2
      ~ hover (bg_gray_200_over_50 ~ stroke_gray_600)
      ~ active stroke_gray_900
  , menuIcon: tw
      ~ h_6
      ~ w_6
  }
