//
//  PlacementButtonsView.swift
//  ReaLab_Gáudio_Challenge_4
//
//  Created by Gáudio Ney on 28/09/20.
//

import Foundation
import SwiftUI

struct PlacementButtonsView:View {
    
    @Binding var isPlacementEnabled:Bool
    @Binding var selectedModel:String?
    @Binding var modelConfirmedForPlacement:String?
    @Binding var showingAlert:Bool
//    @State var contadorOsso:Int = 0
//    @State var contadorOvo:Int = 0
//    @State var contadorCafe:Int = 0
    //@State private var showingAlert = false
    
    var body:some View{
        HStack{
            Button(action: {print("Cancelou a imagem!");self.resetPlacementParameters()})
            {
                Image(systemName: "xmark").frame(width: 60, height: 60).font(.title).background(Color.red.opacity(0.75)).cornerRadius(30).padding(20)
            }
            Button(action: {
                print("Confirmou a imagem!")
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
                //self.contador()
            })
            {
                Image(systemName: "checkmark").frame(width: 60, height: 60).font(.title).background(Color.green.opacity(0.75)).cornerRadius(30).padding(20)
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))}
        }
    }
    func resetPlacementParameters(){
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
    
//    func contador (){
//
//        let modelName = modelConfirmedForPlacement
//
//        if (contadorCafe < 3){
//            if modelName == "egg"{
//                contadorOvo = contadorOvo + 1
//                print (contadorOvo)
//            }
//        }
//        if (contadorOsso < 3){
//                if modelName == "bone" {
//                    contadorOsso = contadorOsso + 1
//                    print (contadorOsso)
//                }
//        }
//        if (contadorOvo < 3){
//                if (contadorOvo < 3) {
//                    contadorCafe = contadorCafe + 1
//                    print (contadorCafe)
//                }
//            }
//         else {
//            Alert(title: Text("É hora de misturar!"), message: Text("Sacuda o iPhone com cuidado para misturar os objetos selecionados."), dismissButton: .default(Text("OK")))
//            //self.showingAlert = true
//        }
//    }
}
