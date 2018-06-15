module AppModel exposing (..)

import Router exposing (Route)
import Navigation exposing (Location)


type alias Model =
    { plate : String
    , reviewScore : String
    , reviewComment : String
    , processingRequest : Bool
    , requestFailed : Bool
    , failedDetails : String
    , showResults : Bool
    , currentRoute : Router.Route
    }


type Msg
    = Home
    | ShowAbout
    | UrlChange Navigation.Location
