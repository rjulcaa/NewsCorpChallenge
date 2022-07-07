//
//  ServicesStubs.swift
//  NewsCorpChallengeTests
//
//  Created by Richard Julca Amaro on 6/07/22.
//

import Foundation
import UIKit

@testable import NewsCorpChallenge

class PhotoListPresenterStub: PhotoListPresenter {
    
    weak var view: PhotoListView?
    var interactorMock: FetchPhotosInteractor
    
    init(interactorMock: FetchPhotosInteractor) {
        self.interactorMock = interactorMock
    }
    
    func fetchPhotos() {
        interactorMock.execute { result in
            switch result {
            case .failure:
                self.view?.showErrorAlert(with: "", message: "")
            case .success:
                self.view?.loadData(with: [])
            }
        }
    }
    
    func attachView(_ view: PhotoListView) {
        self.view = view
    }
    
    func presentPhotoDetail(with navigationConroller: UINavigationController?, photo: PhotoModel) {
        
    }
    
    
}

class PhotoListViewControllerStub: PhotoListView {
    
    var photosLoadedFromServer: Bool = false
    var errorAtLoadingFromServer: Bool = false
    
    func showErrorAlert(with title: String?, message: String?) {
        errorAtLoadingFromServer = true
    }
    
    func loadData(with photos: [PhotoModel]) {
        photosLoadedFromServer = true
    }
    
}

class SuccessFetchPhotosInteractorStub: FetchPhotosInteractor {
    
    func execute(completion: @escaping (Result<[PhotoModelResponse], Error>) -> Void) {
        completion(.success([]))
    }
    
}

class ErrorFetchPhotosInteractorStub: FetchPhotosInteractor {
    
    func execute(completion: @escaping (Result<[PhotoModelResponse], Error>) -> Void) {
        completion(.failure(NetworkError.generalFail))
    }
    
}
