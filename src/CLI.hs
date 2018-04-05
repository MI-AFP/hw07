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
testerCLI = print "Welcome to SELF-TESTER"
  -- TODO: make CLI for answering loaded Test
  --       stack exec selftester JSON_FILE [cmd]
  --       - in args there will be one .json file with test, load the TestSet
  --       - print the name of TestSet
  --       - start giving questions and receiving answers
  --       - print summary with correct/wrong answers and total/max score
  --
  --       - if [cmd]=="learn", dont ask but show answer immediately
  --       - else if [cmd]=="train", show the correct answer immediately after getting answer
  --       - else if no [cmd] is given, show question, get answer and print results at the end
  --       - else print some error message, same if file is not provided
  --
  --       Be creative, design it as you want and as you would like to use it!
  --       If you want to try cmdargs or other, feel free to do it! (you can have nice --version and --help)

-- TODO: try to deal here just with IO, dealing with "pure" Strings should be in different modules
