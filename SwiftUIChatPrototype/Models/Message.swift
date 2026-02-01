//
//  Message.swift
//  SwiftUIChatPrototype
//
//  Created by Sedef Bozkurt on 1.02.2026.
//

import Foundation

struct Message: Identifiable, Equatable {
    let id: UUID
    let text: String
    let isFromCurrentUser: Bool
    let timestamp: Date
}
