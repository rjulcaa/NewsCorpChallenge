//
//  PhotoRouter.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 6/07/22.
//

import UIKit

class PhotoPresenterRouter: PresenterRouter {
    
    static func createModule() -> PhotoListViewController {
        let rootController = PhotoListViewController(
            presenter: PhotoListPresenterImp(
                interactor: FetchPhotosInteractorImp(service: PhotosServiceImp()),
                router: PhotoPresenterRouter()))
        return rootController
    }
    
    func presentPhotoDetailViewController(with navigationConroller: UINavigationController?, photo: PhotoModel) {
        let view = PhotoDetailViewController(photo: photo)
        navigationConroller?.present(view, animated: true)
    }
    
}
