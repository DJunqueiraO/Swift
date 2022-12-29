//
//  CrazyGradientViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 29/12/22.
//

import UIKit

final class CrazyGradientViewController: UIViewController {
    private let gradientView = GradientView.asUIView
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension CrazyGradientViewController: Setup {
    func configure() {
        view.addSubview(gradientView)
        view.backgroundColor = .reverseDark
    }
    func constrain() {
        gradientView.enableAutoLayout
            .constraint(attributes: [.top, .trailing, .leading])
            .constraint(attribute: .height, multiplier: 0.5)
    }
}
