module Main exposing (..)

import Http


httpErrorString : Http.Error -> String
httpErrorString error =
    case error of
        Http.BadUrl text ->
            "Url incorreta: " ++ text

        Http.Timeout ->
            "Tempo limite excedido"

        Http.NetworkError ->
            "Erro na conexão de rede"

        Http.BadStatus response ->
            "Erro no retorno da requisição: " ++ toString response.status.code

        Http.BadPayload message response ->
            "Erro no retorno da requisição: "
                ++ toString message
                ++ " ("
                ++ toString response.status.code
                ++ ")"
