import Browser
import Html exposing (Html, button, div, text, span)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model = Int

init : Model
init =
  0


-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


-- VIEW

view : Model -> Html Msg
view model =
  div []
      [
        Html.h2 [] [text "September"]
      , days
      , div [ style "display" "grid"
            , style "grid-template-columns" "1fr 1fr 1fr 1fr 1fr 1fr 1fr "
            ]
            (List.range 1 30 |> List.indexedMap seps)
      , Html.h2 [] [text "October"]
      , days
      , div [ style "display" "grid"
            , style "grid-template-columns" "1fr 1fr 1fr 1fr 1fr 1fr 1fr "
            ]
            (List.range 1 (31+octOffset) |> List.indexedMap octs)
      , Html.h2 [] [text "November"]
      , days
      , div [ style "display" "grid"
            , style "grid-template-columns" "1fr 1fr 1fr 1fr 1fr 1fr 1fr "
            ]
            (List.range 1 (30+novOffset) |> List.indexedMap novs)
      ]


days = div [ style "display" "grid"
            , style "grid-template-columns" "1fr 1fr 1fr 1fr 1fr 1fr 1fr "
            ] [
              span [] [text "Sunday"]
            , span [] [text "Monday"]
            , span [] [text "Tuesday"]
            , span [] [text "Wednesday"]
            , span [] [text "Thursday"]
            , span [] [text "Friday"]
            , span [] [text "Saturday"]
        ]
-- figure out how to make this a function that takes in the offset
seps i x = div [ style "width" "100px"
          , style "height" "100px"
          , style "border" "1px solid black"
          ] [String.fromInt (i+1) |> text]
octOffset = 2
octs i x = div [ style "width" "100px"
          , style "height" "100px"
          , style "border" "1px solid black"
          , style "background-color" (if i-(octOffset-1) == 26 then "gray" else "white")
          ] [String.fromInt (if i < octOffset then 0 else i-(octOffset-1)) |> text]
novOffset = 5
novs i x = div
          [ style "width" "100px"
          , style "height" "100px"
          , style "border" "1px solid black"
          , style "background-color" (if i-(novOffset-1) == 1 then "gray" else "white")
          ] [String.fromInt (if i < novOffset then 0 else i-(novOffset-1)) |> text]
