//
//  Model.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import Foundation

/**
    This is PhotoModelResponse documentation.
    This struct represents the Entity Photo that comes from the server

*/
struct PhotoModelResponse: Codable {
    
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
    
}
