module Acme.Icons exposing (..)

import Svg
import VirtualDom exposing (Attribute, attribute)


chevron : List (Attribute msg) -> Svg.Svg msg
chevron attrs = Svg.node "svg" ([attribute "xmlns" "http://www.w3.org/2000/svg", attribute "viewBox" "0 0 100 100"] ++ attrs) [ Svg.node "line" ([attribute "x1" "1", attribute "y1" "25", attribute "x2" "50", attribute "y2" "75", attribute "stroke-linecap" "round"]) [], Svg.node "line" ([attribute "x1" "50", attribute "y1" "75", attribute "x2" "99", attribute "y2" "25", attribute "stroke-linecap" "round"]) []]

elm : List (Attribute msg) -> Svg.Svg msg
elm attrs = Svg.node "svg" ([attribute "xmlns" "http://www.w3.org/2000/svg", attribute "xmlns:xlink" "http://www.w3.org/1999/xlink", attribute "version" "1.1", attribute "id" "Layer_1", attribute "x" "0px", attribute "y" "0px", attribute "viewBox" "0 0 323.141 322.95", attribute "enable-background" "new 0 0 323.141 322.95", attribute "xml:space" "preserve"] ++ attrs) [ Svg.node "g" ([]) [ Svg.node "polygon" ([attribute "fill" "#F0AD00", attribute "points" "161.649,152.782 231.514,82.916 91.783,82.916"]) [], Svg.node "polygon" ([attribute "fill" "#7FD13B", attribute "points" "8.867,0 79.241,70.375 232.213,70.375 161.838,0"]) [], Svg.node "rect" ([attribute "fill" "#7FD13B", attribute "x" "192.99", attribute "y" "107.392", attribute "transform" "matrix(0.7071 0.7071 -0.7071 0.7071 186.4727 -127.2386)", attribute "width" "107.676", attribute "height" "108.167"]) [], Svg.node "polygon" ([attribute "fill" "#60B5CC", attribute "points" "323.298,143.724 323.298,0 179.573,0"]) [], Svg.node "polygon" ([attribute "fill" "#5A6378", attribute "points" "152.781,161.649 0,8.868 0,314.432"]) [], Svg.node "polygon" ([attribute "fill" "#F0AD00", attribute "points" "255.522,246.655 323.298,314.432 323.298,178.879"]) [], Svg.node "polygon" ([attribute "fill" "#60B5CC", attribute "points" "161.649,170.517 8.869,323.298 314.43,323.298"]) []]]

user : List (Attribute msg) -> Svg.Svg msg
user attrs = Svg.node "svg" ([attribute "xmlns" "http://www.w3.org/2000/svg", attribute "viewBox" "0 0 448 512"] ++ attrs) [ Svg.node "path" ([attribute "d" "M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"]) []]