//
//  NetworkDecode.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 28/12/22.
//

import Foundation

extension Network {
    static func decode<T: Codable>(_ model: T.Type, from data: Data) -> T? {
        do {
            return try JSONDecoder().decode(model.self, from: data)
        } catch {print("ERROR: \(error): \(String(data: data, encoding: .ascii) ?? "?")"); return nil}
    }
}
