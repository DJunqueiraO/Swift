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
        backgroundColor = UIColor(patternImage: gradient.dropColorsAsImage())
    }
}
