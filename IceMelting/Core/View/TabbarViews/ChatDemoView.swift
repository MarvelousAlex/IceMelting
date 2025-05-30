//
//  ContentView.swift
//  icemelting
//
//  Created by Chien Yuan Chu on 2025/5/14.
//

import SwiftUI
import AVFoundation


struct ChatDemoView: View {

    @State private var step: Int = 1
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Group {
                switch step {
                case 1:
                    MessageStepView(imageName: "Message_02_MessageView")
                case 2:
                    MessageStepView(imageName: "Message_02_MessageView-7")
                case 3:
                    MessageStepView(imageName: "Message_02_MessageView-1")
                case 4:
                    MessageStepView(imageName: "Message_02_MessageView-2")
                case 5:
                    MessageStepView(imageName: "Message_02_MessageView-3")
                case 6:
                    MessageStepView(imageName: "Message_02_MessageView-4")
                case 7:
                    MessageStepView(imageName: "Message_02_MessageView-5")
                case 8:
                    MessageStepView(imageName: "Message_02_MessageView-6")
                case 9:
                    ChatView()
                default:
                    ChatView()
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            if step < 9 {
                step += 1
            }
        }
        .onChange(of: step) { newStep in
                    switch newStep {
                    case 1:
                        playSFX(named: "hitsound")
                    case 2:
                        playSFX(named: "hitsound")
                    case 3:
                        playSFX(named: "hitsound")
                    case 6:
                        playSFX(named: "hitsound")
                    case 7:
                        playSFX(named: "hitsound")
                    case 9:
                        dismiss()
                    default:
                        break
                    }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }

    func playSFX(named soundName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
        var player: AVAudioPlayer?
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }

}

struct MessageStepView: View {
    var imageName: String

    var body: some View {
        Image(uiImage: UIImage(named: imageName) ?? UIImage())
            .resizable()
            .scaledToFill()
    }
}

struct ChatDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDemoView()
    }
}
