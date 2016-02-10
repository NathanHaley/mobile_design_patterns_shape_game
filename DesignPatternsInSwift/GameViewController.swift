import UIKit

class GameViewController: UIViewController {
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let squareShapeViewFactory = SquareShapeViewFactory(size: gameView.sizeAvailableForShapes())
    let squareShapeFactory = SquareShapeFactory(minProportion: 0.3, maxProportion: 0.8)
    let squareShapeViewBuilder = shapeViewBuilderForFactory(squareShapeViewFactory)
    let squareTurnStrategy = BasicTurnStrategy(shapeFactory: squareShapeFactory, shapeViewBuilder: squareShapeViewBuilder)
    
    let circleShapeViewFactory = CircleShapeViewFactory(size: gameView.sizeAvailableForShapes())
    let circleShapeFactory = CircleShapeFactory(minProportion: 0.3, maxProportion: 0.8)
    let circleShapeViewBuilder = shapeViewBuilderForFactory(circleShapeViewFactory)
    let circleTurnStrategy = BasicTurnStrategy(shapeFactory: circleShapeFactory, shapeViewBuilder: circleShapeViewBuilder)
    
    let randomTurnStrategy = RandomTurnStrategy(firstStrategy: squareTurnStrategy, secondStrategy: circleTurnStrategy)
    
    turnController = TurnController(turnStrategy: randomTurnStrategy)
    
    beginNextTurn()
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
  
  private func shapeViewBuilderForFactory(shapeViewFactory: ShapeViewFactory) -> ShapeViewBuilder {
    var shapeViewBuilder = ShapeViewBuilder(shapeViewFactory: shapeViewFactory)
    shapeViewBuilder.fillColor = UIColor.brownColor()
    shapeViewBuilder.outlineColor = UIColor.orangeColor()
    return shapeViewBuilder
  }
  
  private func beginNextTurn() {
    let shapeViews = turnController.beginNewTurn()
    
    for view in shapeViews {
      
      view.tapHandler = {
        tappedView in
        self.gameView.score += self.turnController.endTurnWithTappedShape(tappedView.shape)
        self.beginNextTurn()
      }

    }
    
    gameView.addShapeViews(shapeViews)
  }
  
  private var gameView: GameView { return view as! GameView }
  private var turnController: TurnController!
}