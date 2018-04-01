module Tester.Evaluation where

import Tester.Model

isCorrect :: Result -> Bool
isCorrect Result { reCorrectness = Total } = True
isCorrect _ = False

class Scored a where
  maxScore :: a -> Points
  score :: a -> UserAnswer -> Points
  evaluate :: a -> UserAnswer -> Result
  evaluate x ua = Result { rePoints    = points
                         , reMaxPoints = maxPoints
                         , reCorrectness = correctnessOf points maxPoints
                         }
              where points = score x ua
                    maxPoints = maxScore x
                    correctnessOf x y | x == y    = Total
                                      | x <= 0    = None
                                      | otherwise = Partial

instance Scored TestSet where
  maxScore = sum . map maxScore . tsItems
  score ts (ListOfUA uas) = sum . map (uncurry score) $ zip (tsItems ts) uas
  score _ _ = error "Expecting list of answers for whole TestSet"

instance Scored Question where
  maxScore = maxScore . quAnswer
  score = score . quAnswer

instance Scored Answer where
  maxScore SingleChoice { ascChoices = chs } = undefined
  maxScore MultiChoice  { amcChoices = chs } = undefined
  maxScore TextualAnswer { ataScore = sc } = sc
  maxScore NumericAnswer { atnScore = sc } = sc
  score _ _ = undefined
