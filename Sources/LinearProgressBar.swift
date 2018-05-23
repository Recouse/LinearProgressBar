//
//  LinearProgressBar.swift
//  LinearProgressBar
//
//  Created by Firdavs Khaydarov on 09/03/18.
//  Copyright © 2018 Firdavs Khaydarov. All rights reserved.
//

import UIKit

public enum LinearProgressBarState {
    case determinate(percentage: CGFloat)
    case indeterminate
}

open class LinearProgressBar: UIView {
    let animationKey = "linearProgressBarAnimation"
    
    let progressLayer = CAShapeLayer()
    
    private(set) var isAnimating = false
    open private(set) var state: LinearProgressBarState = .indeterminate
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
        
        layer.addSublayer(progressLayer)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()

        updateLineLayers()
    }
    
    private func updateLineLayers() {
        frame = CGRect(x: 0, y: 0, width: bounds.width, height: progressBarWidth)
        
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: bounds.maxY))
        linePath.addLine(to: CGPoint(x: bounds.width, y: bounds.maxY))

        progressLayer.path = linePath.cgPath
        progressLayer.frame = bounds
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
        
        progressLayer.add(indeterminateAnimation(), forKey: animationKey)
    }
    
    open func stopAnimating(completion: (() -> Void)? = nil) {
        isAnimating = false
        progressLayer.removeAnimation(forKey: animationKey)
        
        completion?()
    }
    
    // MARK: - Private
    
    private func indeterminateAnimation() -> CAAnimationGroup {
        let firstAnimation = CABasicAnimation(keyPath: "strokeEnd")
        firstAnimation.beginTime = animationDuration * 0.55
        firstAnimation.duration = animationDuration * 0.40
        firstAnimation.fromValue = 0
        firstAnimation.toValue = 1
        firstAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        let secondAnimation = CABasicAnimation(keyPath: "strokeStart")
        secondAnimation.beginTime = animationDuration * 0.66
        secondAnimation.duration = animationDuration * 0.40
        secondAnimation.fromValue = -0
        secondAnimation.toValue = 1.2
        secondAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        let thirdAnimation = CABasicAnimation(keyPath: "strokeEnd")
        thirdAnimation.beginTime = animationDuration * 0.88
        thirdAnimation.duration = animationDuration * 0.20
        thirdAnimation.fromValue = 1
        thirdAnimation.toValue = 1
        thirdAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)


        
        let animation = CAAnimationGroup()
        animation.duration = animationDuration
        animation.animations = [
            firstAnimation,
            secondAnimation,
            thirdAnimation
        ]
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        return animation
    }
}
