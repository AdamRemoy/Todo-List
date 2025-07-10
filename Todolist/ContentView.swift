//
//  ContentView.swift
//  Todolist
//
//  Created by Adam Remøy on 10/07/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  
  @Environment(\.modelContext) var modelContext
  @Query var todoList: [Todo]
  
  @State private var sheetIsVisible = false
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(todoList) { task in
          HStack {
            VStack(alignment: .leading) {
              Text(task.title)
                .font(.headline)
              if (task.detail.count > 0) {
                Text(task.detail)
                  .font(.subheadline)
              }
            }
            Spacer()
            Text(task.priority)
              .foregroundStyle(.secondary)
          }
        }
        .onDelete(perform: deleteTodo)
      }
      .navigationTitle("Todo List")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button() {
            sheetIsVisible.toggle()
          } label: {
            Image(systemName: "plus")
              .padding(5)
              .background(.blue)
              .foregroundStyle(.white)
              .clipShape(Circle())
          }
          .sheet(isPresented: $sheetIsVisible) {
            AddTodoView(task: Todo(title: "", detail: "", priority: "Medium"))
          }
        }
      }
    }
  }
  
  func deleteTodo(at offsets: IndexSet) {
    for offset in offsets {
      let todo = todoList[offset]
      modelContext.delete(todo)
    }
  }
}

#Preview {
  ContentView()
}
