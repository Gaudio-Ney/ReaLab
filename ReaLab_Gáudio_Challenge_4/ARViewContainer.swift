//
//  ARViewContainer.swift
//  ReaLab_Gáudio_Challenge_4
//
//  Created by Gáudio Ney on 28/09/20.
//

import Foundation
import RealityKit
import SwiftUI
import ARKit

class ArData: ObservableObject {
    
    static var instance = ArData()
}

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var modelConfirmedForPlacement:String?
    @Binding var showingAlert:Bool
    @Binding var boneSelected:Bool
    @Binding var eggSelected:Bool
    @Binding var coffeSelected:Bool

    var world: Experience.World = try! Experience.loadWorld()
    
//    @State var vamoDeOsso:Bool = false
//    @State var vamoDeOvo:Bool = false
//    @State var vamoDeCafe:Bool = false
    
    let arView:ARView
    
    func makeUIView(context: Context) -> ARView {
        //Chama a função referente a arView que habilita o reconhecimento de toque na tela.
        arView.enableTapGesture()
        arView.enableObjectRemoval()
        //Cria-se a variável config que carregará as atribuições da cena AR criada.
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        //Roda a ArView com base nas configurações estabelecidas anteriormente.
        arView.session.run(config)
        
        self.world.bottle?.isEnabled = false
        self.world.bone!.isEnabled = false
        self.world.egg!.isEnabled = false
        self.world.coffe!.isEnabled = false
        self.world.rust!.isEnabled = false
        arView.scene.anchors.append(world)
        
//        vamoDeOsso = ((self.world.bone?.isEnabled) != nil)
//        vamoDeOvo = ((self.world.egg?.isEnabled) != nil)
//        vamoDeCafe = ((self.world.coffe?.isEnabled) != nil)
        
        //Retorna uma arView para a ContetView mostrar o conteúdo da ARViewConteiner.
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {

        if let modelName = self.modelConfirmedForPlacement{
            let model = arView.scene.findEntity(named: modelName)
            model?.isEnabled = true
            print("\(modelName) colocado na Realidade Aumentada.")
            checaTrue(modelName: modelName)
            //            if modelName == "bone"{
            //                //world.bone!.isEnabled = true
            //                let bone = arView.scene.findEntity(named: modelName)
            //                bone?.isEnabled = true
            //                print("\(modelName) colocado na Realidade Aumentada.")
            //            }
            //            else if modelName == "coffe"{
            //                //world.coffe!.isEnabled = true
            //                let coffe = arView.scene.findEntity(named: modelName)
            //                coffe?.isEnabled = true
            //                print("\(modelName) colocado na Realidade Aumentada.")
            //            }
            //            else if modelName == "egg"{
            ////                world.egg!.isEnabled = true
            //                let egg = arView.scene.findEntity(named: modelName)
            //                egg?.isEnabled = true
            //                print("\(modelName) colocado na Realidade Aumentada.")
            //            }
            //            else{
            //                print("ERRO AO CARREGAR - Objeto não encontrado.")
            //            }
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
        }
    }
    func checaTrue(modelName:String){
        print ("Chegou na função checaTrue.")
        switch modelName {
        case "bone":
            //world.bone?.isEnabled = true
            boneSelected = true
            print ("Bone trocou para verdadeiro")
        case "coffe":
            //world.coffe?.isEnabled = true
            coffeSelected = true
            print ("Coffe trocou para verdadeiro")
        case "egg":
            //world.egg?.isEnabled = true
            eggSelected = true
            print ("Egg trocou para verdadeiro")
        default:
            print ("Objeto não selecionado ainda.")
        }
        self.showingAlert = ((boneSelected) && (coffeSelected) && (eggSelected))
        print(boneSelected, coffeSelected, eggSelected)
    }
}
