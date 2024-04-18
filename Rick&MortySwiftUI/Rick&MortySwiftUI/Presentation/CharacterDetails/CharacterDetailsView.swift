//
//  CharacterDetailsView.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import SceneKit
import SwiftUI

struct CharacterDetailsView: View {
    
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if let details = viewModel.characterDetails {
                RemoteImageProvider(image: details.image)
                    .frame(height: 200)
                    .clipped()
                
                VStack(spacing: 20) {
                    VStack(spacing: 5) {
                        Text("Name")
                            .font(.system(size: 18))
                            .fontWeight(.black)
                            .foregroundColor(Color.yellowColor)
                        
                        Text(details.name)
                            .font(.system(size: 21))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        
                        HStack {
                            Text(details.status.rawValue)
                                .font(.system(size: 21))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                            Text(details.gender.rawValue)
                                .font(.system(size: 21))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                        }
                    }
                }
                
                if let url = viewModel.model3DfileURL {
                    SceneView(url: url)
                }
                
                Spacer()
                
            } else {
                Text("Loading Character...")
                    .font(.system(size: 18))
                    .fontWeight(.black)
                    .foregroundColor(Color.yellowColor)
            }
        }
        .navigationBarTitle(viewModel.characterDetails?.name ?? "Loading Character")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.blueColor)
        .onAppear() {
            viewModel.fecth()
        }
    }
}


struct SceneView: UIViewRepresentable {
    typealias UIViewType = SCNView
    typealias Context = UIViewRepresentableContext<SceneView>
    let url: URL

    func updateUIView(_ uiView: UIViewType, context: Context) {}
    func makeUIView(context: Context) -> UIViewType {
        let view = SCNView()
        view.backgroundColor = UIColor.clear
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.scene = try? SCNScene(url: url)
        return view
    }
}
