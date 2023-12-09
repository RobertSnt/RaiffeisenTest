//
//  NetworkManager.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import Foundation

enum ApiErrors: Error {
    case urlNotValid
    case dataNotFound
    case decodingError
    case apiCallError
}

enum ImageErrors: Error {
    case invalidURL
    case downloadFailed
    case imageExists
}

final class NetworkingManager {
    static let shared = NetworkingManager()
    
    typealias ApiCompletionHandler = (Result<ResponseModel,ApiErrors>) -> Void
    typealias ImageCompletionHandler = (Result<URL,ImageErrors>) -> Void
    
    private let url = "https://randomuser.me/api/?page=0&results=20&seed=abc"
    
    func fetchData(completion: @escaping ApiCompletionHandler) {
        guard let apiURL = URL(string: url) else {
            completion(.failure(.urlNotValid))
            return
        }
        
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard error == nil else {
                completion(.failure(.apiCallError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ResponseModel.self,from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchingImages(for user: String, imageURL: String, completion: @escaping ImageCompletionHandler) {
        guard let imageUrl = URL(string: imageURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        DispatchQueue.global().async {
            do {
                let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                let fileName = "\(user)_image.jpg"
                let fileURL = documentsDirectory.appendingPathComponent(fileName)
                
                if FileManager.default.fileExists(atPath: fileURL.path) {
                    completion(.success(fileURL))
                    return
                }
                
                let imageData = try Data(contentsOf: imageUrl)
                try imageData.write(to: fileURL)
                completion(.success(fileURL))
            } catch {
                completion(.failure(.downloadFailed))
            }
        }
    }
}
