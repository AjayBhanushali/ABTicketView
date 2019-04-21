//
//  ABTicketView.swift
//  ABTicketView
//
//  Created by Ajay Bhanushali on 21/04/19.
//  Copyright © 2019 ajaybhanushali. All rights reserved.
//

import UIKit

@IBDesignable
class ABTicketView : UIView {
    
    @IBInspectable var ticketColor: UIColor = UIColor(red: 18/255.0, green: 112/255.0, blue: 178/255.0, alpha: 1.0)
    @IBInspectable var circleDiameter: CGFloat = 10
    @IBInspectable var cuttingDepth: CGFloat = 1
    @IBInspectable var tearRight: Bool = true
    @IBInspectable var tearLeft: Bool = true
    @IBInspectable var tearTop: Bool = true
    @IBInspectable var tearBottom: Bool = true
    
    let lineSeparator:CGFloat = 1.0
    var lineHeight: CGFloat = 10
    let cuttingLength: CGFloat = 2
    
    // MARK:- UIView Draw method
    override func draw(_ rect: CGRect) {
        layer.sublayers = []
        drawTicket()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func drawTicket() {
        lineHeight = circleDiameter
        let ticketLayer = CAShapeLayer()
        ticketLayer.frame = bounds
        let ticketPath = UIBezierPath()
        let zero:CGFloat = 0.0
        let viewWidth = self.bounds.width - zero*2
        let viewHeight = self.bounds.height - zero*2
        
        ticketPath.move(to: CGPoint(x: zero, y: zero))
        
        let numberOfCirclesHorizontally = Int(viewWidth/(lineHeight+circleDiameter))
        let extraLineHorizontally = (Int(viewWidth) - Int(circleDiameter)*numberOfCirclesHorizontally - Int(lineHeight)*(numberOfCirclesHorizontally-1))/2
        
        let numberOfCirclesVertically = Int(viewHeight/(lineHeight+circleDiameter))
        let extraLineVertically = (viewHeight - circleDiameter*CGFloat(numberOfCirclesVertically) - (lineHeight)*CGFloat(numberOfCirclesVertically-1))/2
        
        // Left Properties
        var currentLineLeft: CGFloat = zero+lineSeparator
        var nextLineLeft: CGFloat = extraLineVertically
        
        // Bottom Properties
        var currentLineBottom: CGFloat = zero+lineSeparator
        var nextLineBottom: CGFloat = CGFloat(extraLineHorizontally)
        
        // Right Properties
        var currentLineRight: CGFloat = viewHeight-lineSeparator
        var nextLineRight: CGFloat = viewHeight - extraLineVertically
        
        // Top Properties
        var currentLineTop: CGFloat = viewWidth
        var nextLineTop: CGFloat = viewWidth - CGFloat(extraLineHorizontally)
        
        if tearLeft {
            for _ in 1...numberOfCirclesVertically {
                for j in stride(from: currentLineLeft, to: nextLineLeft, by: cuttingLength+lineSeparator) {
                    if j < (nextLineLeft-cuttingLength) {
                        ticketPath.addLine(to: CGPoint(x: zero, y: j))
                        ticketPath.addLine(to: CGPoint(x: zero+cuttingDepth, y: j))
                        ticketPath.addLine(to: CGPoint(x: zero+cuttingDepth, y: j+cuttingLength))
                        ticketPath.addLine(to: CGPoint(x: zero, y: j+cuttingLength))
                    }
                }
                // adding curve
                ticketPath.addArc(withCenter: CGPoint(x: zero, y: nextLineLeft+circleDiameter/2),
                                  radius: circleDiameter/2,
                                  startAngle: CGFloat(270).toRadians(),
                                  endAngle: CGFloat(90).toRadians(),
                                  clockwise: true)
                
                currentLineLeft = nextLineLeft+circleDiameter+lineSeparator
                nextLineLeft += (lineHeight + circleDiameter)
            }
            
            // 3
            for j in stride(from: currentLineLeft, to: viewHeight, by: cuttingLength+lineSeparator) {
                if j < (viewHeight-cuttingLength) {
                    ticketPath.addLine(to: CGPoint(x: zero, y: j))
                    ticketPath.addLine(to: CGPoint(x: zero+cuttingDepth, y: j))
                    ticketPath.addLine(to: CGPoint(x: zero+cuttingDepth, y: j+cuttingLength))
                    ticketPath.addLine(to: CGPoint(x: zero, y: j+cuttingLength))
                }
            }
            ticketPath.addLine(to: CGPoint(x: zero, y: viewHeight))
        } else {
            ticketPath.addLine(to: CGPoint(x: zero, y: viewHeight))
        }
        
        if tearBottom {
            for _ in 1...numberOfCirclesHorizontally {
                for j in stride(from: currentLineBottom, to: nextLineBottom, by: cuttingLength+lineSeparator) {
                    if j < (nextLineBottom-cuttingLength) {
                        ticketPath.addLine(to: CGPoint(x: j, y: viewHeight))
                        ticketPath.addLine(to: CGPoint(x: j, y: viewHeight-cuttingDepth))
                        ticketPath.addLine(to: CGPoint(x: j+cuttingLength, y: viewHeight-cuttingDepth))
                        ticketPath.addLine(to: CGPoint(x: j+cuttingLength, y: viewHeight))
                    }
                }
                // adding curve
                ticketPath.addArc(withCenter: CGPoint(x: nextLineBottom+circleDiameter/2, y: viewHeight),
                                  radius: circleDiameter/2,
                                  startAngle: CGFloat(180).toRadians(),
                                  endAngle: CGFloat(0).toRadians(),
                                  clockwise: true)
                
                currentLineBottom = nextLineBottom+circleDiameter+lineSeparator
                nextLineBottom += (lineHeight + circleDiameter)
            }
            
            // 3
            for j in stride(from: currentLineBottom, to: viewWidth, by: cuttingLength+lineSeparator) {
                if j < (viewWidth-cuttingLength) {
                    ticketPath.addLine(to: CGPoint(x: j, y: viewHeight))
                    ticketPath.addLine(to: CGPoint(x: j, y: viewHeight-cuttingDepth))
                    ticketPath.addLine(to: CGPoint(x: j+cuttingLength, y: viewHeight-cuttingDepth))
                    ticketPath.addLine(to: CGPoint(x: j+cuttingLength, y: viewHeight))
                }
            }
            ticketPath.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        }
        else {
            ticketPath.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        }
        
        if tearRight {
            for _ in 1...numberOfCirclesVertically {
                // draw pattern till nextLineY
                for j in stride(from: currentLineRight, to: nextLineRight, by: -(cuttingLength+lineSeparator)) {
                    if j > (nextLineRight+cuttingLength) {
                        ticketPath.addLine(to: CGPoint(x: viewWidth, y: j))
                        ticketPath.addLine(to: CGPoint(x: viewWidth-cuttingDepth, y: j))
                        ticketPath.addLine(to: CGPoint(x: viewWidth-cuttingDepth, y: j-cuttingLength))
                        ticketPath.addLine(to: CGPoint(x: viewWidth, y: j-cuttingLength))
                    }
                }
                
                // adding curve
                ticketPath.addArc(withCenter: CGPoint(x: viewWidth, y: nextLineRight-circleDiameter/2),
                                  radius: circleDiameter/2,
                                  startAngle: CGFloat(90).toRadians(),
                                  endAngle: CGFloat(270).toRadians(),
                                  clockwise: true)
                
                currentLineRight = nextLineRight-circleDiameter-lineSeparator
                nextLineRight -= (lineHeight + circleDiameter)
            }
            // 3
            
            for j in stride(from: currentLineRight, to: zero, by: -(cuttingLength+lineSeparator)) {
                if j > (zero+cuttingLength) {
                    ticketPath.addLine(to: CGPoint(x: viewWidth, y: j))
                    ticketPath.addLine(to: CGPoint(x: viewWidth-cuttingDepth, y: j))
                    ticketPath.addLine(to: CGPoint(x: viewWidth-cuttingDepth, y: j-cuttingLength))
                    ticketPath.addLine(to: CGPoint(x: viewWidth, y: j-cuttingLength))
                }
            }
            ticketPath.addLine(to: CGPoint(x: viewWidth, y: zero))
        } else {
            ticketPath.addLine(to: CGPoint(x: viewWidth, y: zero))
        }
        
        if tearTop {
            for _ in 1...numberOfCirclesHorizontally {
                // draw pattern till nextLineY
                for j in stride(from: currentLineTop, to: nextLineTop, by: -(cuttingLength+lineSeparator)) {
                    if j > (nextLineTop+cuttingLength) {
                        ticketPath.addLine(to: CGPoint(x: j, y: 0))
                        ticketPath.addLine(to: CGPoint(x: j, y: cuttingDepth))
                        ticketPath.addLine(to: CGPoint(x: j-cuttingLength, y: cuttingDepth))
                        ticketPath.addLine(to: CGPoint(x: j-cuttingLength, y: 0))
                    }
                }
                
                // adding curve
                ticketPath.addArc(withCenter: CGPoint(x: nextLineTop-circleDiameter/2, y: 0),
                                  radius: circleDiameter/2,
                                  startAngle: CGFloat(0).toRadians(),
                                  endAngle: CGFloat(180).toRadians(),
                                  clockwise: true)
                currentLineTop = nextLineTop-circleDiameter-lineSeparator
                nextLineTop -= (lineHeight + circleDiameter)
            }
            
            // 3
            for j in stride(from: currentLineTop, to: zero, by: -(cuttingLength+lineSeparator)) {
                if j > (zero+cuttingLength) {
                    ticketPath.addLine(to: CGPoint(x: j, y: 0))
                    ticketPath.addLine(to: CGPoint(x: j, y: cuttingDepth))
                    ticketPath.addLine(to: CGPoint(x: j-cuttingLength, y: cuttingDepth))
                    ticketPath.addLine(to: CGPoint(x: j-cuttingLength, y: 0))
                }
            }
            ticketPath.close()
        } else {
            ticketPath.close()
        }
        ticketPath.lineWidth = 1
        ticketColor.setStroke()
        ticketPath.stroke()
        ticketColor.setFill()
        ticketPath.fill()
        
        ticketLayer.path = ticketPath.cgPath
        ticketLayer.fillColor = ticketColor.cgColor
        layer.addSublayer(ticketLayer)
    }
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * .pi / 180.0
    }
}
