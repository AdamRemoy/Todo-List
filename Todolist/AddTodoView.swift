//
//  NewTodoView.swift
//  Todolist
//
//  Created by Adam Remøy on 10/07/2025.
//

import SwiftData
import SwiftUI

struct AddTodoView: View {
  
  @Query var todoList: [Todo]
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss
  
  @State private var title = ""
  @State private var detail = ""
  @State private var priority = "Medium"
  
  var priorityArray = ["Low", "Medium", "High"]
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          TextField("Title", text: $title)
          TextField("Description", text: $detail)
          Picker ("Select priority", selection: $priority) {
            ForEach(priorityArray, id: \.self) {
              Text($0)
            }
          }
        }
        Section {
          Button("Save") {
            let newTodo = Todo(title: title, details: detail, priority: priority, status: false)
            modelContext.insert(newTodo)
            dismiss()
          }
          Button("Cancel", role: .destructive) {
            dismiss()
          }
        }
      }
      .navigationTitle("New todo")
    }
  }
}

#Preview {
  AddTodoView()
}
