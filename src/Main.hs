{-# LANGUAGE QuasiQuotes #-}

module Main where

import Text.RawString.QQ

import qualified Language.Preprocessor.Cpphs as Cpphs



mkCpphsOptions :: FilePath -> Cpphs.CpphsOptions
mkCpphsOptions rootPath = Cpphs.CpphsOptions [] [] [] []
                            [rootPath ++ "/pragmas.h"]
                            Cpphs.defaultBoolOptions { Cpphs.locations = False }


code = [r|
def main
    bla bla _tuple0 foo _tuple7(1,2,3,4,5,6,7) bla
|]

main :: IO ()
main = do
    let cpphsOptions = mkCpphsOptions "rsc"
    print cpphsOptions
    putStrLn =<< Cpphs.runCpphs cpphsOptions "" code
    putStrLn "Hello World"
