//
//  CALayerAniman.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/01/23.
//

import UIKit

extension CALayer {
    enum AnimateKeys: String {
        /// CGPoint
        case anchorPoint = "anchorPoint"
        /// CGColor?
        case backgroundColor = "backgroundColor"
        /// [CIFilter]? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case backgroundFilters = "backgroundFilters"
        /// CGColor?
        case borderColor = "borderColor"
        /// CGFloat
        case borderWidth = "borderWidth"
        /// CGRect
        case bounds = "bounds"
        /// CIFilter? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case compositingFilter = "compositingFilter"
        /// CGImage?
        case contents = "contents"
        /// CGRect
        case contentsRect = "contentsRect"
        /// CGFloat
        case cornerRadius = "cornerRadius"
        /// Bool (no default animation)
        case doubleSided = "doubleSided"
        /// __[CIFilter]? (uses default CATransition, sub-properties of filters are animated using default case CABasicAnimation)
        case filters = "filters"
        /// CGRect (!!not animatable!! use bounds and position)
        case frame = "frame"
        /// Bool
        case hidden = "hidden"
        /// CALayer?
        case mask = "mask"
        /// Bool
        case masksToBounds = "masksToBounds"
        ///Float (0 <= opacity <= 1)
        case opacity = "opacity"
        ///CGPoint
        case position = "position"
        /// CGColor?
        case shadowColor = "shadowColor"
        /// CGSize (default is (0,-3))
        case shadowOffset = "shadowOffset"
        /// Float (0 <= shadowOpacity <= 1)
        case shadowOpacity = "shadowOpacity"
        /// CGPath?
        case shadowPath = "shadowPath"
        /// CGFloat (default is 3)
        case shadowRadius = "shadowRadius"
        /// [CALayer]?
        case sublayers = "sublayers"
        /// CATransform3D
        case sublayerTransform = "sublayerTransform"
        /// CATransform3D
        case transform = "transform"
        /// CGFloat
        case zPosition = "zPosition"
    }
    @discardableResult func animate(_ key: AnimateKeys, beginTime: CFTimeInterval = 0,
                                    escape: @escaping (CABasicAnimation) -> Void) -> Self {
        let animation = CABasicAnimation(keyPath: key.rawValue)
        escape(animation)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime() + beginTime
        add(animation, forKey: key.rawValue)
        return self
    }
    @discardableResult func animate(_ key: String, beginTime: CFTimeInterval = 0,
                                    escape: @escaping (CABasicAnimation) -> Void) -> Self {
        let animation = CABasicAnimation(keyPath: key)
        escape(animation)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime() + beginTime
        add(animation, forKey: key)
        return self
    }
}
