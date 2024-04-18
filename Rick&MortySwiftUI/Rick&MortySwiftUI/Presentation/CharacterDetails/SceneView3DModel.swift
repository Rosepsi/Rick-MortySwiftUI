//
//  SceneView3DModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 19/4/24.
//

import SceneKit
import SwiftUI

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
