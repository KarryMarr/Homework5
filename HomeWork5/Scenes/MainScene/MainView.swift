//
//  MainView.swift
//  HomeWork5
//
//  Created by Karina Blinova on 24.02.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @Namespace private var animation
    
    var body: some View {
        HStack {
            Text("Посмотри фотографии с Марса!")
                .font(.title)
                .multilineTextAlignment(.center)
            NavigationLink {
                ImageView(imageString: "")
            } label: {
                Image(systemName: "heart.fill")
            }
        }
        Picker("Выберите камеру марсохода", selection: $viewModel.selectedType) {
            Text("MAST").tag(CameraType.mast)
            Text("CHEMCAM").tag(CameraType.chemcam)
            Text("NAVCAM").tag(CameraType.navcam)
        }
        .onChange(of: viewModel.selectedType, { oldValue, newValue in
            viewModel.fetchPhotos(isCameraTypeChanged: true)
        })
        .pickerStyle(.segmented)
        List(viewModel.data) { element in
            NavigationLink {
                DetailsView(viewModel: DetailsViewModel(data: element))
            } label: {
                cell(for: element)
                    .overlay {
                        cell(for: element)
                            .offset(x: viewModel.favoriteImages.contains(element.image) ? 300 : 0)
                            .offset(y: viewModel.favoriteImages.contains(element.image) ? -1000 : 0)
                            .animation(.linear(duration: 0.5), value: viewModel.favoriteImages)
                    }
            }
        }
        .listStyle(.grouped)
        .onAppear {
            viewModel.fetchPhotos(isCameraTypeChanged: false)
        }
    }
    
    func cell(for element: MainModel) -> some View {
        HStack {
            AsyncImage(url: URL(string: element.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 50)
            .clipShape(.rect(cornerRadius: 12))
            VStack(alignment: .leading) {
                Text(element.roverName)
                Text(element.earthDate)
            }
            Spacer()
            Button {
                viewModel.favoriteTapped(imageString: element.image)
            } label: {
                Image(systemName: viewModel.favoriteImages.contains(element.image) ? "heart.fill" : "heart")
            }
            .buttonStyle(.borderless)
        }
        .onAppear {
            if viewModel.data.needToLoad(item: element) {
                viewModel.fetchPhotos(isCameraTypeChanged: false)
            }
        }
    }
}
