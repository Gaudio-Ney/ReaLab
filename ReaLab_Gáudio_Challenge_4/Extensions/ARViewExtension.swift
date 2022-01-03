//
//  ARViewExtension.swift
//  ReaLab_Gáudio_Challenge_4
//
//  Created by Gáudio Ney on 28/09/20.
//

import Foundation
import RealityKit
import ARKit
import SwiftUI

extension ARView {
    
    func enableTapGesture(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap (recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap (recognizer: UITapGestureRecognizer) {
        
        let tapLocation = recognizer.location(in: self)
                
        guard let rayResult = self.ray(through: tapLocation) else {return}
        
        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
        
        
        if let firtResult = results.first{
            
            //RayCast encontrou um objeto AR.
            //Colocar um objeto no topo do objeto encontrado.
            let position = firtResult.position
            trocaGarrafa(at: position)
        }
        else {
            
            //Não encontrou um objeto AR no local tocado.
            //Colocar um objeto novo.
            //let arView = ARView()
            
            let result = self.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .any)
            
            if let firtResult = result.first{
                let position = simd_make_float3 (firtResult.worldTransform.columns.3)
                trocaGarrafa(at: position)
            }
            
        }
    }
    
    func trocaGarrafa (at position: SIMD3<Float>){
        
        let ferrugem = self.scene.findEntity(named: "rust")
        ferrugem?.isEnabled = true
        let garrafa = self.scene.findEntity(named: "bottle")
        garrafa?.isEnabled = false
    }
    func putBottle (){
        //let bottleAnchor = try? Experience.loadBox()
        let fileName = "metalbottle"+".usdz"
        let modelEntity = try! ModelEntity.loadModel(named: fileName)
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(modelEntity)
        anchorEntity.name = "garrafaDeMetal"
        self.scene.anchors.removeAll()
        self.scene.addAnchor(anchorEntity)
    }
    
    func putObjects (){
//        self.scene.anchors.removeAll()
        //let world = try! Experience.loadWorld()
        let garrafa = self.scene.findEntity(named: "bottle")
        garrafa?.isEnabled = true
        let osso = self.scene.findEntity(named: "bone")
        osso?.isEnabled = false
        let ovo = self.scene.findEntity(named: "egg")
        ovo?.isEnabled = false
        let cafe = self.scene.findEntity(named: "coffe")
        cafe?.isEnabled = false
        
//        let alert = UIAlertController(title: "É hora da ação!", message: "Clique na garrafa para aplicar a solução que você misturou.", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: nil))
//        alert.present(alert, animated: true)
    }
    
    func enableObjectRemoval (){
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
        self.addGestureRecognizer(longPressGestureRecognizer)
    }
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer){
        let location = recognizer.location(in: self)
        
        if let entity = self.entity(at: location){
            if let anchorEntity = entity.anchor{
                anchorEntity.removeFromParent()
            }
        }
    }
}
