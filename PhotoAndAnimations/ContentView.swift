//
//  ContentView.swift
//  PhotoAndAnimations
//
//  Created by Konstantin Loginov on 11/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            HStack {
                if CameraView.isAvailable {
                    Button {
                        showingImagePicker = true
                    } label: {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 80.0, height: 80.0)
                    }
                }
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 80.0, height: 80.0)
                }
            }

            Text("Hello, world!")
            LoadingIndicator(name: "blender")
                .frame(width: 250, height: 250)
        }
        .sheet(isPresented: $showingImagePicker) {
            CameraView { image in
                self.image = image
                self.showingImagePicker = false
            }
        }

    }
}
