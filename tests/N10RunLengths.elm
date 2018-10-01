module N10RunLengths exposing (..)

import Expect
import Html
import List
import Maybe
import Test exposing (Test, describe, test)


runLengths : List (List a) -> List ( Int, a )
runLengths xss =
    -- your implementation here
    []


suite : Test
suite = describe "pre-written"
            [ test "1" 
                <| \_ -> runLengths [ [ 1, 1, 1, 1 ], [ 2 ], [ 5, 5 ], [ 2 ], [ 1 ] ]
                             |> Expect.equal [ ( 4, 1 ), ( 1, 2 ), ( 2, 5 ), ( 1, 2 ), ( 1, 1 ) ]
            , test "2" 
                <| \_ -> runLengths [ [ 2 ], [ 5, 5 ], [ 2 ], [ 1 ] ]
                             |> Expect.equal [ ( 1, 2 ), ( 2, 5 ), ( 1, 2 ), ( 1, 1 ) ]
            , test "3"
                <| \_ -> runLengths [ [ 1, 1, 1, 1 ], [ 2 ], [ 5, 5 ] ]
                             |> Expect.equal [ ( 4, 1 ), ( 1, 2 ), ( 2, 5 ) ]
            , test "4"
                <| \_ -> runLengths [ [ 1, 1, 1, 1 ] ]
                             |> Expect.equal [ ( 4, 1 ) ]
            , test "5"
                <| \_ -> runLengths [ [ "a", "a", "a", "a" ], [ "b" ], [ "c", "c" ], [ "b" ], [ "a" ] ]
                             |> Expect.equal [ ( 4, "a" ), ( 1, "b" ), ( 2, "c" ), ( 1, "b" ), ( 1, "a" ) ]
            , test "6"
                <| \_ -> runLengths [ [] ] |> Expect.equal []
            , test "7"
                <| \_ -> runLengths [ [], [ "a", "a" ] ] |> Expect.equal [ ( 2, "a") ]
            , test "8"
                <| \_ -> runLengths [] |> Expect.equal []
            ]
