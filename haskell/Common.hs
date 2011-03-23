module Common (revFilterM) where

import qualified Control.Monad as M

revFilterM :: (Monad m) => (a -> m Bool) -> [a] -> m [a]
revFilterM p xs =
  M.foldM (\ys y -> p y >>= (\flg -> if flg then return (y : ys) else return ys)) [] xs
