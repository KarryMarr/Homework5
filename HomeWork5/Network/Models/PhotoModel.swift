//
//  PhotoModel.swift
//  HomeWork5
//
//  Created by Karina Blinova on 24.02.2025.
//

struct PhotoModel: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
    let sol: Int
    let img_src: String
    let earth_date: String
    let rover: Rover
    let camera: Camera
    
    struct Rover: Codable {
        let id: Int
        let name: String
        let status: String
    }
    
    struct Camera: Codable {
        let name: String
        let full_name: String
    }
}
