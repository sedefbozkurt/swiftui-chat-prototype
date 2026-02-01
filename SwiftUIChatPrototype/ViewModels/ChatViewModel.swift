//
//  ChatViewModel.swift
//  SwiftUIChatPrototype
//
//  Created by Sedef Bozkurt on 1.02.2026.
//

import Foundation
import Combine

final class ChatViewModel: ObservableObject {
    
    @Published private(set) var messages: [Message] = []
    
    init() {
        loadMockMessages()
    }
    
    func sendMessage(_ text: String) {
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        
        let message = Message(
            id: UUID(),
            text: text,
            isFromCurrentUser: true,
            timestamp: Date()
        )
        
        messages.append(message)
    }
    
    private func loadMockMessages() {
        messages = [
            Message(
                id:UUID() ,
                text: "Knock, knock!",
                isFromCurrentUser: false,
                timestamp: Date().addingTimeInterval(-240)
            ),
            Message(
                id: UUID(),
                text: "Who's there?",
                isFromCurrentUser: true,
                timestamp: Date().addingTimeInterval(-240)
            )
        ]
    }
}
