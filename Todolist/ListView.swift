//
//  ListView.swift
//  Todolist
//
//  Created by Adam Remøy on 12/07/2025.
//

import SwiftUI

struct ListView: View {
    var body: some View {
      NavigationStack {
        List {
          Text("Item")
        }
        .navigationTitle("Todo")
      }
    }
}

#Preview {
    ListView()
}
