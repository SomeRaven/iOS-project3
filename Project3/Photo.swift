//
//  Photo.swift
//  Project3
//
//  Created by Kyleigh Hill  on 11/12/24.
//

import Foundation

class Photo: Codable{
    let title: String
    let dateTaken: Date
    let description: String
    let remoteUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case title
        case remoteUrl = "url"
        case description = "explanation"
        case dateTaken = "date"
    }
    
}
extension Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        // Two Photos are the same if they have the same photoID
        return lhs.title == rhs.title
    }
}
