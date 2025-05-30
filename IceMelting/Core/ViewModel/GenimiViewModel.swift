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
        // MARK: - If using the codes, pls replace this API with your own one, tyty!!
        let apiKey = "AIzaSyDgEIHQ5yaNp4G1eB6MLmZ8bLH29pPFNO0"

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
                    Part(text: "You are an advisor for university students studying in Australia. Provide actionable, friendly suggestions to help a student make friends on campus—covering strategies like joining clubs, initiating conversations, and attending events. Reply in a clear and concise tone.")

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
