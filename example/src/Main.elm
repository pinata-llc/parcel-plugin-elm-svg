module Main exposing (main)

import Acme.Icons exposing (chevron, elm, user)
import Html exposing (Html, aside, div, h1, header, text)
import Html.Attributes exposing (style)
import Svg.Attributes exposing (fill, height, stroke, strokeWidth, width)


main : Html msg
main =
    div []
        [ header []
            [ h1 [] [ text "Awesome App" ]
            , aside []
                [ user
                    [ width "20"
                    , height "20"
                    , fill "#272727"
                    , style "margin-right" "5px"
                    ]
                , chevron [ stroke "#272727", width "20", strokeWidth "10" ]
                ]
            ]
        , elm []
        ]
