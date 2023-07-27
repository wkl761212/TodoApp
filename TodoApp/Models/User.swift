//
//  User.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
