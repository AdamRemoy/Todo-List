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
  var detail: String
  var priority: String
  
  init(title: String, detail: String, priority: String) {
    self.title = title
    self.detail = detail
    self.priority = priority
  }
}
