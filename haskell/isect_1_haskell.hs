{-# LANGUAGE BangPatterns #-}

import qualified Data.Time.Clock as T
import Control.Applicative ((<$>))
import qualified Data.Set as S
import qualified System.IO as IO
import qualified System.Environment as Env
import qualified Data.List as L

isect :: (Ord a) => [a] -> [a] -> [a]
isect xs ys =
  let xsSet = S.fromList xs
  in filter ((flip S.member) xsSet) ys

main :: IO ()
main =
  do [filename] <- Env.getArgs
     (count : sets) <- lines <$> IO.readFile filename
     let (!xs, !ys) = unzip (map (\s -> let [x, y] = words s
                                        in (x, y)) sets)
     t0 <- T.getCurrentTime
     let !intersected = isect xs ys
     t1 <- T.getCurrentTime
     putStrLn ("Set   | n = " ++ show (length xs) ++ " : " ++ show (length intersected) ++ " intersects found in " ++ show (T.diffUTCTime t1 t0) ++ " seconds")
