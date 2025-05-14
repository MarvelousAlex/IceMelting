//
//  GenerationConfig.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/5/2025.
//


import Foundation

// Sending Data Model

struct GenerationConfig: Codable {
    let temperature: Double
    let topP: Double
    let topK: Int
    let maxOutputTokens: Int
    let responseMimeType: String
}

struct Part: Codable {
    let text: String
}

struct Content: Codable {
    let role: String
    let parts: [Part]
}

struct SystemInstruction: Codable {
    let role: String
    let parts: [Part]
}

struct GenerationData: Codable {
    let generationConfig: GenerationConfig
    let contents: [Content]
    let systemInstruction: SystemInstruction
}


// Receiving Data Model

struct GeminiResponse: Codable {
    let candidates: [Candidate]
}

struct Candidate: Codable {
    let content: CandidateContent
}

struct CandidateContent: Codable {
    let parts: [Part]
}