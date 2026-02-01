//
//  MessageBubbleView.swift
//  SwiftUIChatPrototype
//
//  Created by Sedef Bozkurt on 1.02.2026.
//

import SwiftUI

struct MessageBubbleView: View {
    
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
                bubble
            } else {
                bubble
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    private var bubble: some View {
        Text(message.text)
            .padding(13)
            .background(bubbleColor)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
            .frame(maxWidth: 260, alignment: bubbleAlignment)
    }
    
    private var bubbleColor: Color {
        message.isFromCurrentUser ? Color.blue : Color.gray.opacity(0.2)
    }
    
    private var textColor: Color {
        message.isFromCurrentUser ? .white : .primary
    }
    
    private var bubbleAlignment: Alignment {
        message.isFromCurrentUser ? .trailing : .leading
    }
}

#Preview {
    VStack(spacing: 7) {
        MessageBubbleView(
            message: Message(
                id:UUID() ,
                text: "Knock, knock!",
                isFromCurrentUser: false,
                timestamp: Date()
            )
        )
        MessageBubbleView(
            message: Message(
                id: UUID(),
                text: "Who's there?",
                isFromCurrentUser: true,
                timestamp: Date()
            )
        )
    }
}
