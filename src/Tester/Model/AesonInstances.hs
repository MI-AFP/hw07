{-# LANGUAGE OverloadedStrings #-}

module Tester.Model.AesonInstances where

import Tester.Model
import Data.Aeson
import Data.Aeson.Types
import Data.Text.Lazy


instance FromJSON Choice where
  parseJSON (Object o) = Choice <$>
                          o .: "text"    <*>
                          o .: "score"   <*>
                          o .: "correct"
  parseJSON _ = fail "Expected an object"

instance FromJSON Answer where
  parseJSON = withObject "Answer" $ \o -> do
    kind <- o .: "kind"
    case kind of
      "singlech" -> SingleChoice  <$> o .: "choices"
      "multich"  -> MultiChoice   <$> o .: "choices"
      "textual"  -> TextualAnswer <$> o .: "corrects" <*> o .: "score"
      "numeric"  -> NumericAnswer <$> o .: "corrects" <*> o .: "score"
      _          -> fail ("Unknown Answer kind: " ++ kind)

instance FromJSON Question where
  parseJSON (Object o) = Question         <$>
                          o .:  "text"    <*>
                          o .:  "answer"
  parseJSON _ = fail "Expected an object"

instance FromJSON TestSet where
  parseJSON (Object o) = TestSet <$>
                          o .:  "title" <*>
                          o .:? "intro" <*>
                          o .:  "questions"
  parseJSON _ = fail "Expected an object"
