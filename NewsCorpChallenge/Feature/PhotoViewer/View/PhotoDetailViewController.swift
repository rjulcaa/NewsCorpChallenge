//
//  PhotoDetailViewController.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 6/07/22.
//

import Foundation
import UIKit
import Kingfisher

// MARK: PhotoDetailViewController
final class PhotoDetailViewController: UIViewController {
    
    /// UIImageView of the cell
    @IBOutlet private weak var image: UIImageView!
    
    /// Reference of PhotoModel entity
    var photo: PhotoModel? = nil
    
    init(photo: PhotoModel) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhoto()
    }
    
    /// Use this method to load the photo into the imageview
    private func loadPhoto() {
        image.kf.setImage(with: URL(string: photo?.url ?? ""))
    }
    
}
