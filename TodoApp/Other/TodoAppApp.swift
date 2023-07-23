//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Greg on 2023-07-21.
//
import FirebaseCore
import SwiftUI


@main
struct TodoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
