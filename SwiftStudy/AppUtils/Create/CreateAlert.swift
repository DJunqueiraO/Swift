//
//  Create+Alert.swift
//  Straightening
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension Create {
    func alert(title: String?, message: String?, cancelButtonTitle: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.baseView.subviews.first?.backgroundColor = .weakWhite
        alert.baseView.subviews.last?.removeFromSuperview()
        alert.baseView.tintColor = .label
        if let cancelButtonTitle = cancelButtonTitle {
            alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel))
        }
        return alert
    }
}
