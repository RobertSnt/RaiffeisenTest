//
//  LocationModel.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import Foundation

struct UserLocation: Codable {
    let street: LocationStreet
    let city: String
    let state: String
    let country: String
    let postcode: StringOrInteger
    let coordinates: LocationCoordinates
    let timezone: LocationTimeZone
}

struct LocationStreet: Codable {
    let number: Int
    let name: String
}

struct LocationCoordinates: Codable {
    let latitude: String
    let longitude: String
}

struct LocationTimeZone: Codable {
    let offset: String
    let description: String
}


enum StringOrInteger: Codable {
    
    case string(String)
    case integer(Int)
    
    init(from decoder: Decoder) throws {
        if let integer = try? decoder.singleValueContainer().decode(Int.self) {
            self = .integer(integer)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw Error.couldNotFindStringOrDouble
    }
    enum Error: Swift.Error {
        case couldNotFindStringOrDouble
    }
}
