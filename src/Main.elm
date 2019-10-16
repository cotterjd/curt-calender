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
        month "October" 31 (days 2 [26])
      , month "November" 30 (days 5 [1, 21])
      , month "December" 31 (days 0 [])
      ]


weekDays = div [ style "display" "grid"
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
days offset dtpDay i x = div
          [ style "width" "100px"
          , style "height" "100px"
          , style "border" "1px solid black"
          , style "background-color" (bgColor offset dtpDay i)
          ] [String.fromInt (if i < offset then 0 else i-(offset-1)) |> text]

match offset i x = x == (i-(offset-1))
bgColor offset openDays index = if (List.any (match offset index) openDays) then "gray" else "white"

month name numOfDays monthDays = div [] [
        Html.h2 [] [text name]
      , weekDays
      , div [ style "display" "grid"
            , style "grid-template-columns" "1fr 1fr 1fr 1fr 1fr 1fr 1fr "
            ]
            (List.range 1 numOfDays |> List.indexedMap monthDays)
      ]
