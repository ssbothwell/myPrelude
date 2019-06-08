module Typeclasses.Monad where

import Typeclasses.Functor
import Typeclasses.Applicative

{-
The Monad class defines the basic operations over a monad, a concept
from a branch of mathematics known as category theory. From the
perspective of a Haskell programmer, however, it is best to think of a
monad as an abstract datatype of actions. Haskell's do expressions
provide a convenient syntax for writing monadic expressions.

Instances of Monad should satisfy the following laws:

    return a >>= k  =  k a
    m >>= return  =  m
    m >>= (\x -> k x >>= h)  =  (m >>= k) >>= h

Furthermore, the Monad and Applicative operations should relate as follows:

    pure = return
    (<*>) = ap

The above laws imply:

    fmap f xs  =  xs >>= return . f
    (>>) = (*>)

and that pure and (<*>) satisfy the applicative functor laws.
-}

class Applicative m => Monad m where
  return :: a -> m a
  infixl 1 >>=
  (>>=) :: (a -> m b) -> m a -> m b
  infixl 1 >>
  (>>) :: m a -> m b -> m b
