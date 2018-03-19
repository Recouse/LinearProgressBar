//
//  LinearProgressBar.swift
//  LinearProgressBar
//
//  Created by Firdavs Khaydarov on 09/03/18.
//  Copyright © 2018 Firdavs Khaydarov. All rights reserved.
//

import UIKit

open class LinearProgressBar: UIView {
//    public var isAnimating = false
//
//    private var parentView: UIView!
//    private var progressBar: UIView!
//
//    public var duration: TimeInterval = 2.0
//    public var progressBarBackgroundColor: UIColor = UIColor.clear
//    public var progressBarColor: UIColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
//    public var heightForLinearBar: CGFloat = 2
//    public var widthForLinearBar: CGFloat = 0
//
//    override public init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.clipsToBounds = true
//        self.progressBar = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: heightForLinearBar))
//    }
//
//    convenience init(duration: TimeInterval? = nil, progressBarColor: UIColor? = nil, progressBarBackgroundColor: UIColor? = nil) {
//        self.init(frame: .zero)
//
//        self.duration = duration ?? self.duration
//        self.progressBarBackgroundColor = progressBarBackgroundColor ?? self.progressBarBackgroundColor
//        self.progressBarColor = progressBarColor ?? self.progressBarColor
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override open func layoutSubviews() {
//        super.layoutSubviews()
//
//        if widthForLinearBar == 0 || widthForLinearBar == frame.height {
//            widthForLinearBar = frame.width
//        }
//
//        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: heightForLinearBar)
//    }
//
//    open func startAnimating(){
//        configureColors()
//
//        show()
//
//        if !isAnimating {
//            self.isAnimating = true
//
//            UIView.animate(withDuration: 0.5, delay:0, options: [], animations: {
//                self.frame = CGRect(x: 0, y: self.frame.origin.y, width: self.widthForLinearBar, height: self.heightForLinearBar)
//            }, completion: { animationFinished in
//                self.addSubview(self.progressBar)
//                self.configureAnimation()
//            })
//        }
//    }
//
//    open func stopAnimating(completion: (() -> Void)? = nil) {
//        isAnimating = false
//
//        UIView.animate(withDuration: 0.5, animations: {
//            self.progressBar.frame = CGRect(x: self.widthForLinearBar, y: self.frame.origin.y, width: self.widthForLinearBar, height: 0)
//        }, completion: { completed in
//            if completed {
//                completion?()
//            }
//        })
//    }
//
//    // MARK: - Private
//
//    fileprivate func show() {
//        // Only show once
//        if superview != nil {
//            return
//        }
//
//        // Find current top viewcontroller
//        if let topController = getTopViewController() {
//            let superView: UIView = topController.view
//            superView.addSubview(self)
//        }
//    }
//
//    fileprivate func configureColors() {
//        backgroundColor = progressBarBackgroundColor
//        progressBar.backgroundColor = progressBarColor
//
//        layoutIfNeeded()
//    }
//
//    fileprivate func configureAnimation() {
//        guard let superview = superview else {
//            stopAnimating()
//
//            return
//        }
//
//        self.progressBar.frame = CGRect(origin: CGPoint(x: 0, y :0), size: CGSize(width: 0, height: heightForLinearBar))
//
//        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/5, animations: {
//                self.progressBar.frame = CGRect(x: 0, y: 0, width: self.widthForLinearBar * 0.7, height: self.heightForLinearBar)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 1/5, animations: {
//                self.progressBar.frame = CGRect(x: superview.frame.width, y: 0, width: self.widthForLinearBar * 0.07, height: self.heightForLinearBar)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 2/6, relativeDuration: 0, animations: {
//                self.progressBar.frame = CGRect(x: 0, y: 0, width: 0, height: self.heightForLinearBar)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 3/6, relativeDuration: 1/5, animations: {
//                self.progressBar.frame = CGRect(x: 0, y: 0, width: self.widthForLinearBar * 0.2, height: self.heightForLinearBar)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 4/6, relativeDuration: 1/5, animations: {
//                self.progressBar.frame = CGRect(x: superview.frame.width / 3, y: 0, width: self.widthForLinearBar * 0.4, height: self.heightForLinearBar)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 5/6, relativeDuration: 1/5, animations: {
//                self.progressBar.frame = CGRect(x: superview.frame.width, y: 0, width: self.widthForLinearBar * 0.7, height: self.heightForLinearBar)
//            })
//        }) { _ in
//            if self.isAnimating {
//                self.configureAnimation()
//            }
//        }
//    }
//
//    // MARK: - Utils
//
//    fileprivate func getTopViewController() -> UIViewController? {
//        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
//
//        while topController?.presentedViewController != nil {
//            topController = topController?.presentedViewController
//        }
//
//        return topController
//    }
    
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
        backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        
        progressLayer.fillColor = nil
        progressLayer.lineWidth = progressBarWidth
        progressLayer.strokeColor = UIColor.blue.cgColor
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = 0.5
        
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


