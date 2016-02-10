import Foundation

struct TurnController {
  var currentTurn: Turn?
  var pastTurns: [Turn] = [Turn]()
  
  private let turnStrategy: TurnStrategy

  init(turnStrategy: TurnStrategy) {
    self.turnStrategy = turnStrategy
    self.scorer = MatchScorer()
    self.scorer.nextScorer = StreakScorer()
  }
  
  mutating func beginNewTurn() -> [ShapeView] {
    var shapes = [Shape]()
    let shapeViews = turnStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns)
    
    for shapeView in shapeViews {
      print("beginNewTurn: \(shapeView.shape)")
      
      shapes.append(shapeView.shape)
      
    }
    
    currentTurn = Turn(shapes: shapes)
    
    return shapeViews
  }
  
  mutating func endTurnWithTappedShape(tappedShape: Shape) -> Int {
    currentTurn!.turnCompletedWithTappedShape(tappedShape)
    pastTurns.append(currentTurn!)
    
    let scoreIncrement = scorer.computeScoreIncrement(pastTurns.reverse())
    
    return scoreIncrement
  }
  
  private let scorer: Scorer
  
 
}