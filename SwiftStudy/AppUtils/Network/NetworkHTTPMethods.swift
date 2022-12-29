//
//  Network.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import Foundation

extension Network {
    struct Result {
        let data: Data, response: String
    }
    static func get(from url: URL?) async -> Result? {
        guard let url = url else {print("ERROR: Wrong url"); return nil}
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return Result(data: data, response: "RESPONSE: \(response)")
        } catch {print("ERROR: \(error)"); return nil}
    }
    static func post<T: Codable>(_ model: T, from url: URL?) {
        guard let url = url else {print("ERROR: Wrong url"); return}
        let request = {(data: Data) -> URLRequest in
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            return request
        }
        do {
            let data = try JSONEncoder().encode(model)
            URLSession.shared.dataTask(with: request(data)).resume()
        } catch {print("ERROR: \(error)"); return}
    }
    static func put<T: Codable>(_ model: T, from url: URL?) async -> Result? {
        guard let url = url else {print("ERROR: Wrong url"); return nil}
        let request = {(data: Data) -> URLRequest in
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            return request
        }
        do {
            let (data, response) = try await URLSession.shared.data(
                for: request(try JSONEncoder().encode(model))
            )
            return Result(data: data, response: "\(response)")
        } catch {print("ERROR: \(error)"); return nil}
    }
}
