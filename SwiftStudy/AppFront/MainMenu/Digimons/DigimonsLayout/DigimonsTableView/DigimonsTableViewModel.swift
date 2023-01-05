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
    private var storedDigimons: Digimons = []
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
            self.storedDigimons = digimons
        }
    }
    func filter(name: String?) {
        digimons = storedDigimons
        if let text = name, text != "" {
            digimons = digimons.filter{$0.name?.contains(text.capitalized) ?? false}
        }
    }
    func filter(level: String?) {
        digimons = storedDigimons
        if let text = level, text != "" {
            digimons = digimons.filter{$0.level?.contains(text.capitalized) ?? false}
        }
    }
}
