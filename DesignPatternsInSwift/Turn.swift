import Foundation

struct Turn {
  
  let shapes: [Shape]
  var matched: Bool?
  
  init(shapes: [Shape]) {
    self.shapes = shapes
  }
  
  mutating func turnCompletedWithTappedShape(tappedShape: Shape) {
    let maxArea = shapes.reduce(0) { $0 > $1.area ? $0 : $1.area }
    matched = tappedShape.area >= maxArea
  }
}
