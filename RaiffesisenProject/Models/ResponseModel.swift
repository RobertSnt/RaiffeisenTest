//
//  ResponseModel.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import Foundation

struct ResponseModel: Codable {
    let results: [APIUserModel]
    let info: InfoModel
}

struct InfoModel: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
