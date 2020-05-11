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

    private let firstProgressComponent = CAShapeLayer()
    private let secondProgressComponent = CAShapeLayer()
    private lazy var progressComponents = [firstProgressComponent, secondProgressComponent]
    
    private(set) var isAnimating = false
    open private(set) var state: LinearProgressBarState = .indeterminate
    var animationDuration: TimeInterval = 2.5
    
    open var progressBarWidth: CGFloat = 2.0 {
        didSet {
            updateProgressBarWidth()
        }
    }
    
    open var progressBarColor: UIColor = .systemBlue {
        didSet {
            updateProgressBarColor()
        }
    }
    
    open var cornerRadius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        prepare()
        prepareLines()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepare()
        prepareLines()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        updateLineLayers()
    }
    
    private func prepare() {
        clipsToBounds = true
    }
    
    func prepareLines() {
        progressComponents.forEach {
            $0.fillColor = progressBarColor.cgColor
            $0.lineWidth = progressBarWidth
            $0.strokeColor = progressBarColor.cgColor
            $0.strokeStart = 0
            $0.strokeEnd = 0
            layer.addSublayer($0)
        }
    }
    
    private func updateLineLayers() {
        frame = CGRect(x: frame.minX, y: frame.minY, width: bounds.width, height: progressBarWidth)

        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: bounds.midY))
        linePath.addLine(to: CGPoint(x: bounds.width, y: bounds.midY))

        progressComponents.forEach {
            $0.path = linePath.cgPath
            $0.frame = bounds
        }

    }
    
    private func updateProgressBarColor() {
        progressComponents.forEach {
            $0.fillColor = progressBarColor.cgColor
            $0.strokeColor = progressBarColor.cgColor
        }
    }
    
    private func updateProgressBarWidth() {
        progressComponents.forEach {
            $0.lineWidth = progressBarWidth
        }
        updateLineLayers()
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = cornerRadius
    }
    
    func forceBeginRefreshing() {
        isAnimating = false
        startAnimating()
    }
    
    open func startAnimating() {
        guard !isAnimating else { return }
        isAnimating = true
        applyProgressAnimations()
    }
    
    open func stopAnimating(completion: (() -> Void)? = nil) {
        guard isAnimating else { return }
        isAnimating = false
        removeProgressAnimations()
        completion?()
    }
    
    // MARK: - Private

    private func applyProgressAnimations() {
        applyFirstComponentAnimations(to: firstProgressComponent)
        applySecondComponentAnimations(to: secondProgressComponent)
    }

    private func applyFirstComponentAnimations(to layer: CALayer) {
        let strokeEndAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.values = [0, 1]
        strokeEndAnimation.keyTimes = [0, NSNumber(value: 1.2 / animationDuration)]
        strokeEndAnimation.timingFunctions = [CAMediaTimingFunction(name: .easeOut),
                                              CAMediaTimingFunction(name: .easeOut)]

        let strokeStartAnimation = CAKeyframeAnimation(keyPath: "strokeStart")
        strokeStartAnimation.values = [0, 1.2]
        strokeStartAnimation.keyTimes = [NSNumber(value: 0.25 / animationDuration),
                                         NSNumber(value: 1.8 / animationDuration)]
        strokeStartAnimation.timingFunctions = [CAMediaTimingFunction(name: .easeIn),
                                                CAMediaTimingFunction(name: .easeIn)]

        [strokeEndAnimation, strokeStartAnimation].forEach {
            $0.duration = animationDuration
            $0.repeatCount = .infinity
        }

        layer.add(strokeEndAnimation, forKey: "firstComponentStrokeEnd")
        layer.add(strokeStartAnimation, forKey: "firstComponentStrokeStart")

    }

    private func applySecondComponentAnimations(to layer: CALayer) {
        let strokeEndAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.values = [0, 1.1]
        strokeEndAnimation.keyTimes = [NSNumber(value: 1.375 / animationDuration), 1]

        let strokeStartAnimation = CAKeyframeAnimation(keyPath: "strokeStart")
        strokeStartAnimation.values = [0, 1]
        strokeStartAnimation.keyTimes = [NSNumber(value: 1.825 / animationDuration), 1]

        [strokeEndAnimation, strokeStartAnimation].forEach {
            $0.timingFunctions = [CAMediaTimingFunction(name: .easeOut),
                                  CAMediaTimingFunction(name: .easeOut)]
            $0.duration = animationDuration
            $0.repeatCount = .infinity
        }

        layer.add(strokeEndAnimation, forKey: "secondComponentStrokeEnd")
        layer.add(strokeStartAnimation, forKey: "secondComponentStrokeStart")
    }

    private func removeProgressAnimations() {
        progressComponents.forEach { $0.removeAllAnimations() }
    }

}
