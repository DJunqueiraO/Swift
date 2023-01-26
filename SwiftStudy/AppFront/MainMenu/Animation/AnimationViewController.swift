//
//  AnimationViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 25/01/23.
//

import UIKit

final class AnimationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension AnimationViewController: Setup {
    func configure() {
        view.addGradient([UIColor.jokenpoPink.cgColor, UIColor.magenta.cgColor])
    }
}
