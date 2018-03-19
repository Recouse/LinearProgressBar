//
//  LinearProgressBar.swift
//  LinearProgressBar
//
//  Created by Firdavs Khaydarov on 09/03/18.
//  Copyright © 2018 Firdavs Khaydarov. All rights reserved.
//

import UIKit

open class LinearProgressBar: UIView {
    
    let indeterminateAnimationKey = "indeterminateAnimation"
    
    let progressLayer = CAShapeLayer()
    
    private(set) var isAnimating = false
    var progressBarWidth: CGFloat = 2.0
    var animationDuration : TimeInterval = 2.0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        prepareLines()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareLines()
    }
    
    func prepareLines() {
        progressLayer.fillColor = UIColor.blue.withAlphaComponent(0.2).cgColor
        progressLayer.lineWidth = progressBarWidth
        progressLayer.strokeColor = UIColor.blue.cgColor
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = 0
        
        progressLayer.frame = bounds
        
        layer.addSublayer(progressLayer)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()

        updateLineLayers()
    }
    
    private func updateLineLayers() {
        frame = CGRect(x: 0, y: 0, width: bounds.width, height: progressBarWidth)
        
        let linePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.size.width, height: progressBarWidth))
        linePath.move(to: CGPoint(x: 0, y: 0))
        linePath.addLine(to: CGPoint(x: bounds.width, y: 0))

        progressLayer.path = linePath.cgPath
    }
    
    func forceBeginRefreshing() {
        isAnimating = false
        startAnimating()
    }
    
    open func startAnimating() {
        if(isAnimating){
            return
        }
        
        isAnimating = true
        
        progressLayer.add(indeterminateAnimation(), forKey: indeterminateAnimationKey)
    }
    
    open func stopAnimating(completion: (() -> Void)? = nil) {
        isAnimating = false
        progressLayer.removeAnimation(forKey: indeterminateAnimationKey)
        
        completion?()
    }
    
    // MARK: - Private
    
    private func indeterminateAnimation() -> CAAnimationGroup {
        let headInAnimation = CABasicAnimation(keyPath: "strokeStart")
        headInAnimation.duration = animationDuration / 2
        headInAnimation.fromValue = 0
        headInAnimation.toValue = 0.25
        headInAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        let tailInAnimation = CABasicAnimation(keyPath: "strokeEnd")
        tailInAnimation.duration = animationDuration / 2
        tailInAnimation.fromValue = 0
        tailInAnimation.toValue = 1
        tailInAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        let headOutAnimation = CABasicAnimation(keyPath: "strokeStart")
        headOutAnimation.beginTime = animationDuration / 2
        headOutAnimation.duration = animationDuration / 2
        headOutAnimation.fromValue = 0.25
        headOutAnimation.toValue = 1
        headOutAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        let tailOutAnimation = CABasicAnimation(keyPath: "strokeEnd")
        tailOutAnimation.beginTime = animationDuration / 2
        tailOutAnimation.duration = animationDuration / 2
        tailOutAnimation.fromValue = 1
        tailOutAnimation.toValue = 1
        tailOutAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        let animation = CAAnimationGroup()
        animation.duration = animationDuration
        animation.animations = [
            headInAnimation,
            tailInAnimation,
            headOutAnimation,
            tailOutAnimation
        ]
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        
        return animation
    }
}


