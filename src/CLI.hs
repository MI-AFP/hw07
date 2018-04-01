module CLI (loadAndShow, testerCLI) where

import System.IO
import System.Environment
import qualified Data.ByteString.Lazy as BS
import Data.Aeson (decode)
import Data.Maybe

import Tester.Model
import Tester.Model.AesonInstances


-- demonstration of using aeson to load JSON file with TestSet
loadAndShow :: IO ()
loadAndShow = do
  args <- getArgs
  handle <- openFile (head args) ReadMode
  contentsJSON <- BS.hGetContents handle
  let contents = decode contentsJSON :: Maybe TestSet
  case contents of
    Nothing -> print "Invalid JSON..."
    _       -> print contents


testerCLI :: IO ()
testerCLI = putStrLn "Welcome to SELF-TESTER"
  -- TODO: make CLI for answering loaded Test
  --       stack exec selftester [OPTS] JSON_FILE
  --       - in args there will be one .json file with test, load the TestSet
  --       - print the name of TestSet
  --       - if option "s" is in [OPTS], shuffle randomly questions
  --       - start giving questions and receiving answers
  --       - if option "a" is in [OPTS], give correct answer immediately
  --       - print summary with correct/wrong answers and total/max score
