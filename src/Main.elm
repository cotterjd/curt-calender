import Browser
import Html exposing (Html, button, div, text)
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
  div [ style "display" "grid"
      , style "grid-template-columns" "1fr 1fr 1fr 1fr 1fr 1fr 1fr "
      ]
     (List.range 1 31 |> List.indexedMap things)


things i x = div [ style "width" "100px"
          , style "height" "100px"
          , style "border" "1px solid black"
          ] [String.fromInt (i+1) |> text]
