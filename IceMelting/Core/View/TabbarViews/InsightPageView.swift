//
//  InsightPageView.swift
//  IceMelting
//
//  Created by YUN on 2/5/2025.
//

import SwiftUI

struct InsightPageView: View {

    @StateObject private var geminiVM = GenimiViewModel()
    @State private var selectedQuestionIndex = 0
    @State private var selectedSort: SortType = .topLiked
    @State private var showChatbot = false

    enum SortType: String, CaseIterable {
        case topLiked = "Top Liked"
        case recent = "Recent"
        case myComments = "My Comments"
        case mostReacted = "Most Reacted"
    }

    let questions = [
        "How do you deal with people who can’t participate team meeting on time?",
        "How do you set boundaries when someone keeps messaging you late at night?",
        "How do you handle it when someone constantly interrupts during discussions?"
    ]

    let answers: [[(text: String, color: Color)]] = [
        [
            ("Ugh, it’s annoying sometimes ngl 😅 but I usually just message them and ask if everything's okay. Communication is key!", Color.yellow),
            ("I just leave the updates in the group chat 💬 so they can read it whenever they’re free. Flexibility helps!", Color.blue.opacity(0.3)),
            ("We had one person always late lol, so we started doing async updates too, like posting progress before meetings.", Color.pink.opacity(0.3)),
            ("Tbh I used to get frustrated 😤 but now I just adjust expectations and try to be chill. Life happens.", Color.green.opacity(0.3)),
            ("We usually record the meeting and share notes, so they can catch up later. But if it keeps happening… 👀 might need a little friendly reminder.", Color.pink.opacity(0.3)),
            ("I try to be understanding first, like maybe they have a valid reason. But if it happens a lot, we talk as a team and try to find a better time that works for everyone.", Color.blue.opacity(0.3))
        ],
        [
            ("I started putting my phone on Do Not Disturb after 10pm 😴. If it’s urgent, they’ll find another way.", Color.yellow),
            ("I just tell them straight up like ‘Hey! I’m offline at night, catch you tmr 😊’—simple and chill.", Color.blue.opacity(0.3)),
            ("Depends who it is 👀… sometimes I ignore, sometimes I reply next day.", Color.pink.opacity(0.3)),
            ("Honestly I struggle with this 😬 I don’t want to be rude, but it does mess with my sleep.", Color.green.opacity(0.3)),
            ("I changed my app settings to mute convos during sleep hours. Best decision 😌", Color.pink.opacity(0.3)),
            ("If it’s group chat stuff, I suggest we set boundaries as a team—like ‘no messages after 9 unless urgent’.", Color.blue.opacity(0.3))
        ],
        [
            ("I usually pause and say ‘Let me finish real quick 😊’—polite but firm", Color.yellow),
            ("I just go quiet and let them talk 😶… not the best way, I know lol.", Color.blue.opacity(0.3)),
            ("We started using hand-raise emojis in our online meetings 🙋 it really helped!", Color.pink.opacity(0.3)),
            ("If it keeps happening, I talk to them privately and explain how it makes me feel 😕.", Color.green.opacity(0.3)),
            ("Lowkey I just interrupt back 😂 probably not great, but I get fed up sometimes.", Color.pink.opacity(0.3)),
            ("Our tutor helped set turn-taking rules in class discussions, so everyone gets space to speak.", Color.blue.opacity(0.3))
        ]
    ]

    var body: some View {

        ZStack {
            Color.skinn.ignoresSafeArea()
            VStack(spacing: 0) {
                // Question Carousel
                TabView(selection: $selectedQuestionIndex) {
                    ForEach(0..<questions.count, id: \ .self) { index in
                        Text(questions[index])
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 100)

                // TODO: a button here to trigger the ai chatting

                Button {

                } label: {

                }

                // Page control bar
                HStack(spacing: 8) {
                    ForEach(0..<questions.count, id: \ .self) { index in
                        Circle()
                            .fill(index == selectedQuestionIndex ? Color.black : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                            .onTapGesture {
                                withAnimation {
                                    selectedQuestionIndex = index
                                }
                            }
                    }
                }
                .padding(.vertical, 8)

                // Chip Filter Tabs
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(SortType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(selectedSort == type ? Color.gray.opacity(0.2) : Color.clear)
                                        )
                                )
                                .onTapGesture {
                                    selectedSort = type
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }

                // Comments Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(sortedAnswers(), id: \.text) { answer in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(answer.text)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(answer.color)
                                    .cornerRadius(12)

                                HStack(spacing: 12) {
                                    Label("13", systemImage: "heart.fill")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                    Label("4", systemImage: "hand.thumbsup.fill")
                                        .font(.caption)
                                        .foregroundColor(.yellow)
                                    Label("6", systemImage: "face.smiling")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                            }
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 1)
                        }
                    }
                    .padding(.horizontal)
                }
            }

            // MARK: - Floating Chatbot Button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showChatbot.toggle()
                        }
                    }) {
                        Image(systemName: "brain.head.profile")
                            .resizable()
                            .frame(width: 44, height: 44)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                    .padding(.bottom, 90)
                    .padding(.trailing, 20)
                }
                if showChatbot {
                    ChatBotView(showChatbot: $showChatbot)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }

    func sortedAnswers() -> [(text: String, color: Color)] {
        switch selectedSort {
        case .topLiked: return answers[selectedQuestionIndex]
        case .recent: return answers[selectedQuestionIndex].reversed()
        case .myComments: return Array(answers[selectedQuestionIndex].prefix(2))
        case .mostReacted: return answers[selectedQuestionIndex].shuffled()
        }
    }
}



struct InsightPageView_Previews: PreviewProvider {
    static var previews: some View {
        InsightPageView()
    }
}
