module Data.List.Alternative
       ( head
       , tail
       , init
       , last
       , scanl1
       , scanr1
       , cycle
       ) where

import Prelude hiding ( head
                      , tail
                      , init
                      , last
                      , scanl1
                      , scanr1
                      , cycle )

import qualified Data.List as L

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

scanl1 :: Alternative f => (a -> a -> a) -> [a] -> f [a]
scanl1 = wrap . L.scanl1

scanr1 :: Alternative f => (a -> a -> a) -> [a] -> f [a]
scanr1 = wrap . L.scanr1

cycle :: Alternative f => [a] -> f [a]
cycle = wrap L.cycle
