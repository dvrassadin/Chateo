//
//  Message.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import Foundation

struct Chat {
    let fromUser: User
    let text: String
    let time: String
    let numberOfUnreadMessages: UInt
    
    init(fromUser: User, text: String, time: String) {
        self.fromUser = fromUser
        self.text = text
        self.time = time
        numberOfUnreadMessages = UInt.random(in: 0...3)
    }
}

// MARK: - Examples
extension Chat {
    static let example = [
        Chat(fromUser: User.users[1], text: "Good morning, did you sleep well?", time: "Today"),
        Chat(fromUser: User.users[8], text: "How is it going?", time: "17/6"),
        Chat(fromUser: User.users[2], text: "Aight, noted", time: "17/6")
    ]
}
