//
//  Interactor.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 19/12/22.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    func getUsers() async
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    func getUsers() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
//            print("RESPONSE:", response)
            let entities = try JSONDecoder().decode([User].self, from: data)
            presenter?.interactorDidFetchUsers(with: .success(entities))
        } catch {
            presenter?.interactorDidFetchUsers(with: .failure(error))
        }
    }
}
