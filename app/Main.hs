module Main where

import CLI (testerCLI)



main :: IO ()
main = testerCLI
-- TODO: make CLI for answering loaded Test
--       stack exec selftester [OPTS] JSON_FILE
--       - in args there will be one .json file with test, load the TestSet
--       - print the name of TestSet
--       - if option "s" is in [OPTS], shuffle randomly questions
--       - start giving questions and receiving answers
--       - if option "a" is in [OPTS], give correct answer immediately
--       - print summary with correct/wrong answers and total/max score
