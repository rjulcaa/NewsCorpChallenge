//
//  PhotoListPresenter.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import Foundation
import UIKit

/**
    This is PhotListPresenterImp documentation.
    This class implements the protocol PhotoListPresenter
 
    # Methods implemented
    - attachView
    - fetchPhotos
    - presentPhotoDetail

*/

final class PhotoListPresenterImp: PhotoListPresenter {
    
    // View reference
    private weak var view: PhotoListView?
    
    // Interactor reference
    private let interactor: FetchPhotosInteractor
    
    // Router reference
    private let router: PresenterRouter
    
    init(interactor: FetchPhotosInteractor,
         router: PresenterRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    /// Implementation of attackView
    func attachView(_ view: PhotoListView) {
        self.view = view
    }
    
    /// Implementation of fetchPhotos
    func fetchPhotos() {
        interactor.execute { result in
            switch result {
            case .success(let response):
                self.view?.loadData(with: response.map { PhotoModel(title: $0.title,
                                                                    url: $0.url,
                                                                    thumbnailUrl: $0.thumbnailUrl)})
            case .failure(let error):
                self.view?.showErrorAlert(with: error.localizedDescription, message: nil)
            }
        }
    }
    
    /// Implementation of attackView
    func presentPhotoDetail(with navigationConroller: UINavigationController?, photo: PhotoModel) {
        router.presentPhotoDetailViewController(with: navigationConroller, photo: photo)
    }
    
}
