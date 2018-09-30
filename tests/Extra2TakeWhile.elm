module Extra2TakeWhile exposing (..)

import Debug exposing (toString)
import Html exposing (text)
import List exposing (head, tail)
import Basics exposing (remainderBy)


headPasses : (a -> Bool) -> List a -> Bool
headPasses predicate list =
    let
        maybe = head list
    in
        case maybe of
            Nothing -> False
            Just value -> predicate value

tailOrEmpty: List a -> List a
tailOrEmpty list =
    Maybe.withDefault [] (tail list)


takeWhile : (a -> Bool) -> List a -> List a
takeWhile predicate list =
    let
        first = head list
    in
        case first of
            Nothing -> []
            Just value -> if ( predicate value ) then ( List.singleton value ) ++ ( takeWhile predicate ( tailOrEmpty list ) )
                            else []


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


suite : Int
suite =
    List.length
        <| List.filter ((==) False)
          [ (takeWhile isOdd [ 1, 2, 1 ] == [ 1 ])
          , (takeWhile isEven [ 1, 2, 1 ] == [])
          , (takeWhile isEven [] == [])
          , (takeWhile isEven [ 2, 4, 100000, 1 ] == [ 2, 4, 100000 ])
          , (takeWhile ((>) 5) (List.range 1 10) == [ 1, 2, 3, 4 ])
          , (takeWhile ((>) 50) (List.range 1 10) == List.range 1 10)
          ]

isEven : Int -> Bool
isEven x =
    remainderBy 2 x == 0


isOdd : Int -> Bool
isOdd x =
    remainderBy 2 x /= 0