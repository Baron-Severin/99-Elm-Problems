module ListExtTest exposing (..)


import Expect
import ListExt exposing (tailOrEmpty)
import Test exposing (Test, describe, test)


suite : Test
suite = describe "Test tailOrEmpty"
    [ test "WHEN normal list THEN should return tail" <|
        \_ -> tailOrEmpty [1, 2, 3] |> Expect.equal [2, 3]
    , test "WHEN empty list THEN should return empty" <|
        \_ -> tailOrEmpty [] |> Expect.equal []
    , test "WHEN single value list THEN should return empty" <|
        \_ -> tailOrEmpty [1] |> Expect.equal []
    ]
