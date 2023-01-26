//
//  AnimationViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 25/01/23.
//

import UIKit

final class AnimationViewController: UIViewController {
    private let layer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100,
                             width: 120, height: 120)
        return layer
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.layer.addSublayer(layer)
        Task {
            do {try await Task.sleep(nanoseconds: 1000000000)}
            self.layer.animate(.position) {
                $0.fromValue = CGPoint(x: self.layer.frame.origin.x + self.layer.frame.size.width/2,
                                       y: self.layer.frame.origin.y + self.layer.frame.size.height/2)
                $0.toValue = CGPoint(x: 300, y: 400)
                $0.duration = 1
            }.animate(.backgroundColor, beginTime: 1) {
                $0.fromValue = self.layer.backgroundColor
                $0.toValue = UIColor.blue.cgColor
                $0.duration = 3
            }.animate(.opacity, beginTime: 4) {
                $0.fromValue = 1
                $0.toValue = 0
                $0.duration = 3
            }
        }
    }
}

extension AnimationViewController: Setup {
    func configure() {
        view.addGradient([UIColor.jokenpoPink.cgColor,
                          UIColor.systemBlue.cgColor,
                          UIColor.magenta.cgColor])
    }
}
