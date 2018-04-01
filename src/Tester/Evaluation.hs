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
  maxScore SingleChoice{ ascChoices = chs } = maximum . map chScore $ chs
  maxScore MultiChoice{ amcChoices = chs } = sum . filter (>0) . map chScore $ chs
  maxScore TextualAnswer{ ataScore = sc } = sc
  maxScore NumericAnswer{ anaScore = sc } = sc
  score SingleChoice{ ascChoices = chs } (ChoicesUA [x]) =
        case filter (\y -> chText y == x) chs of
          [ch] -> chScore ch
          _    -> 0
  score MultiChoice{ amcChoices = chs } (ChoicesUA xs) =
        case filter (\x -> chText x `elem` xs) chs of
          []   -> 0
          cchs -> sum . map chScore $ cchs
  score TextualAnswer{ ataCorrect = corrects, ataScore = sc } (TextualUA txt)
        | txt `elem` corrects = sc
        | otherwise = 0
  score NumericAnswer{ anaCorrect = corrects, anaScore = sc } (NumericUA val)
        | val `elem` corrects = sc
        | otherwise = 0
  score _ _ = error "Cannot determine the score"
