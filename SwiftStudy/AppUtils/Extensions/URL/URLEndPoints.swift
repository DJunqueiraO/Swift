//
//  EndPoints.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import Foundation

extension URL {
    static var digimonApi: URL? {URL(string: "https://digimon-api.vercel.app/api/digimon")}
    static func digimonApi(name: String) -> URL? {
        return URL(string: "https://digimon-api.vercel.app/api/digimon/name/\(name)")
    }
    static func digimonApi(level: String) -> URL? {
        return URL(string: "https://digimon-api.vercel.app/api/digimon/level/\(level)")
    }
}
