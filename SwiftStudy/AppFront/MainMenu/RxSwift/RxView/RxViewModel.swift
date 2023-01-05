//
//  RxViewModel.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/12/22.
//

import UIKit
import RxSwift
import RxCocoa

struct RxViewModel {
    private let choses = [Chose(name: "Stone", image: "0"),
                          Chose(name: "Paper", image: "1"),
                          Chose(name: "Scissors", image: "2"),
                          Chose(name: "Lizard", image: "3"),
                          Chose(name: "Spok", image: "4")]
    lazy var items = Observable.just(choses)
    var numberOfItems: Int {choses.count}
    let disposeBag = DisposeBag()
}
