module N12RleDecode exposing (suite)

import Expect
import Html
import List
import Test exposing (Test, describe, test)


type RleCode a
    = Run Int a
    | Single a


rleDecode : List (RleCode a) -> List a
rleDecode list =
    -- your implementation goes here
    []

            
suite : Test
suite = describe "pre-written" 
    [ test "1"
        <| \_ -> rleDecode [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
                                 |> Expect.equal [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
    , test "2"
        <| \_ -> rleDecode [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
                                 |> Expect.equal [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
    , test "3"
        <| \_ -> rleDecode [ Run 4 "1", Single "b", Run 2 "5", Single "2", Single "a" ]
                                 |> Expect.equal [ "1", "1", "1", "1", "b", "5", "5", "2", "a" ]
    ]
            