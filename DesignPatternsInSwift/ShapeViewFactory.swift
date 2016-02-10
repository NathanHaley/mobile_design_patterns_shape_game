import Foundation
import UIKit

protocol ShapeViewFactory {
  
  var size: CGSize { get set }
  
  func makeShapeViewsForShapes(shapes: [Shape]) -> [ShapeView]
  
}

struct SquareShapeViewFactory: ShapeViewFactory {
  var size: CGSize
  
  init(size: CGSize) {
    self.size = size
  }
  
  func makeShapeViewsForShapes(shapes: [Shape]) -> [ShapeView] {
    var shapeViews = [ShapeView]()
    
    for shape in shapes {
      let squareShape = shape as! SquareShape
      let shapeView = SquareShapeView(frame: CGRect(x: 0, y: 0, width: squareShape.areaFactor * size.width, height: squareShape.areaFactor * size.height))
      
      shapeView.shape = squareShape
      
      shapeViews.append(shapeView)
      
    }
    
    return shapeViews
  }
}

struct CircleShapeViewFactory: ShapeViewFactory {
  var size: CGSize
  
  init(size: CGSize) {
    self.size = size
  }
  
  func makeShapeViewsForShapes(shapes: [Shape]) -> [ShapeView] {
    var shapeViews = [ShapeView]()
    
    for shape in shapes {
      let circleShape = shape as! CircleShape
      let shapeView = CircleShapeView(frame: CGRect(
        x: 0,
        y: 0,
        width: circleShape.areaFactor * size.width,
        height: circleShape.areaFactor * size.height))
      
      shapeView.shape = circleShape
      
      shapeViews.append(shapeView)
      
    }
    
    return shapeViews
  }
}
