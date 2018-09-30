module IsPalindrome exposing (..)

import Debug exposing (toString)
import Html
import List
import Maybe


isPalindrome : List a -> Bool
isPalindrome xs =
    if List.reverse xs == xs then True
    else False


main : Html.Html a
main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ isPalindrome [ 1, 3, 5, 8, 5, 3, 1 ] == True
            , isPalindrome [ 2, 1 ] == False
            , isPalindrome [ 1 ] == True
            , isPalindrome [] == True
            , isPalindrome [ "aa", "bb", "aa" ] == True
            , isPalindrome [ "aab", "b", "aa" ] == False
            ]