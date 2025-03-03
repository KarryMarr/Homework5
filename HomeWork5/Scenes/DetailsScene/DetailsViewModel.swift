//
//  DetailsViewModel.swift
//  HomeWork5
//
//  Created by Karina Blinova on 02.03.2025.
//

import Foundation

final class DetailsViewModel: ObservableObject {
    @Published var data: MainModel
    
    init(data: MainModel) {
        self.data = data
    }
}
