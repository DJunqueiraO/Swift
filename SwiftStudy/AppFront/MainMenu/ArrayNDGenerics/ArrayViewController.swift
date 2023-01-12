//
//  ArrayViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 21/12/22.
//

import UIKit

final class ArrayViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ExampleLoginView()
        view.backgroundColor = .red
    }
    func exercicesWithArrays() {
        let arrayExercices = ArrayExercices()
        arrayExercices.exerciceII()
    }
    func exercicesWithGenerics() {
        create(car: BMW())
        APICaller.shared.get(Digimons.self, from: .digimonApi) {digimons in
            print(digimons)
        }
    }
    func create<T: Object>(car: T) {}
}
