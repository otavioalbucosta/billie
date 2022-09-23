//
//  SliderButton.swift
//  billie
//
//  Created by Otávio Albuquerque on 14/09/22.
//

import SwiftUI
import CoreHaptics

struct SliderButton: View {
    
    @State var engine: CHHapticEngine?
    var screen: CGRect {
        get{
            UIScreen.main.bounds
        }
    }
    @State var Player: CHHapticAdvancedPatternPlayer?
    @State var translation = CGSize.zero.width
    @State var success = false
    @State var intensity: Float = 0.8
    @State var sharpness: Float = 0.0
    
    
    var body: some View {
        GeometryReader{ geometry in
            HStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 100, style: .continuous)
                        .foregroundColor(.clear).opacity(0.1)
                        .frame(height: 80, alignment: .center)
                    .overlay {
                        RoundedRectangle(cornerRadius: 100, style: .continuous)
                            .stroke(lineWidth: 4).opacity(0.1)
                            .shadow(color: .gray, radius: 3, x: -3, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 80))
                            .shadow(color: .gray, radius: 3, x: -2, y: 5 )
                            .clipShape(RoundedRectangle(cornerRadius: 80))
                    }
                    
                    SwipeButton(translation: $translation, sucess: $success)
                        .animation(.linear(duration: 0.1),value: self.translation)
                        .gesture(DragGesture().onChanged({ value in
                            startPlayer()
                            if(value.translation.width < 0){
                                self.translation = CGSize.zero.width
                                self.success = false
                                
                            }else {
                                if(value.translation.width > screen.width - 150) {
                                    self.translation = geometry.size.width - 100
                                    sharpness = 0.8
                                    dynamicPattern()
                                    self.success = true
                                }else{
                                    self.translation = value.translation.width
                                    sharpness = Float(self.translation) / 300
                                    print(sharpness)
                                    dynamicPattern()
                                }
                            }
                            
                        })
                            .onEnded({ value in
                                if(value.translation.width < screen.width - 150) {
                                    self.translation = CGSize.zero.width
                                    self.success = false
                                    stopPlayer()
                                }else{
                                    self.translation = geometry.size.width - 100
                                    self.success = true
                                    stopPlayer()
                                    let hapSuccess = UINotificationFeedbackGenerator()
                                    hapSuccess.notificationOccurred(.success)
                                }
                                
                            })
                        )
                        
                }.onAppear{
                    prepareHaptics()
                }
            }.frame(height: 80, alignment: .center)

        }.frame(height: 80, alignment: .center)
                
    }
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
            playerCreate()
        }catch {
            print(error)
        }
    }
    func playerCreate() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return }
        
        let normalIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5)
        let normalSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0)
        
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [normalIntensity,normalSharpness], relativeTime: 0, duration: 0.1)
        do{
            let pattern =  try CHHapticPattern(events: [event], parameters: [])
            self.Player =  try engine?.makeAdvancedPlayer(with: pattern)
        }catch{
            print(error)
        }


    }
    func dynamicPattern() {

        var dynamicSharpness = CHHapticDynamicParameter(parameterID: .hapticSharpnessControl, value: sharpness, relativeTime: 0)
        do{
            try Player?.sendParameters([dynamicSharpness], atTime: CHHapticTimeImmediate)
        }catch{
            print(error)
        }
    }
    func startPlayer(){
        do{
            try Player?.start(atTime: CHHapticTimeImmediate)
        }catch{
            print(error)
        }
    }
    func stopPlayer(){
        do{
            try Player?.stop(atTime: CHHapticTimeImmediate)
        }catch{
            print(error)
        }
    }
}

struct SwipeButton: View {
    
    @Binding var translation: CGFloat
    @Binding var sucess : Bool
    var body: some View {
        ZStack(alignment: .trailing){
            
            Color.accentColor
                .frame(width: 100 + translation, height: 80, alignment: .center)
                .mask({
                    RoundedRectangle(cornerRadius: 60, style: .circular)
                })
                .overlay(alignment: .trailing) {
                    Image(systemName: "ruler").font(.custom( "grande", size: 50))
                        .foregroundColor(.white)
                        .padding()
                        .opacity(self.sucess ? 0 : 1)

                    Image(systemName: "ruler.fill").font(.custom( "grande", size: 50))
                        .foregroundColor(.white)
                        .padding()
                        .opacity(self.sucess ? 1 : 0)
                }
                
        }
    }
}

struct SliderButton_Previews: PreviewProvider {
    static var previews: some View {
        SliderButton()
    }
}
