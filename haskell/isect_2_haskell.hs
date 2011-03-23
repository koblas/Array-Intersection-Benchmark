{-# LANGUAGE BangPatterns #-}

import qualified Data.Time.Clock as T
import Control.Applicative ((<$>))
import qualified System.IO as IO
import qualified System.Environment as Env
import qualified Data.HashTable as H
import qualified Control.Monad as M
import qualified Data.Maybe as Maybe

import qualified Common as C

isect :: [String] -> [String] -> IO [String]
isect xs ys =
  do xsHash <- H.fromList H.hashString (zip xs (repeat ()))
     C.revFilterM (\y -> Maybe.isJust <$> H.lookup xsHash y) ys

main :: IO ()
main =
  do [filename] <- Env.getArgs
     (count : sets) <- lines <$> IO.readFile filename
     let (!xs, !ys) = unzip (map (\s -> let [x, y] = words s
                                        in (x, y)) sets)
     t0 <- T.getCurrentTime
     !intersected <- isect xs ys
     t1 <- T.getCurrentTime
     putStrLn ("Set   | n = " ++ show (length xs) ++ " : " ++ show (length intersected) ++ " intersects found in " ++ show (T.diffUTCTime t1 t0) ++ " seconds")
