//
//  TodoListView.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue:ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {item in
                    TodoListitemview(item: item)
                        .swipeActions {
                            Button ("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            }
                }
                    .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewitemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TodoListitemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "2iqb4EzWw2fjihgrAiAAtYoRAJL2")
    }
}
