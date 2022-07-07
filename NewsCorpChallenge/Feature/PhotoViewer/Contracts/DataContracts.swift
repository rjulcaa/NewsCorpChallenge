//
//  DataContracts.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 7/07/22.
//

import Foundation

// MARK: Interactor Contract
protocol FetchPhotosInteractor {
    
    /// Use this method to fetch an array of photos model from a designated data source
    /// - Parameters:
    ///  - completion: Callback with the result type of PhotoModelResponse array or an error
    func execute(completion: @escaping (Result<[PhotoModelResponse], Error>) -> Void)
    
}
