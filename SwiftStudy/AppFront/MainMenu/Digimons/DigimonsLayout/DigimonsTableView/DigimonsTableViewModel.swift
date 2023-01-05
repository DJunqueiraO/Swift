//
//  DigimonsTableViewModel.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import Foundation

protocol DigimonsTableViewModelDelegate: AnyObject {
    func digimonsTableViewModelDidGetData()
}

final class DigimonsTableViewModel {
    weak var delegate: DigimonsTableViewModelDelegate? {
        didSet {
            getData()
        }
    }
    private var digimons: Digimons = [] {
        didSet {
            delegate?.digimonsTableViewModelDidGetData()
        }
    }
    lazy var getDigimon = {(index: Int) -> Digimon in
        return self.digimons[index]
    }
    var numberOfDigimons: Int {digimons.count}
    private func getData() {
        Task {
            guard let data = await Network.get(from: .digimonApi)?.data else {return}
            guard let digimons = Network.decode(Digimons.self, from: data) else {return}
            self.digimons = digimons
        }
    }
}
