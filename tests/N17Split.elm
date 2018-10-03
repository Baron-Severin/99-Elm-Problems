module N17Split exposing (suite)

import Expect
import Html exposing (text)
import List
import Test exposing (Test, describe, test)


split : List a -> Int -> (List a, List a)
split list count =
    -- your implementation here
    ([], [])


suite : Test
suite = describe "pre-written"
        [ test "1"
            <| \_ -> split (List.range 1 5) 0 |> Expect.equal ([], [1, 2, 3, 4, 5])
        , test "2"
            <| \_ -> split (List.range 1 5) 2 |> Expect.equal ([1, 2], [3, 4, 5])
        , test "3"
            <| \_ -> split (List.range 1 5) 3 |> Expect.equal ([1, 2, 3], [4, 5])
        , test "4"
            <| \_ -> split (List.range 1 5) 4 |> Expect.equal ([1, 2, 3, 4], [5])
        , test "5"
            <| \_ -> split (List.range 1 5) 5 |> Expect.equal ([1, 2, 3, 4, 5], [])
        , test "6"
            <| \_ -> split (List.range 1 5) 6 |> Expect.equal ([1, 2, 3, 4, 5], [])
        , test "7"
            <| \_ -> split (List.range 1 5) (-1) |> Expect.equal ([], [1, 2, 3, 4, 5])
        , test "8"
            <| \_ -> split [ "aab", "b", "c", "aa" ] 2 |> Expect.equal ([ "aab", "b"],["c", "aa" ])
        ]
