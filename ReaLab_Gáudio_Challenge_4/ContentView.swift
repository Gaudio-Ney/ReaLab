//
//  ContentView.swift
//  ReaLab_Gáudio_Challenge_4
//
//  Created by Gáudio Ney on 28/09/20.
//

import SwiftUI
import RealityKit
import ARKit
import SceneKit

struct ContentView : View {
    
    @State private var message = "Unshaken"
    @State private var isPlacementEnabled = false
    @State private var selectedModel:String?
    @State private var modelConfirmedForPlacement:String?
    @State private var showingAlert = false
    @State private var boneSelected = false
    @State private var eggSelected = false
    @State private var coffeSelected = false
    
    var models:[String] = ["bone", "coffe", "egg"]
    
    let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
    
    var body: some View {
       VStack (alignment: .leading){
        Text("1 - Selecione e posicione todos os três objetos abaixo.").font(.system(size: 20.0))
        Text("2 - Sacuda o iPhone para misturá-los.").font(.system(size: 20.0))
        Text("3 - Clique na garrafa para aplicar a mistura e veja o resultado!").font(.system(size: 20.0))
            ZStack(alignment: .bottom){
                //View principal de realidade aumentada
                ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement,showingAlert: $showingAlert,boneSelected: $boneSelected, eggSelected: $eggSelected, coffeSelected: $coffeSelected, arView: arView).edgesIgnoringSafeArea(.all)
                //View de controle de chacoalhar
                ShakableViewRepresentable(arView: arView).allowsHitTesting(false)
                
                if self.isPlacementEnabled {
    //                //Coloca os Objetos 3D na cena em AR
                    PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement, showingAlert: $showingAlert)
                }
                else{
                    //View que cria scrollview de modelos
                    ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, models: self.models)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
