//
//  NetworkRead.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 28/12/22.
//

import Foundation

extension Network {
    static func read<T: Codable>(_ what: T.Type, from file: String, type: String = "json") -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: type) else {
            print("ERROR: File not found"); return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {print("ERROR: \(error)"); return nil}
    }
}
