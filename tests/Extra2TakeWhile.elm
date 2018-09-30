module Extra2TakeWhile exposing (..)

import Debug exposing (toString)
import Expect
import Html exposing (text)
import List exposing (head, tail)
import Basics exposing (remainderBy)
import Test exposing (Test, test, describe)


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
    case head list of
        Nothing -> []
        Just value -> if (predicate value) == False then []
                      else
                        let
                            theRest = takeWhile predicate ( tailOrEmpty list )
                        in
                             value :: theRest
          
suite : Test
suite = describe "pre-written"
    [ test "1" <|
              \_ -> takeWhile isOdd [ 1, 2, 1 ] |> Expect.equal [ 1 ]
    ,  test "2" <|
              \_ -> takeWhile isEven [ 1, 2, 1 ] |> Expect.equal []
    ,  test "3" <|
              \_ -> takeWhile isEven [] |> Expect.equal []
    ,  test "4" <|
              \_ -> takeWhile isEven [ 2, 4, 100000, 1 ] |> Expect.equal [ 2, 4, 100000 ]
    ,  test "5" <|
              \_ -> takeWhile ((>) 5) (List.range 1 10) |> Expect.equal [ 1, 2, 3, 4 ]
    ,  test "6" <|
              \_ -> takeWhile ((>) 50) (List.range 1 10) |> Expect.equal ( List.range 1 10 )
    ]
          

isEven : Int -> Bool
isEven x =
    remainderBy 2 x == 0


isOdd : Int -> Bool
isOdd x =
    remainderBy 2 x /= 0