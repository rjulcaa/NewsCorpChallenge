//
//  Client.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 6/07/22.
//

import Foundation

/// Class in charge of the HTTP request implementation
struct ClientRequest {
    
    /// Reference of URLSession
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    init() {
        self.init(session: URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil))
    }
    
    /// Use this function to send a HTTP request
    /// - Parameters:
    ///  - baseRequest: Reference of URLRequest
    ///  - completion: Calllback with the Result type of Data and Error, both optionals
    func sendRequest(with baseRequest: URLRequest, completion: @escaping ((Data?, Error?) -> Void)) {
        let task = self.session.dataTask(with: baseRequest) { data, response, error in
            completion(data, error)
        }
        task.resume()
    }
    
}
