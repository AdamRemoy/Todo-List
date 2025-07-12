//
//  RootVeiw.swift
//  Todolist
//
//  Created by Adam Remøy on 12/07/2025.
//

import SwiftUI

struct RootVeiw: View {
    var body: some View {
      TabView {
        Tab("Todo List", systemImage: "checklist") {
          ListView()
        }
      }
    }
}

#Preview {
    RootVeiw()
}
