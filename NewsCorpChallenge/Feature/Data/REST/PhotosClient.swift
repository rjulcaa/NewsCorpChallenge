//
//  RestClient.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 6/07/22.
//

import Foundation

// MARK: PhotosService
/// Contract of Photo data source
protocol PhotosService {
    
    /// Call this method to fetch an array of PhotoModelResponse
    ///  - Parameters:
    ///  - completion: Array of Result type PhotoModelResponse or Error
    func fetchPhotos(completion: @escaping (Result<[PhotoModelResponse], Error>) -> Void)
}

// MARK: PhotosServiceImp
// Implementation of PhotoService datasource (REST)
final class PhotosServiceImp: PhotosService {
    
    /// Reference of ClientRequest
    private let client: ClientRequest
    private let decoder = JSONDecoder()
    
    init(client: ClientRequest = ClientRequest()) {
        self.client = client
    }
    
    /// Implementation of the method fetchPhotos
    func fetchPhotos(completion: @escaping (Result<[PhotoModelResponse], Error>) -> Void)  {
        var request = URLRequest(url: URL(string: "http://jsonplaceholder.typicode.com/photos")!)
        request.httpMethod = "GET"
        client.sendRequest(with: request, completion: { data, error in
            if let data = data {
                do {
                    let response = try self.decoder.decode([PhotoModelResponse].self, from: data)
                    completion(.success(response))
                } catch {
                    print("error while decoding response")
                    completion(.failure(NetworkError.errorDecoding))
                }
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(NetworkError.generalFail))
            }
        })
    }
}

/// Error variants
enum NetworkError: Error {
    case errorDecoding
    case generalFail
}
