module N11RleEncode exposing (suite)

import Expect
import Html
import List exposing (foldr)
import ListExt exposing (tailOrEmpty)
import Maybe
import Test exposing (Test, describe, test)


type RleCode a
    = Run Int a
    | Single a

-- TODO find a better way to do this kind of thing. This is gross
group : a -> List ( List a ) -> List ( List a )
group a list =
    case List.head list of
        Nothing -> [ a ] :: list
        Just sublist -> case List.head sublist of
            Nothing -> [ a ] :: list
            Just unwrapped -> if unwrapped == a then ( a :: sublist ) :: ( tailOrEmpty list )
                              else [ a ] :: list


toCode : List a -> Maybe ( RleCode a )
toCode list =
    case List.head list of
        Nothing -> Nothing
        Just value -> if List.length list == 1 then Just <| Single value
                      else Just <| Run ( List.length list ) value

rleEncode : List a -> List (RleCode a)
rleEncode list =
    list
      |> foldr group []
      |> List.map toCode
      |> List.filterMap identity

            
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