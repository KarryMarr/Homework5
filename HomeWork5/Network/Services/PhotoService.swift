//
//  PhotoService.swift
//  HomeWork5
//
//  Created by Karina Blinova on 24.02.2025.
//

import Foundation

final class PhotoService {
    func getPhotos(
        page: Int,
        camera: String
    ) async -> [Photo] {
        let apiKey = "xqZQLRZoD2FA8lKwOGYjKsa6lXpqwQmkSUbJSt8h"
        let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=\(page)&camera=\(camera)&api_key=\(apiKey)")
        guard let url else { return [] }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(PhotoModel.self, from: data).photos
        } catch {
            print("Error: \(error)")
            return []
        }
    }
}
