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
    }
    func constrain() {
        gradientView.enableAutoLayout
            .constraint(attributesConstants: [.top:0, .trailing:0, .leading:0, .bottom:-100])
    }
}
