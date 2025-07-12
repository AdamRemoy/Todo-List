//
//  Task.swift
//  Todolist
//
//  Created by Adam Remøy on 10/07/2025.
//

import SwiftData
import SwiftUI

@Model
class Todo: Identifiable {
  var id = UUID()
  var title: String
  var details: String
  var priority: String
  
  init(title: String, details: String, priority: String) {
    self.title = title
    self.details = details
    self.priority = priority
  }
}
