module N9Pack exposing (..)

import Debug exposing (toString)
import Expect
import Html
import List
import Maybe
import Test exposing (Test, describe, test)


pack : List a -> List (List a)
pack xs =
    -- your implementation goes here
    [ [] ]




suite : Test
suite =
    describe "prewritten"
        [ test "1" <|
            \_ -> pack [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ] |> Expect.equal [ [ 1, 1, 1, 1 ], [ 2 ], [ 5, 5 ], [ 2 ], [ 1 ] ]
        , test "2" <|
            \_ -> pack [ 2, 1, 1, 1 ] |> Expect.equal [ [ 2 ], [ 1, 1, 1 ] ]
        , test "3" <| 
            \_ -> pack [ 2, 2, 2, 1, 1, 1 ] |> Expect.equal [ [ 2, 2, 2 ], [ 1, 1, 1 ] ]
        , test "4" <| 
            \_ -> pack [ 1 ] |> Expect.equal [ [ 1 ] ]
        , test "5" <| 
            \_ -> pack [] |> Expect.equal []
        , test "6" <| 
            \_ -> pack [ "aa", "aa", "aa" ] |> Expect.equal [ [ "aa", "aa", "aa" ] ]
        , test "7" <| 
            \_ -> pack [ "aab", "b", "b", "aa" ] |> Expect.equal [ [ "aab" ], [ "b", "b" ], [ "aa" ] ]
        ]
