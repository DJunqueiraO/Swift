//
//  ReduceViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/01/23.
//

import UIKit

final class ReduceViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func aggregate() {
        let numbers = [1, 2, 3, 4]
        var sum = 0
//        for number in numbers {
//            sum += number
//        }
//        sum = numbers.reduce(0) {partialResult, currentValue in
//            return partialResult + currentValue
//        }
        sum = numbers.reduce(0) {$0 + $1}
        view = UIStackView(arrangedSubviews: [Create.element.label("\(sum)", textAlignment: .center)])
        view.backgroundColor = .jokenpoPink
    }
}

extension ReduceViewController: Setup {
    func configure() {
        aggregate()
    }
}
