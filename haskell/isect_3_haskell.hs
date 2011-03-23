{-# LANGUAGE BangPatterns #-}

import qualified System.Environment as Env
import qualified Data.Time.Clock as T
import Control.Applicative ((<$>))
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BS
import qualified Data.Judy as J
import qualified Control.Monad as M
import qualified Data.Hashable as H

import qualified Common as C

-- requires judy and hashable packages:
-- $ cabal install judy hashable

isect :: [ByteString] -> [ByteString] -> IO [ByteString]
isect xs ys =
  do !xsHash <- fromList (zip xs' (repeat ()))
     C.revFilterM (\y -> J.member ((fromIntegral . H.hash) y) xsHash) ys
  where xs' = map (fromIntegral . H.hash) xs

fromList :: (J.JE a) => [(J.Key, a)] -> IO (J.JudyL a)
fromList kvs =
  do hash <- J.new
     M.foldM_ (\_ (k, v) -> J.insert k v hash) () kvs
     return hash

main :: IO ()
main =
  do [filename] <- Env.getArgs
     (count : sets) <- BS.lines <$> BS.readFile filename
     let (!xs, !ys) = unzip (map (\s -> let [x, y] = BS.words s
                                        in (x, y)) sets)
     t0 <- T.getCurrentTime
     !intersected <- isect xs ys
     t1 <- T.getCurrentTime
     putStrLn ("Set   | n = " ++ show (length xs) ++ " : " ++ show (length intersected) ++ " intersects found in " ++ show (T.diffUTCTime t1 t0) ++ " seconds")
