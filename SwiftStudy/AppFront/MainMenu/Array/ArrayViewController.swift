//
//  ArrayViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 21/12/22.
//

import UIKit

final class ArrayViewController: UIViewController {
    private let arrayExercices = ArrayExercices()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        arrayExercices.exerciceII()
    }
}

