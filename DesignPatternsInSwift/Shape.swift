//
//  Shape.swift
//  DesignPatternsInSwift
//
//  Created by Joel Shapiro on 9/23/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol Shape {
  var areaFactor: CGFloat! { get }
  var area: CGFloat { get }
}

struct SquareShape: Shape {
  var areaFactor: CGFloat!
  var area: CGFloat { return areaFactor * areaFactor }
}

struct CircleShape: Shape {
  var areaFactor: CGFloat!
  var area: CGFloat { return CGFloat(M_PI) * areaFactor * areaFactor / 4.0 }
}
