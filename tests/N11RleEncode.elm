module N11RleEncode exposing (suite)

import Expect
import Html
import List
import Maybe
import Test exposing (Test, describe, test)


type RleCode a
    = Run Int a
    | Single a


rleEncode : List a -> List (RleCode a)
rleEncode list =
    -- your implementation here
    []

            
suite: Test
suite = describe "pre-written"
    [ test "1" 
        <| \_ -> rleEncode [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ] |> Expect.equal [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
    , test "2"
        <| \_ -> rleEncode [ 2, 1, 1, 1 ] |> Expect.equal [ Single 2, Run 3 1 ]
    , test "3"
        <| \_ -> rleEncode [ 2, 2, 2, 1, 1, 1 ] |> Expect.equal [ Run 3 2, Run 3 1 ]
    , test "4"
        <| \_ -> rleEncode [ 1 ] |> Expect.equal [ Single 1 ]
    , test "5"
        <| \_ -> rleEncode [] |> Expect.equal []
    , test "6"
        <| \_ -> rleEncode [ "aa", "aa", "aa" ] |> Expect.equal [ Run 3 "aa" ]
    , test "7"
        <| \_ ->  rleEncode [ "aab", "b", "b", "aa" ] |> Expect.equal [ Single "aab", Run 2 "b", Single "aa" ]
    ]