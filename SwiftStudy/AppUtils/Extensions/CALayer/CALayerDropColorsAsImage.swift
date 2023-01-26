//
//  CALayerDropColorsAsImage.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/01/23.
//

import UIKit

extension CALayer {
    func dropColorsAsImage() -> UIImage {
        UIGraphicsBeginImageContext(bounds.size)
        render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return UIImage()}
        UIGraphicsEndImageContext()
        return image
    }
}
