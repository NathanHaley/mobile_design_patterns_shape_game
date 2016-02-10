//
//  GameView.swift
//  DesignPatternsInSwift
//
//  Created by Joel Shapiro on 9/23/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

import Foundation
import UIKit

class GameView: UIView {
  
  private var scoreLabel: UILabel!
  private var shapeViews: [ShapeView]!
  
  let padding: CGFloat = 20.0
  
  var score: Int = 0 {
    didSet {
      scoreLabel.attributedText = attributedTextForScore(score)
      setNeedsLayout()
      setNeedsDisplay()
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    print("New GameView")

    backgroundColor = UIColor(red: 0x7c/255.0, green: 0xbb/255.0, blue: 0xf2/255.0, alpha: 1)

    scoreLabel = UILabel(frame: CGRectZero)
    scoreLabel.attributedText = attributedTextForScore(score)
    addSubview(scoreLabel)
    //scoreLabel.sizeToFit()
  }

  override func layoutSubviews() {
    scoreLabel.sizeToFit()
    scoreLabel.center.x = bounds.size.width / 2.0
    scoreLabel.frame.origin.y = padding
  }

  func sizeAvailableForShapes() -> CGSize {
    let topY    = CGRectGetMaxY(scoreLabel.frame) + padding
    let bottomY = bounds.size.height - padding
    let leftX  = padding
    let rightX = bounds.size.width - padding
    let smallestDimension = min(rightX - leftX, (bottomY - topY - 2 * padding) / 2.0)
    print(smallestDimension)
    return CGSize(width: smallestDimension, height: smallestDimension)
  }

  
  func addShapeViews(newShapeViews: [ShapeView]) {
    let axis_x = bounds.size.width / 2.0
    
    //For now ybase is used to help adjust y axis placement of the second object. Will need 
    //another solution if adding more shapes than two
    var ybase: CGFloat = 1.0
    
    //On initial pass shapeViews is null
    if let shapeViews = shapeViews {
      for view in shapeViews {
        
        view.removeFromSuperview()
        
      }
    }
    
    shapeViews = newShapeViews
    
    for view in newShapeViews {
      
      ybase *= -1
      view.center.x = axis_x
      view.center.y = (center.y - (padding * ybase) - (view.frame.size.height * ybase) / 2.0)
      
      print("view.center.x = \(view.center.x) and view.center.y = \(view.center.y)")
      
      addSubview(view)
      
    }

  }

  private final func attributedTextForScore(aScore: Int) -> NSAttributedString? {
    return NSAttributedString(string: "Score: \(aScore)",
      attributes: [ NSFontAttributeName : UIFont.boldSystemFontOfSize(32),
        NSForegroundColorAttributeName : aScore < 0 ? UIColor.redColor() : UIColor.blackColor()])
  }


}
