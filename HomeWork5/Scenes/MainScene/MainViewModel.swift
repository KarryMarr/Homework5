//
//  MainViewModel.swift
//  HomeWork5
//
//  Created by Karina Blinova on 24.02.2025.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var selectedType: CameraType = .mast
    @Published var data: [MainModel] = []
    @Published var favoriteImages = [String]()
    var favoriteButtonOrigin: CGPoint = .zero
    var favoriteButtonSize: CGSize = .zero
    var nextPage = 1
    let photoService = PhotoService()
    
    @MainActor func fetchPhotos(isCameraTypeChanged: Bool) {
        Task {
            if isCameraTypeChanged {
                data.removeAll()
                nextPage = 1
            }
            let photos = await photoService.getPhotos(page: nextPage, camera: selectedType.rawValue)
            photos.forEach { photo in
                let secureImageUrl = photo.img_src.replacingOccurrences(of: "http://", with: "https://")
                data.append(MainModel(
                    image: secureImageUrl,
                    cameraName: photo.camera.full_name,
                    roverName: photo.rover.name,
                    earthDate: photo.earth_date))
            }
            nextPage += 1
        }
    }
    
    func favoriteTapped(imageString: String) {
        if favoriteImages.contains(imageString) {
            favoriteImages.removeAll { $0 == imageString }
        } else {
            favoriteImages.append(imageString)
        }
    }
}
