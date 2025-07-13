//
//  ListView.swift
//  Todolist
//
//  Created by Adam Remøy on 12/07/2025.
//

import SwiftData
import SwiftUI

struct ListItem: View {
  var title: String
  var description: String
  var isComplete: Bool
  
  var body: some View {
    HStack (spacing: 15) {
      if isComplete {
        Image(systemName: "checkmark.circle.fill")
          .tint(.blue)
          .font(.title)
      } else {
        Image(systemName: "circle")
          .tint(.primary)
          .font(.title)
      }
      VStack (alignment: .leading){
        Text(title)
          .font(.headline)
        Text(description)
          .font(.subheadline)
      }
    }
  }
}

struct ListView: View {
  
  @Query var todos: [Todo]
  @Environment(\.modelContext) var modelContext
  @State private var showingAddView = false
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(todos) { todo in
          Button() {
            todo.status.toggle()
          } label: {
            ListItem(title: todo.title, description: todo.details, isComplete: todo.status)
              .tint(.primary)
          }
        }
      }
      .navigationTitle("Todo")
      .sheet(isPresented: $showingAddView) {
        AddTodoView()
      }
      .toolbar {
        Button("Add", systemImage: "plus") {
          showingAddView.toggle()
        }
      }
    }
  }
}

#Preview {
  ListView()
}
