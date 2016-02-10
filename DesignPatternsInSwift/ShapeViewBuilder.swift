import Foundation
import UIKit

struct ShapeViewBuilder {
  var showFill = true
  var fillColor = UIColor.orangeColor()
  
  var showOutline = true
  var outlineColor = UIColor.grayColor()
  
  init(shapeViewFactory: ShapeViewFactory) {
    self.shapeViewFactory = shapeViewFactory
  }
  
  func buildShapeViewsForShapes(shapes: [Shape]) -> [ShapeView] {
    let shapeViews = shapeViewFactory.makeShapeViewsForShapes(shapes)
    
    for view in shapeViews {
      configureShapeView(view)
    }
    
    return shapeViews
  }
  
  private func configureShapeView(shapeView: ShapeView) {
    shapeView.showFill = showFill
    shapeView.fillColor = fillColor
    
    shapeView.showOutline = showOutline
    shapeView.outlineColor = outlineColor
  }
  
  private var shapeViewFactory: ShapeViewFactory
  
}