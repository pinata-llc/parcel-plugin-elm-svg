module Main exposing (main)

import Acme.Icons exposing (chevron, elm, user)
import Html exposing (aside, div, h1, header, text)
import Html.Attributes exposing (style)
import Svg.Attributes exposing (fill, height, stroke, strokeWidth, transform, width)


main =
    div []
        [ header []
            [ h1 [] [ text "Awesome App" ]
            , aside []
                [ user
                    [ width "20"
                    , height "20"
                    , fill "#272727"
                    ]
                , chevron
                    [ style "margin-left" "5px"
                    , width "15"
                    , strokeWidth "10"
                    , stroke "#272727"
                    ]
                ]
            ]
        , elm []
        ]
