//
//  ShakableView.swift
//  ReaLab_Gáudio_Challenge_4
//
//  Created by Gáudio Ney on 28/09/20.
//

import Foundation
import SwiftUI
import RealityKit

struct ShakableViewRepresentable: UIViewControllerRepresentable {
    let arView:ARView
    func makeUIViewController(context: Context) -> ShakableViewController {
        ShakableViewController(arView: arView)
    }
    func updateUIViewController(_ uiViewController: ShakableViewController, context: Context) {}
}

class ShakableViewController: UIViewController {
    var arView:ARView!
    convenience init(arView:ARView){
        self.init()
        self.arView = arView
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        guard motion == .motionShake else { return }
        /* Do something */
        print("Shaken")
        self.arView.putObjects()
    }
}
