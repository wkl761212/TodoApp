//
//  NewitemView.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//

import SwiftUI

struct NewitemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                TLButton(
                    title: "Save",
                    background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                    .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and selected due date newer than today or newer."))
            }
        }
    }
}

struct NewitemView_Previews: PreviewProvider {
    static var previews: some View {
        NewitemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
