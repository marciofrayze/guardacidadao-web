module Main exposing (..)

import Router exposing (Route)
import Navigation exposing (Location)
import AppModel exposing (Model)
import AppViews exposing (view)
import AppModel exposing (Msg)


-- Program


main : Program Never Model Msg
main =
    Navigation.program AppModel.UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


defaultModel : Model
defaultModel =
    Model "" "" "" False False "" False Router.NotFoundRoute


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    stateBasedOnURL location defaultModel


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AppModel.Home ->
            ( { model
                | currentRoute = Router.HomeRoute
              }
            , Navigation.newUrl ("/")
            )

        AppModel.ShowAbout ->
            ( { model
                | currentRoute = Router.AboutRoute
              }
            , Navigation.newUrl ("/about")
            )

        AppModel.UrlChange newLocation ->
            stateBasedOnURL newLocation model


stateBasedOnURL : Location -> Model -> ( Model, Cmd msg )
stateBasedOnURL location model =
    case (Router.parseLocation location) of
        Router.AboutRoute ->
            ( { model
                | currentRoute = Router.AboutRoute
                , requestFailed = False
              }
            , Cmd.none
            )

        Router.HomeRoute ->
            ( { model
                | currentRoute = Router.AboutRoute
                , requestFailed = False
              }
            , Cmd.none
            )

        Router.NotFoundRoute ->
            ( { model
                | currentRoute = Router.NotFoundRoute
                , requestFailed = False
              }
            , Cmd.none
            )
