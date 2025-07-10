//
//  ContentView.swift
//  Todolist
//
//  Created by Adam Remøy on 10/07/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  @Query var todoList: [Todo]
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(todoList) { task in
            Text(task.title)
          }
        }
        .navigationTitle("Todolist")
      }
    }
}

#Preview {
    ContentView()
}
