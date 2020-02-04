module Exercise.Chapter02Spec where

import SpecHelper
import Control.Exception (evaluate)

spec :: Spec
spec = do
  describe "penultimate" $ do
    context "with [1]" $
      it "should throw" $
        evaluate (penultimate [1]) `shouldThrow` anyErrorCall
    
    context "with [1, 2]" $
      it "should be 2" $
        penultimate [1, 2] `shouldBe` 1

    context "with [1..10]" $
      it "should be 0" $
        penultimate [1..10] `shouldBe` 9

  describe "findK" $ do
    context "with [1]" $
      it "should find 1" $
        findK 1 [1] `shouldBe` 1
    
    context "with [1, 2]" $
      it "should find 2" $
        findK 2 [1, 2] `shouldBe` 2

    context "with [1..10]" $ do
      it "should find 3" $
        findK 5 [1..10] `shouldBe` 5

      it "should throw " $
        evaluate (findK 11 [1..10]) `shouldThrow` anyErrorCall

  describe "isPalindrome" $ do
    context "with [1]" $
      it "should be True" $
        isPalindrome [1] `shouldBe` True
    
    context "with [1, 1]" $
      it "should be False" $
        isPalindrome [1, 1] `shouldBe` True
    
    context "with [1, 2]" $
      it "should be False" $
        isPalindrome [1, 2] `shouldBe` False

    context "with [1..10, 10...1]" $ 
      it "should be True" $ let
          list = [1..10]
          palinrome = list ++ reverse list
        in isPalindrome palinrome `shouldBe` True

  describe "duplicate" $ do
    context "with [1]" $
      it "should be [1, 1]" $
        duplicate [1] `shouldBe` [1, 1]
    
    context "with [1, 1]" $
      it "should be [1, 1, 1, 1]" $
        duplicate [1, 1] `shouldBe` [1, 1, 1, 1]
    
    context "with [1, 2]" $
      it "should be [1, 1, 2, 2]" $
        duplicate [1, 2] `shouldBe` [1, 1, 2, 2]

    context "with [1..10]" $ 
      it "should be [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]" $ let
          list = [1..5]
        in duplicate list `shouldBe` [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]

  describe "ziplike" $ do
    context "with  [1] [2]" $
      it "should be like zip" $ 
       ziplike [1] [2] `shouldBe` zip [1] [2]
    
    context "with [1, 2] [3, 4]" $
      it "should be like zip" $ 
        ziplike [1, 2] [3, 4] `shouldBe` zip [1, 2] [3, 4]

    context "with [1..5] [6..10]" $ 
      it "should be like zip" $ 
       ziplike [1..5] [6..10] `shouldBe` zip [1..5] [6..10] 

  describe "splitAtIndex" $ do
    it "with  1 [1]" $ 
      splitAtIndex 1 [1] `shouldBe` ([1], [] :: (Num a) => [a])
    it "with  0 [1]" $ 
      splitAtIndex 0 [1] `shouldBe` ([] :: (Num a) => [a], [1])
    it "with  1 [1, 2]" $ 
      splitAtIndex 1 [1, 2] `shouldBe` ([1], [2])

  describe "slice" $ 
    it "slice 3 6 [0,0,0,1,2,3,0,0,0]" $ 
      slice 3 6 [0,0,0,1,2,3,0,0,0] `shouldBe` [1,2,3]

  describe "rotate" $
    it "rotate 2 [1,2,3,4,5]" $ 
      rotate 2 [1,2,3,4,5] `shouldBe` [3,4,5,1,2] 

    


main :: IO ()
main = hspec spec
    