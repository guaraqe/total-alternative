module Data.Foldable.Alternative
       ( foldl1
       , foldr1
       , maximum
       , minimum
       , maximumBy
       , minimumBy
       ) where

import Prelude hiding ( foldl1
                      , foldr1
                      , maximum
                      , minimum )

import qualified Data.Foldable as F

import Control.Applicative

wrap :: (Alternative f, Foldable t)
     => (t a -> b) -> t a -> f b
wrap f xs = if null xs
               then empty
               else pure (f xs)

foldl1 :: (Alternative f, Foldable t)
       => (a -> a -> a) -> t a -> f a
foldl1 = wrap . F.foldl1

foldr1 :: (Alternative f, Foldable t)
       => (a -> a -> a) -> t a -> f a
foldr1 = wrap . F.foldl1

maximumBy :: (Alternative f, Foldable t)
          => (a -> a -> Ordering) -> t a -> f a
maximumBy = wrap . F.maximumBy

maximum :: (Alternative f, Foldable t, Ord a)
        => t a -> f a
maximum = wrap F.maximum

minimumBy :: (Alternative f, Foldable t)
          => (a -> a -> Ordering) -> t a -> f a
minimumBy = wrap . F.minimumBy

minimum :: (Alternative f, Foldable t, Ord a)
        => t a -> f a
minimum = wrap F.minimum
