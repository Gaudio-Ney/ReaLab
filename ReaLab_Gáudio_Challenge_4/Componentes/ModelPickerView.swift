//
//  ModelPickerView.swift
//  ReaLab_Gáudio_Challenge_4
//
//  Created by Gáudio Ney on 28/09/20.
//

import Foundation
import SwiftUI

struct ModelPickerView:View{
    
    @Binding var isPlacementEnabled:Bool
    @Binding var selectedModel:String?
    
    var models:[String]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30){
                ForEach(0 ..< self.models.count){
                    index in
                    Button(action:{ print ("O botão apertado é o: \(self.models[index])")
                            self.selectedModel = self.models[index]
                            self.isPlacementEnabled = true})
                    {
                        Image(uiImage: UIImage(named: self.models[index])!).resizable().frame(height: 80).aspectRatio(1/1, contentMode: .fit
                        ).background(Color.white).cornerRadius(12)
                    }
                }
            }
        }.padding(20).background(Color.black.opacity(0.5))
    }
    
}
