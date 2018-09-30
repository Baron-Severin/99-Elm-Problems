module ListExt exposing (..)

import List exposing (tail)
import Test exposing (Test)



tailOrEmpty : List a -> List a
tailOrEmpty list =
    case tail list of
        Nothing -> []
        Just value -> value
