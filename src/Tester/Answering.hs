module Tester.Answering where

import Data.Text.Lazy

import Tester.Model


mkAnswer :: String -> Answer -> UserAnswer
mkAnswer str SingleChoice{ ascChoices = ch } = undefined
mkAnswer str MultiChoice{ amcChoices = ch } = undefined
mkAnswer str TextualAnswer{} = TextualUA txt
mkAnswer str NumericAnswer{} = NumericUA (read txt)
