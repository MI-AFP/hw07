module Tester.Model where

import Data.Text.Lazy

type Points = Int

data TestSet = TestSet { tsName  :: !Text
                       , tsIntro :: Maybe Text
                       , tsItems :: [Question]
                       } deriving (Read, Show)

data Question = Question { quText    :: !Text
                         , quAnswer  :: Answer
                         } deriving (Read, Show)

data Answer = SingleChoice  { ascChoices :: [Choice] }
            | MultiChoice   { amcChoices :: [Choice] }
            | TextualAnswer { ataCorrect :: [Text], ataScore :: Points }
            | NumericAnswer { anaCorrect :: [Double], anaScore :: Points }
            deriving (Read, Show)

data Choice = Choice { chText    :: !Text
                     , chScore   :: Points
                     } deriving (Read, Show)

data UserAnswer = ChoicesUA [Text]
               | TextualUA !Text
               | NumericUA Double
               | ListOfUA [UserAnswer]
               deriving (Read, Show)

data Result = Result { rePoints    :: Points
                     , reMaxPoints :: Points
                     , reCorrectness :: Correctness
                     } deriving (Read, Show)

data Correctness = Total | Partial | None
                 deriving (Read, Show)
