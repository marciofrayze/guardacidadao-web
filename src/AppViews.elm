module AppViews exposing (..)

import AppModel exposing (Model)
import Html
    exposing
        ( body
        , br
        , button
        , div
        , form
        , header
        , input
        , label
        , li
        , nav
        , text
        )
import Html.Attributes
    exposing
        ( autofocus
        , disabled
        , href
        , maxlength
        , placeholder
        , value
        )
import Html.Events
    exposing
        ( onInput
        , onSubmit
        , onClick
        , onWithOptions
        )
import Navigation exposing (Location)
import Styles
    exposing
        ( buttonDisabledStyle
        , buttonEnabledStyle
        , centerStyle
        , centeredBlockStyle
        , errorStyle
        , infoTextStyle
        , marginTopStyle
        , plateEmptyInputStyle
        , plateInputStyle
        , primaryBackgroundStyle
        , primaryFont
        , smallMarginBottomStyle
        , smallMarginTopStyle
        , styles
        , subtitleStyle
        , titleStyle
        , linkStyle
        , blockStyle
        , reviewInputStyle
        , cancelButtonEnabledStyle
        , starsSelectStyle
        )
import Router
import AppModel exposing (Model, Msg)


view : Model -> Html.Html Msg
view model =
    div
        [ styles
            (marginTopStyle ++ centeredBlockStyle)
        ]
        [ case model.currentRoute of
            Router.HomeRoute ->
                aboutPage

            Router.AboutRoute ->
                aboutPage

            Router.NotFoundRoute ->
                notFoundDiv
        ]


titleDiv : Html.Html msg
titleDiv =
    div
        [ styles titleStyle
        ]
        [ Html.text "Guarda Cidadão"
        ]


aboutPage : Html.Html Msg
aboutPage =
    div
        []
        [ titleDiv
        , div [ styles infoTextStyle ]
            [ div [ styles smallMarginBottomStyle ]
                [ Html.text "Todo mundo já viu motorista estacionar em vaga prioritária, ônibus tirando fina de ciclista, gente que não respeita a faixa, não pára no ponto, parte pra briga."
                ]
            , div [ styles smallMarginBottomStyle ]
                [ Html.text "Agora você pode fazer alguma coisa. Denuncie o veículo pela placa e deixe um recado para o motorista. As multas não têm valor oficial, mas ficam registradas para aparecer em buscas e entram para o ranking de ocorrências na cidade."
                ]
            ]
        , button
            [ styles
                (buttonEnabledStyle
                    ++ marginTopStyle
                    ++ centerStyle
                )
            , onClick AppModel.Home
            ]
            [ Html.text "certo, deixe-me pesquisar" ]
        ]


notFoundDiv : Html.Html msg
notFoundDiv =
    div [] [ Html.text "404 - Página não encontrada." ]
