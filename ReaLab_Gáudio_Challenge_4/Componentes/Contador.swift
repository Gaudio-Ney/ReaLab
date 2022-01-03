//
//  Contador.swift
//  ReaLab_Gáudio_Challenge_4
//
//  Created by Gáudio Ney on 28/09/20.
//

import Foundation
import RealityKit
import SwiftUI
import ARKit

struct Contador:View {
    
    
    @Binding var contadorOsso:Int?
    @Binding var contadorOvo:Int?
    @Binding var contadorCafe:Int?
    @Binding var modelConfirmedForPlacement:String?
    @State var showingAlert = false
    
    let modelName = modelConfirmedForPlacement
    var body: some View{
        
        if ((contadorCafe < 3) || (contadorOsso < 3) || (contadorOvo < 3)){
            if modelName == "egg"{
                contadorOvo = contadorOvo + 1
                print (contadorOvo)
            }
            if modelName == "bone" {
                contadorOsso = contadorOsso + 1
                print (contadorOsso)
            }
            else{
                contadorCafe = contadorCafe + 1
                print (contadorCafe)
                alert(isPresented: $showingAlert) {
                    Alert(title: Text("É hora de misturar!"), message: Text("Sacuda o iPhone com cuidado para misturar os objetos selecionados."), dismissButton: .default(Text("OK")))}
            }
        }
        else{
            alert(isPresented: $showingAlert) {
                Alert(title: Text("É hora de misturar!"), message: Text("Sacuda o iPhone com cuidado para misturar os objetos selecionados."), dismissButton: .default(Text("OK")))}
            self.showingAlert = true
        }
    }
}

