//
//  VariablesViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 12/01/23.
//

import UIKit

final class Exercice_1ViewController: UIViewController {
    private let label = Create.element.label("Hello, World")
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension Exercice_1ViewController: Setup {
    func configure() {
        view.backgroundColor = .lightGray
        view.addSubview(label)
    }
    func constrain() {
        label.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
    }
}
