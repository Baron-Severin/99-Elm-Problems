module N18Slice exposing (suite)

import Array
import Expect
import Html
import List
import Test exposing (Test, describe, test)

sublist : Int -> Int -> List a -> List a 
sublist start end list = 
    -- your implementation goes here
    []

      
suite : Test
suite = describe "pre-written"
    [ test "1" 
        <| \_ -> sublist 3 7 (List.range 1 10) |> Expect.equal ( List.range 3 7 )
    , test "2"
        <| \_ -> sublist 2 100 [ 'a', 'b', 'c' ] |> Expect.equal [ 'b', 'c' ]
    , test "3"
        <| \_ -> sublist -1 2 (List.range 1 100) |> Expect.equal [1, 2]
    , test "4"
        <| \_ -> sublist -3 -2 [-3, -2, -1, 0, 1, 2, 3] |> Expect.equal []
    , test "5"
        <| \_ -> sublist 5 3 [ "indices", " are", "inverted"] |> Expect.equal []
    , test "6"
        <| \_ -> sublist 0 1 (List.range 1 10) |> Expect.equal [1]
    , test "7"
        <| \_ -> sublist -7 -3 (List.range 1 10) |> Expect.equal []
    ]