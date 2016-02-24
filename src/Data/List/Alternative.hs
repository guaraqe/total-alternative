module Data.List.Alternative
       ( head
       , tail
       , init
       , last
       ) where

import Prelude hiding ( head
                      , tail
                      , init
                      , last )

import qualified Data.List as L ( head
                                , tail
                                , init
                                , last )

import Control.Applicative

wrap :: Alternative f => ([a] -> b) -> [a] -> f b
wrap _ [] = empty
wrap f xs = pure (f xs)

head :: Alternative f => [a] -> f a
head = wrap L.head

tail :: Alternative f => [a] -> f [a]
tail = wrap L.tail

init :: Alternative f => [a] -> f [a]
init = wrap L.init

last :: Alternative f => [a] -> f a
last = wrap L.last
