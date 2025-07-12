//
//  TodolistApp.swift
//  Todolist
//
//  Created by Adam Remøy on 10/07/2025.
//

import SwiftUI

@main
struct TodolistApp: App {
    var body: some Scene {
        WindowGroup {
          RootVeiw()
        }
        .modelContainer(for: Todo.self)
    }
}
