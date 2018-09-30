module Extra1DropWhile exposing (..)

import Debug exposing (toString, log)
import Html
import List exposing (head, tail)


tailOrEmpty : List a -> List a
tailOrEmpty list =
    Maybe.withDefault [] (tail list)

headPasses: (a -> Bool) -> List a -> Bool
headPasses predicate list =
    case head list of
        Nothing -> False
        Just value -> predicate value

dropWhile : (a -> Bool) -> List a -> List a
dropWhile predicate list =
    if List.isEmpty list then []
    else if (headPasses predicate list) then dropWhile predicate (tailOrEmpty list)
    else list


main : Html.Html a
main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ ( dropWhile isOdd [1, 2, 1] == [2, 1] )
            , ( dropWhile isEven [1, 2, 1] == [1, 2, 1] )
            , ( dropWhile isEven [] == [] )
            , ( dropWhile isEven [2, 4, 100000, 1] == [1] )
            , ( dropWhile ((>) 5 ) (List.range 1 10) == [5, 6, 7, 8, 9, 10])
            , ( dropWhile ((>) 50 ) (List.range 1 10) ==[])
            ]

isEven : Int -> Bool
isEven x =
    Basics.remainderBy 2 x == 0

isOdd : Int -> Bool
isOdd x =
    Basics.remainderBy 2 x /= 0