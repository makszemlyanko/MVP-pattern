//
//  Person.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
