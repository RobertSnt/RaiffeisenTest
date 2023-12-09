//
//  UserModel.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import Foundation


struct UserModel {
    let id: String
    let firstName: String
    let secondName: String
    let email: String
    var imageUrl: String
    let isFavorite: Bool
    
    init(user: APIUserModel) {
        self.id = UUID().uuidString
        self.firstName = user.name.first
        self.secondName = user.name.last
        self.email = user.email
        self.imageUrl = user.picture.thumbnail
        self.isFavorite = false
    }
}
