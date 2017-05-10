//
//  GraphView.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/3/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class SleepGraphView: UIView {

    //1 - the properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.green
    
    var passedName = ""
    
    var graphPoints:[Sleep] = Model.sharedInstance.fetchSleep()
    var graphArray:[Int] = []
    
    override func draw(_ rect: CGRect) {
        
        let width = rect.width
        let height = rect.height

        for rows in graphPoints{
            print(passedName)
            if rows.child_name == passedName{
                graphArray.append(Int(rows.time_woken_up))
            }
        }
        print(graphArray)
        
        let margin:CGFloat = 20.0
        let columnXPoint = { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin*2 - 4) /
                CGFloat((self.graphArray.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphArray.max()
        let columnYPoint = { (graphPoint:Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) /
                CGFloat(maxValue!) * graphHeight
            y = graphHeight + topBorder - y // Flip the graph
            return y
        }
        
        //set up background clipping area
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: UIRectCorner.allCorners,
                                cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        if let context = context, let gradient = gradient {
            context.drawLinearGradient(gradient,
                                       start: startPoint,
                                       end: endPoint,
                                       options: CGGradientDrawingOptions(rawValue: 0))
        }
        UIColor.black.setFill()
        UIColor.black.setStroke()
        
        //set up the points line
        let graphPath = UIBezierPath()
        //go to start of line
        graphPath.move(to: CGPoint(x:columnXPoint(0),
                                   y:columnYPoint(graphArray[0])))
        
        //add points for each item in the graphPoints array
        //at the correct (x, y) for the point
        for i in 1..<graphArray.count {
            let nextPoint = CGPoint(x:columnXPoint(i),
                                    y:columnYPoint(graphArray[i]))
            graphPath.addLine(to: nextPoint)
        }
        context!.saveGState()
        //2 - make a copy of the path
        let clippingPath = graphPath.copy() as! UIBezierPath
        
        //3 - add lines to the copied path to complete the clip area
        clippingPath.addLine(to: CGPoint(
            x: columnXPoint(graphArray.count - 1),
            y:height))
        clippingPath.addLine(to: CGPoint(
            x:columnXPoint(0),
            y:height))
        clippingPath.close()
        
        //4 - add the clipping path to the context
        clippingPath.addClip()
        
        context!.restoreGState()
        if let context = context, let gradient = gradient{
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        }
        graphPath.lineWidth = 2.0
        for i in 0..<graphArray.count {
            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(graphArray[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
            
            let circle = UIBezierPath(ovalIn:
                CGRect(origin: point,
                       size: CGSize(width: 5.0, height: 5.0)))
            circle.fill()
        }
        //Draw horizontal graph lines on the top of everything
        let linePath = UIBezierPath()
        
        //top line
        linePath.move(to: CGPoint(x:margin, y: topBorder))
        linePath.addLine(to: CGPoint(x: width - margin,
                                        y:topBorder))
        
        //center line
        linePath.move(to: CGPoint(x:margin,
                                     y: graphHeight/2 + topBorder))
        linePath.addLine(to: CGPoint(x:width - margin,
                                        y:graphHeight/2 + topBorder))
        
        //bottom line
        linePath.move(to: CGPoint(x:margin,
                                     y:height - bottomBorder))
        linePath.addLine(to: CGPoint(x:width - margin,
                                        y:height - bottomBorder))
        let color = UIColor(white: 0.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
        graphPath.stroke()
    }
}
