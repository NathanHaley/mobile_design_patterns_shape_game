import Foundation
import UIKit

protocol ShapeFactory {
  func createShapes(shapeCount: Int) -> [Shape]
  
  var minProportion: CGFloat { get set }
  var maxProportion: CGFloat { get set }
  //var shapeType: Shape { get set }
  
  //init()

}

//extension ShapeFactory {
//  init<T: Shape>(shapeType: T, minProportion: CGFloat, maxProportion: CGFloat) {
//    self.init()
//    self.minProportion = minProportion
//    self.maxProportion = maxProportion
//  }
//  
//}

struct SquareShapeFactory: ShapeFactory {
  
  var minProportion: CGFloat
  var maxProportion: CGFloat
  

  init(minProportion: CGFloat, maxProportion: CGFloat) {
    self.minProportion = minProportion
    self.maxProportion = maxProportion
  }
  
  func createShapes(shapeCount: Int) -> [Shape] {
    var shapes = [Shape]()
    var shape: SquareShape
    
    for _ in 0..<shapeCount {
      shape = SquareShape()
      shape.areaFactor = Utils.randomBetweenLower(minProportion, andUpper: maxProportion)
      print("Printing square shape")
      shapes.append(shape as Shape)
      
    }
    
    return shapes
  }
}

struct CircleShapeFactory: ShapeFactory {
  var minProportion: CGFloat
  var maxProportion: CGFloat
  
  init(minProportion: CGFloat, maxProportion: CGFloat) {
    self.minProportion = minProportion
    self.maxProportion = maxProportion
  }
  
  func createShapes(shapeCount: Int) -> [Shape] {
    var shapes = [Shape]()
    var shape: CircleShape
    
    for _ in 0..<shapeCount {
      shape = CircleShape()
      shape.areaFactor = Utils.randomBetweenLower(minProportion, andUpper: maxProportion)
      print("printing circle shape!")
      shapes.append(shape as Shape)
    
    }
  
    return shapes
  }
}