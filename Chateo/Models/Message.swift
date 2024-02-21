//
//  Message.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import Foundation

struct Message {
    let fromUser: User
    let text: String
    let numberOfUnreadMessages: UInt
    
    init(fromUser: User, text: String) {
        self.fromUser = fromUser
        self.text = text
        numberOfUnreadMessages = UInt.random(in: 0...3)
    }
}

// MARK: - Examples
extension Message {
    static let example = [
        Message(fromUser: User.users[2], text: "Good morning, did you sleep well?"),
        Message(fromUser: User.users[9], text: "How is it going?"),
        Message(fromUser: User.users[3], text: "Aight, noted")
    ]
}
