//
//  GenimiViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/5/2025.
//

import Foundation

class GenimiViewModel: ObservableObject {
    @Published var MsgList: [MessageModel] = []

    public func getResponse(message: String) async {

        // API
        let apiKey = "AIzaSyC7ewYw2MKDGr8nv_AvuyrYayG5faU2Yg0"

        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=\(apiKey)") else { return }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let generationData = GenerationData(
            generationConfig: GenerationConfig(
                temperature: 1.0,
                topP: 0.95,
                topK: 64,
                maxOutputTokens: 65536,
                responseMimeType: "text/plain"
            ),
            contents: [
                Content(
                    role: "user",
                    parts: [
                        // TODO: intro here
                        Part(text: message)
                    ]
                )
            ],
            systemInstruction: SystemInstruction(
                role: "user",
                parts: [

                    // TODO: Prompt...
                    Part(text: "You are a robot that only gives advice on how to have conversation with university students. Reply in max three sentences. If anything irrelevant say I don't know")

                ]
            )
        )

        do {
            urlRequest.httpBody = try JSONEncoder().encode(generationData)
        } catch {
            print("Error encoding data")
        }

        let task = URLSession.shared.dataTask(with: urlRequest) {
            data,
            response,
            error in

            if let error = error {
                return
            }

            guard let data = data else { return }

            do {
                let geminiResponse = try JSONDecoder().decode(
                    GeminiResponse.self,
                    from: data
                )

                let newResponse = MessageModel(content: geminiResponse.candidates[0].content.parts[0].text, sender: "AI")

                self.MsgList.append(newResponse)

            } catch {
                print("Error decoding data")
            }
        }

        task.resume()
    }
}
