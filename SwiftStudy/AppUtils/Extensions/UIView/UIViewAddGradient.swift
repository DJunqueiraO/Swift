//
//  UIViewAddGradient.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 25/01/23.
//

import UIKit

extension UIView {
    func addGradient(_ colors: [CGColor?]) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors as [Any]
//        layer.insertSublayer(gradient, at: 0)
        backgroundColor = UIColor(patternImage: gradient.dropColorsAsImage())
    }
}

extension CAGradientLayer {
    func dropColorsAsImage() -> UIImage {
        UIGraphicsBeginImageContext(bounds.size)
        render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return UIImage()}
        UIGraphicsEndImageContext()
        return image
    }
}
