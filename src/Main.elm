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
      [ calender "December" 31 0 [{day=11, text="horse racing"}, {day=12, text="horse racing"}, {day=15, text="horse racing"}, {day=27, text="casey out of town"}, {day=28, text="casey out of town"}, {day=29, text="casey out of town"}, {day=30, text="casey out of town"}, {day=31, text="casey out of town"}]
      , calender "January" 31 3 [{day=1, text="casey out of town"}]
      , calender "February" 30 6 []
      ]


calender monthName daysInMonth dayMonthStarts hangOutDays =
  month monthName (daysInMonth+dayMonthStarts) (days dayMonthStarts hangOutDays)

month name numOfDays monthDays = div [] [
        Html.h2 [] [text name]
      , weekDays
      , div [ style "display" "grid"
            , style "grid-template-columns" "1fr 1fr 1fr 1fr 1fr 1fr 1fr "
            ]
            (List.range 1 numOfDays |> List.indexedMap monthDays)
      ]

days offset dtpDays i calenderDayFromRange = div
          [ style "width" "100px"
          , style "height" "100px"
          , style "border" "1px solid black"
          , style "background-color" (bgColor offset dtpDays i)
          ]
          [ String.fromInt (if i < offset then 0 else i-(offset-1)) |> text
          , text (getText offset dtpDays i)
          ]
getText offset dtpDays i =
  if (List.any (match offset i) dtpDays)
  then (List.filter (match offset i) dtpDays) |> (List.head) |> Maybe.withDefault {day=i, text=""} |> .text
  else ""

match offset i x = x.day == (i-(offset-1))
bgColor offset openDays index =
  if (List.any (match offset index) openDays)
  then "gray"
  else "white"

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
