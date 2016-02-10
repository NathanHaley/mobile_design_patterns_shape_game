import Foundation

protocol TurnStrategy {
  func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> [ShapeView]
}

struct MixedTurnStrategy: TurnStrategy {
  let shapeFactory: ShapeFactory
  let shapeViewBuilder: ShapeViewBuilder
  
  init(shapeFactory: ShapeFactory, shapeViewBuilder: ShapeViewBuilder) {
    self.shapeFactory = shapeFactory
    self.shapeViewBuilder = shapeViewBuilder
  }
  
  func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> [ShapeView] {
    return shapeViewBuilder.buildShapeViewsForShapes(shapeFactory.createShapes(2))
  }
}

struct BasicTurnStrategy: TurnStrategy {
  let shapeFactory: ShapeFactory
  let shapeViewBuilder: ShapeViewBuilder
  
  init(shapeFactory: ShapeFactory, shapeViewBuilder: ShapeViewBuilder) {
    self.shapeFactory = shapeFactory
    self.shapeViewBuilder = shapeViewBuilder
  }

  func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> [ShapeView] {
    return shapeViewBuilder.buildShapeViewsForShapes(shapeFactory.createShapes(2))
  }
}

struct RandomTurnStrategy: TurnStrategy {

  let firstStrategy: TurnStrategy
  let secondStrategy: TurnStrategy
  
  init(firstStrategy: TurnStrategy, secondStrategy: TurnStrategy) {
    self.firstStrategy = firstStrategy
    self.secondStrategy = secondStrategy
  }
  
  func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> [ShapeView] {
    if Utils.randomBetweenLower(0.0, andUpper: 100.0) < 50.0 {
      return firstStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns)
    } else {
      return secondStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns)
    }
  }
}