module Router exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = HomeRoute
    | NotFoundRoute
    | AboutRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map AboutRoute (s "about")
        , map HomeRoute (s "")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parsePath matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
