module N7Flatten exposing (..)

import Debug exposing (toString)
import Html
import List


type NestedList a
    = Elem a
    | SubList (List (NestedList a))


flatten : NestedList a -> List a
flatten list =
    case list of
        Elem value -> List.singleton value
        SubList sublist -> List.concatMap flatten sublist


main : Html.Html a
main =
    Html.text
        <| case suite of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


nl0 =
    SubList [ Elem 1, Elem 2 ]


nl1 =
    SubList
        [ Elem 1
        , SubList
            [ SubList
                [ Elem 2
                , SubList [ Elem 3, Elem 4 ]
                ]
            , Elem 5
            ]
        , Elem 6
        , SubList [ Elem 7, Elem 8, Elem 9 ]
        ]


suite : Int
suite =
    List.length
        <| List.filter ((==) False)
            [ flatten nl1 == List.range 1 9
            , flatten (SubList [ Elem 1, Elem 2 ]) == [ 1, 2 ]
            , flatten (SubList [ Elem "a", Elem "b" ]) == [ "a", "b" ]
            , flatten (SubList [ ]) == [ ]
            ]