//
//  FetchPhotosInteractor.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 7/07/22.
//

import Foundation

/**
    This is FetchPhotosInteractorImp documentation.
    This class implements the protocol FetchPhotosInteractor
 
    # Methods implemented
    - execute
 
*/

final class FetchPhotosInteractorImp: FetchPhotosInteractor {
    
    // Data source reference
    private let service: PhotosService
    
    init(service: PhotosService) {
        self.service = service
    }
    
    /// Implementation of the default method
    func execute(completion: @escaping (Result<[PhotoModelResponse], Error>) -> Void) {
        service.fetchPhotos(completion: completion)
    }
    
}
