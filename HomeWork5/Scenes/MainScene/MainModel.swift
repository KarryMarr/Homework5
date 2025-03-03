//
//  MainModel.swift
//  HomeWork5
//
//  Created by Karina Blinova on 24.02.2025.
//

import Foundation

struct MainModel: Identifiable {
    let id = UUID()
    var image: String
    let cameraName: String
    let roverName: String
    let earthDate: String
}

enum CameraType: String {
    case navcam, chemcam, mast
}
