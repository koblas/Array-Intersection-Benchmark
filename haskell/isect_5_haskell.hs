{-# LANGUAGE BangPatterns #-}

import qualified System.Environment as Env
import qualified Data.Time.Clock as T
import Control.Applicative ((<$>))
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BS
import qualified Data.HashMap.Strict as H
import qualified Control.Monad as M
import qualified Data.Maybe as Maybe

-- requires unordered-containers package:
-- $ cabal install unordered-containers

isect :: [ByteString] -> [ByteString] -> [ByteString]
isect xs ys =
  let xsHash = H.fromList (zip xs (repeat ()))
  in filter (\y -> (Maybe.isJust . H.lookup y) xsHash) ys

main :: IO ()
main =
  do [filename] <- Env.getArgs
     (count : sets) <- BS.lines <$> BS.readFile filename
     let (!xs, !ys) = unzip (map (\s -> let [x, y] = BS.words s
                                        in (x, y)) sets)
     t0 <- T.getCurrentTime
     let !intersected = isect xs ys
     t1 <- T.getCurrentTime
     putStrLn ("Set   | n = " ++ show (length xs) ++ " : " ++ show (length intersected) ++ " intersects found in " ++ show (T.diffUTCTime t1 t0) ++ " seconds")
