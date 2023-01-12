//
//  ApiCaller.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 06/01/23.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    func get<T: Codable>(_ model: T.Type, from url: URL?, escape: @escaping (T) -> Void) {
        guard let url = url else {print("wrong url."); return}
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {print("ERROR:", error as Any); return}
            DispatchQueue.main.async {
                do {
                    escape(try JSONDecoder().decode(model, from: data))
                }
                catch {
                    print("ERROR:", error)
                }
            }
        }.resume()
    }
}
