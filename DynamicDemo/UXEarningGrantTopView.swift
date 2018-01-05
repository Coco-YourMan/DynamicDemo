//
//  UXEarningGrantTopView.swift
//  DynamicDemo
//
//  Created by Mr.Jeen on 2018/1/5.
//  Copyright © 2018年 Jeen. All rights reserved.
//

import UIKit

class UXEarningGrantTopView: UIView {

    var firstLayer:CAShapeLayer!
    var secondLayer:CAShapeLayer!
    let r:CGFloat = 100
    var width:CGFloat = 300
    var height:CGFloat = 200
    let Xmin = 0
    let Ymin = 0
    var timer:Timer?
    
    var xFChange:Int = 1
    var yFChange:Int = 1
    var xSChange:Int = -1
    var ySChange:Int = 1
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        width = self.layer.frame.size.width
        height = self.layer.frame.size.height
        
        addSubLayers()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.init(red: 0.992, green: 0.502, blue: 0.137, alpha: 0.2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubLayers() {
        let firstPath = UIBezierPath(arcCenter: CGPoint(x:0 ,y:0), radius: r, startAngle: 0, endAngle:.pi*2, clockwise: true)
        
        firstLayer = CAShapeLayer();
        firstLayer.frame = CGRect(origin:CGPoint(x:getOriValue(width) ,y:getOriValue(height) ) ,size:CGSize(width:r*2 ,height:r*2 ))
        firstLayer.path = firstPath.cgPath;
        firstLayer.fillColor = UIColor.init(red: 0.992, green: 0.502, blue: 0.137, alpha: 0.4).cgColor
        firstLayer.strokeColor = UIColor.clear.cgColor
        self.layer.addSublayer(firstLayer)
        
        
        
        secondLayer = CAShapeLayer();
        secondLayer.frame = CGRect(origin:CGPoint(x:getOriValue(width) ,y:getOriValue(height) ) ,size:CGSize(width:r*2 ,height:r*2 ))
        secondLayer.path = firstPath.cgPath;
        secondLayer.fillColor = UIColor.init(red: 0.992, green: 0.502, blue: 0.137, alpha: 0.4).cgColor
        secondLayer.strokeColor = UIColor.clear.cgColor
        self.layer.addSublayer(secondLayer)
    }
    
    func startAnimate() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateConfig), userInfo: nil, repeats: true)
        timer?.fireDate = Date()
    }
    
    func pauseAnimate() {
        timer?.fireDate = Date.distantFuture
    }
    
    func stopAnimate() {
        timer?.fireDate = Date.distantFuture
        timer?.invalidate()
    }
    
    @objc func animateConfig() {
        let xF = getChangeVF(firstLayer.frame.origin.x, isX: true)
        let yF = getChangeVF(firstLayer.frame.origin.y, isX: false)
        let wF = firstLayer.frame.size.width
        let hF = firstLayer.frame.size.height
        
        let xS = getChangeVS(secondLayer.frame.origin.x, isX: true)
        let yS = getChangeVS(secondLayer.frame.origin.y, isX: false)
        let wS = secondLayer.frame.size.width
        let hS = secondLayer.frame.size.height
        
        let frameF = CGRect.init(x: xF, y: yF, width: wF, height: hF)
        let frameS = CGRect.init(x: xS, y: yS, width: wS, height: hS)
        firstLayer.frame = frameF
        secondLayer.frame = frameS
        
        //self.layer.addSublayer(firstLayer)
    }
    
    func getOriValue(_ flt:CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(flt)))
    }
    
    func getChangeVF(_ value:CGFloat, isX:Bool) -> CGFloat {
        
        if isX == true {
            if value > width {
                xFChange = -1
            } else if value < 0{
                xFChange = 1
            }
            return CGFloat(value + CGFloat(xFChange))
            
        } else {
            if value > height {
                yFChange = -1
            } else if value < 0{
                yFChange = 1
            }
            return CGFloat(value + CGFloat(yFChange))
        }
        
    }
    
    func getChangeVS(_ value:CGFloat, isX:Bool) -> CGFloat {
        
        if isX == true {
            if value > width {
                xSChange = -1
            } else if value < 0{
                xSChange = 1
            }
            return CGFloat(value + CGFloat(xSChange))
            
        } else {
            if value > height {
                ySChange = -1
            } else if value < 0{
                ySChange = 1
            }
            return CGFloat(value + CGFloat(ySChange))
        }
        
    }
    

}
