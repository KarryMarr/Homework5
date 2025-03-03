//
//  DetailsView.swift
//  HomeWork5
//
//  Created by Karina Blinova on 02.03.2025.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            NavigationLink {
                ImageView(imageString: viewModel.data.image)
            } label: {
                AsyncImage(url: URL(string: viewModel.data.image)) { result in
                    result.image?.resizable().scaledToFit()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 600)
            Text(viewModel.data.roverName)
            Text(viewModel.data.cameraName)
            Text(viewModel.data.earthDate)
        }
    }
}
