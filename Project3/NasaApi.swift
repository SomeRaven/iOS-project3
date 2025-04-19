//
//  NasaApi.swift
//  Project3
//
//  Created by Kyleigh Hill on 11/12/24.
//

import Foundation

enum EndPoint: String {
    case apod = "https://api.nasa.gov/planetary/apod"
}

struct NASAAPI {
    
    private static let apiKey = "Ur2g6wodq2d7ZqM9tJeax5b6bP1UhIZzlA64HMhe"

    private static func nasaURL(endPoint: EndPoint, parameters: [String: String]?) -> URL? {
        var components = URLComponents(string: endPoint.rawValue)
        var queryItems = [URLQueryItem]()
        
        // Define the base parameters including the API key
        let baseParams = [
            "count": "100",
            "api_key": apiKey
        ]
        
        // Add base parameters as query items
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        // Add any additional parameters if provided
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components?.queryItems = queryItems
        return components?.url
    }
    
    // Public property to get the URL for the photo of the day
    static var photoOfTheDay: URL? {
        return nasaURL(endPoint: .apod, parameters: nil)
    }

    static func photos(fromJSON data: Data) -> Result<[Photo], Error> {
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)

            let photos = try decoder.decode([Photo].self, from: data)
            let Nphotos = photos.filter { $0.remoteUrl != nil }
            return .success(Nphotos)
        } catch {
            return .failure(error)
        }
    }
    
}
