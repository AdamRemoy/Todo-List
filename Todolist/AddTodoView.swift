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
  
  var task: Todo
  
  @State private var title = ""
  @State private var detail = ""
  @State private var priority = "Medium"
  
  var priorityArray = ["Low", "Medium", "High"]
  
  var body: some View {
    NavigationStack {
      List {
        Section ("Todo") {
          TextField("Title", text: $title)
          TextField("Description", text: $detail)
          VStack (alignment: .leading){
            Text("Choose priority")
            Picker ("Select priority", selection: $priority) {
              ForEach(priorityArray, id: \.self) {
                Text($0)
              }
            }
            .pickerStyle(.segmented)
          }
        }
        Section {
          Button("Save") {
            let newTodo = Todo(title: title, detail: detail, priority: priority)
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
  let testTodo = Todo(title: "Test", detail: "Many details here", priority: "Medium")
  AddTodoView(task: testTodo)
}
