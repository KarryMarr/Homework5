//
//  ImageView.swift
//  HomeWork5
//
//  Created by Karina Blinova on 02.03.2025.
//

import SwiftUI

struct ImageView: View {
    @State var imageString: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageString)) { result in
            result.image?
                .resizable()
                .scaledToFill()
        }
    }
}
