//
//  TodoListitemview.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//

import SwiftUI

struct TodoListitemview: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct TodoListitemview_Previews: PreviewProvider {
    static var previews: some View {
        TodoListitemview(item: .init(id: "123", title: "Get milk", dueDate: Date() .timeIntervalSince1970, createdDate: Date() .timeIntervalSince1970, isDone: true))
    }
}
