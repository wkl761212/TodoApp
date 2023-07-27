//
//  TodoListViewViewModel.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//

//

import Foundation

// ViewModel for list of items view
// Primary tab

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init() {}
}
