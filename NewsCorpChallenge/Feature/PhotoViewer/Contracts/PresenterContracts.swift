//
//  PresenterContracts.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 6/07/22.
//

import Foundation
import UIKit

// MARK: Presenter Contract
protocol PhotoListPresenter {
    
    /// Use this method to fetch photos from the designated data source
    func fetchPhotos()
    
    /// Use this method to asign the view reference to the presenter
    /// - Parameters:
    ///  - view: Delegate the executes functions from the View layer
    func attachView(_ view: PhotoListView)
    
    /// Use this method to present a detail viewcontroller of a photo model from the presenter
    /// - Parameters:
    ///  - navigationController: Navigation controller reference
    ///  - photo: Intance of a photo model
    func presentPhotoDetail(with navigationController: UINavigationController?, photo: PhotoModel)
    
}

// MARK: View Contract
protocol PhotoListView: AnyObject {
    
    /// This function loads the data from the presenter to the View layer
    /// - Parameters:
    ///  - photos: Array of photos needed to refresh the list of photos
    func loadData(with photos: [PhotoModel])
    
    /// Use this method to show a native alert controller
    /// - Parameters:
    ///  - title: Title of the alert
    ///  - message: Message body of the alert
    func showErrorAlert(with title: String?, message: String?)
    
}

// MARK: Router Contract
protocol PresenterRouter: AnyObject {
    
    /// Use this method create an instance of the rootController PhotoListViewController
    /// - Returns: Instance of  PhotoListViewController
    static func createModule()-> PhotoListViewController
    
    /// Use this method to present a detail viewcontroller of a photo model from the router
    /// - Parameters:
    ///  - navigationController: Navigation controller reference
    ///  - photo: Intance of  PhotoModel
    func presentPhotoDetailViewController(with navigationController: UINavigationController?, photo: PhotoModel)
    
}

