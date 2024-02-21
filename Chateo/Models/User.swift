//
//  User.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit

struct User {
    let id: Int
    let name: PersonNameComponents
    let photo: UIImage?
    let isOnline: Bool
    let hasUnread: Bool
    let lastSeen: String
    
    init(id: Int, name: PersonNameComponents, photo: UIImage? = nil) {
        self.id = id
        self.name = name
        let random = Bool.random()
        self.isOnline = random
        self.lastSeen = {
            guard !random else { return String(localized: "Online") }
            return Self.statuses.randomElement() ?? ""
        }()
        self.photo = photo
        self.hasUnread = Bool.random()
    }
}

// MARK: - Examples
extension User {
    static let statuses = [
        "Last seen yesterday",
        "Last seen 3 hours ago",
        "Last seen 30 minutes ago"
    ]
    
    static let users = [User(id: 0, name: PersonNameComponents(givenName: "Daniil", familyName: "Rassadin")),
                        User(id: 1, name: PersonNameComponents(givenName: "Athalia", familyName: "Putri"), photo: UIImage(named: "Athalia")),
                        User(id: 2, name: PersonNameComponents(givenName: "Erlan", familyName: "Sadewa"), photo: UIImage(named: "Erlan")),
                        User(id: 3, name: PersonNameComponents(givenName: "Aziz", familyName: "Petrov")),
                        User(id: 4, name: PersonNameComponents(givenName: "Aida", familyName: "Shydi")),
                        User(id: 5, name: PersonNameComponents(givenName: "Midala", familyName: "Huera"), photo: UIImage(named: "Midala")),
                        User(id: 6, name: PersonNameComponents(givenName: "Alisher", familyName: "Pushkov")),
                        User(id: 7, name: PersonNameComponents(givenName: "Nafisa", familyName: "Gitari"), photo: UIImage(named: "Nafisa")),
                        User(id: 8, name: PersonNameComponents(givenName: "Raki", familyName: "Devon")),
                        User(id: 9, name: PersonNameComponents(givenName: "Salsabila", familyName: "Akira"))]
}
