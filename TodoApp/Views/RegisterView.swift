//
//  RegisterView.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegiesterViewViewModel()
   
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start Orgenizing...", angle: -15, background: .orange)
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email Aderess", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green) {
                    // Attemp Registration
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
