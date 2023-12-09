//
//  APIUserModel.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import Foundation

struct APIUserModel: Codable {
    let gender: String
    let name: UserName
    let location: UserLocation
    let email: String
    let login: UserLogin
    let dob: DateOfBirth
    let registered: UserRegisterDate
    let phone: String
    let cell: String
    let id : UserId
    let picture: Picture
    let nat: String
}

struct UserName: Codable {
    let title: String
    let first: String
    let last: String
}

struct UserLogin: Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct DateOfBirth: Codable {
    let date: String
    let age: Int
}

struct UserRegisterDate: Codable {
    let date: String
    let age: Int
}

struct UserId: Codable {
    let name: String
    var value: String?
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
