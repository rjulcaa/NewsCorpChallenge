//
//  PhotoTableViewCell.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import UIKit
import Kingfisher

// MARK: PhotoTableViewCell
final class PhotoTableViewCell: UITableViewCell, CellRegistrable {
    
    @IBOutlet weak var thumbnaiUIImageView: UIImageView!
    @IBOutlet weak var photoDescriptionLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnaiUIImageView.image = nil
    }
    
    /// Use this function to setup the initial behavior a the cell after appearing in the tableview
    /// - Parameters:
    ///  - photoModel: Instance of a PhotoModel entity
    ///  
    func configure(with photoModel: PhotoModel) {
        photoDescriptionLabel.text = photoModel.title
        thumbnaiUIImageView.kf.setImage(with: URL(string: photoModel.thumbnailUrl ?? ""))
    }
    
}
