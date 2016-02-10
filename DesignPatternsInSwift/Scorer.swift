import Foundation

protocol Scorer {
  func computeScoreIncrement<S: SequenceType where Turn == S.Generator.Element>(pastTurnsReversed: S) -> Int
  
  var nextScorer: Scorer? { get set }
}

struct MatchScorer: Scorer {
  var nextScorer: Scorer? = nil
  
  init() {
    print("New MatchScorer")
  }
  
  func computeScoreIncrement<S : SequenceType where Turn == S.Generator.Element>(pastTurnsReversed: S) -> Int {
    var scoreIncrement: Int?
    
    for turn in pastTurnsReversed {
      if scoreIncrement == nil {

        scoreIncrement = turn.matched! ? 1 : -1
        break
      }
    }
    
    return (scoreIncrement ?? 0) + (nextScorer?.computeScoreIncrement(pastTurnsReversed) ?? 0)
  }
}

struct StreakScorer: Scorer {
  var nextScorer: Scorer? = nil
  
  init() {
    print("New StreakScorer")
  }
  
  func computeScoreIncrement<S : SequenceType where Turn == S.Generator.Element>(pastTurnsReversed: S) -> Int {
    
    var streakLength = 0
    for turn in pastTurnsReversed {
      if turn.matched! {
        
        ++streakLength
        
      } else {
        
        break
      }
    }
    
    let streakBonus = streakLength >= 5 ? 10 : 0
    return streakBonus + (nextScorer?.computeScoreIncrement(pastTurnsReversed) ?? 0)
  }
}