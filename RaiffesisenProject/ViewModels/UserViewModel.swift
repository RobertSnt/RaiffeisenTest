//
//  UserViewModel.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import Foundation

final class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    
    public func prepareData() {
        DispatchQueue.main.async {
            NetworkingManager.shared.fetchData { result in
                switch result {
                case .success(let data):
                    self.users = data.results.map{ UserModel(user: $0)}
                    for user in self.users {
                        NetworkingManager.shared.fetchingImages(for: user.firstName, imageURL: user.imageUrl) { result in
                            switch result {
                            case .success(_):
                                print("Succes")
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
}
