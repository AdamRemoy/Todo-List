//
//  Task.swift
//  Todolist
//
//  Created by Adam Remøy on 10/07/2025.
//

import SwiftData
import SwiftUI

@Model
class Todo {
  var id: UUID
  var title: String
  
  init(id: UUID, title: String) {
    self.id = id
    self.title = title
  }
}
